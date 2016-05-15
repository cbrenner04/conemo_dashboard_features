require './lib/pages/nurse_tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'
translations_path = './lib/pages/translations/'
require "#{translations_path}nurse_tasks/initial_in_person_appointment"

class NurseTasks
  # page object for the First Appointment Form in Active Participants
  class InitialInPersonAppointment
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::InitialInPersonAppointment

    def initialize(initial_in_person_appointment)
      @locale ||= initial_in_person_appointment.fetch(:locale, 'english')
    end

    def active?
      has_list_item?(initial_appointment_title) &&
        has_active_progress_bar_item?(initial_appointment_title)
    end

    def canceled?
      has_no_list_item?(initial_appointment_title) &&
        has_canceled_progress_bar_item?(initial_appointment_title)
    end

    def complete?
      has_no_list_item?(initial_appointment_title) &&
        has_complete_progress_bar_item?(initial_appointment_title)
    end

    def overdue?
      has_list_item?(initial_appointment_title) &&
        has_overdue_progress_bar_item?(initial_appointment_title)
    end

    def rescheduled?
      has_no_list_item?(initial_appointment_title) &&
        has_scheduled_progress_bar_item?(initial_appointment_title)
    end

    def visible?
      has_css?('h1', text: initial_appointment_title)
    end

    def confirm
      execute_script 'window.scrollBy(0,100)'
      confirm_task initial_appointment_title
      visible?
    end

    def cancel
      has_text? initial_appointment_title
      execute_script 'window.scrollBy(0,100)'
      cancel_task initial_appointment_title
    end

    def open_reschedule_form
      has_text? initial_appointment_title
      execute_script 'window.scrollBy(0,100)'
      open_reschedule initial_appointment_title
    end

    def reschedule
      open_reschedule_form
      reschedule_task
    end

    def enter_next_contact_date
      select_next_date(8)
    end

    def toggle_options_list
      selector[5].click
    end

    def enter_location
      enter_task_location(5)
    end

    def general_notes
      'Who takes notes?'
    end

    def enter_general_notes
      fill_in 'first_appointment[notes]', with: general_notes
    end

    def has_form_headings?
      has_task_form_headings?(4)
    end

    def has_current_date_selections?
      has_date_selectors?(Date.today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_hour_selector?(3)
    end

    def has_site_options?
      has_task_options?(5, 2, location_options)
    end

    def has_next_contact_date?
      next_week = Date.today + 7
      has_date_selectors?(next_week, 7,
                          localize(spanish: 6, portuguese: 6, english: 8),
                          localize(spanish: 8, portuguese: 8, english: 6)) &&
        has_hour_selector?(9)
    end

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(initial_appointment_title)
    end

    private

    def cancel_form
      @cancel_form ||= NurseTasks::CancelForm.new(locale: @locale)
    end
  end
end
