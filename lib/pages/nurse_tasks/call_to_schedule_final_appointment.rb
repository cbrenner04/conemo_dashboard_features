require './lib/pages/nurse_tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'
translations_path = './lib/pages/translations/'
require "#{translations_path}nurse_tasks/call_to_schedule_final_appointment"

class NurseTasks
  # page object for call to schedule final appointment task
  class CallToScheduleFinalAppointment
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::CallToScheduleFinalAppointment

    def initialize(call_to_schedule_final_appointment)
      @locale ||= call_to_schedule_final_appointment.fetch(:locale, 'english')
    end

    def active?
      has_list_item?(call_to_schedule_final_title) &&
        has_active_progress_bar_item?(call_to_schedule_final_title)
    end

    def complete?
      has_no_list_item?(call_to_schedule_final_title) &&
        has_complete_progress_bar_item?(call_to_schedule_final_title)
    end

    def canceled?
      has_no_list_item?(call_to_schedule_final_title) &&
        has_canceled_progress_bar_item?(call_to_schedule_final_title)
    end

    def overdue?
      has_list_item?(call_to_schedule_final_title) &&
        has_overdue_progress_bar_item?(call_to_schedule_final_title)
    end

    def rescheduled?
      has_no_list_item?(call_to_schedule_final_title) &&
        has_scheduled_progress_bar_item?(call_to_schedule_final_title)
    end

    def confirm
      confirm_task call_to_schedule_final_title
      visible?
    end

    def cancel
      cancel_task call_to_schedule_final_title
    end

    def open_reschedule_form
      open_reschedule call_to_schedule_final_title
    end

    def visible?
      has_css?('h1', text: call_to_schedule_final_title)
    end

    def enter_next_contact_date
      select_next_date(7)
    end

    def update_contact_at_to_today
      find('.select2-container', match: :first)
      selector[1].click
      select_list_item((Date.today + 1).strftime('%B'))
      selector[2].click
      today_int = Date.today.strftime('%-d').to_i
      if today_int < 10
        first('.select2-result-label', text: today_int).click
      else
        select_list_item(Date.today.strftime('%-d'))
      end
    end

    def toggle_options_list
      selector[10].click
    end

    def select_location
      find('.select2-container', match: :first)
      selector[10].click
      location = (2..9).map { |i| "unit #{i}" }
      find('.select2-result-label', text: location.sample).click
    end

    def has_form_headings?
      has_task_form_headings?(2)
    end

    def has_current_date_selections?
      has_date_selectors?(Date.today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_hour_selector?(3)
    end

    def has_next_contact_date?
      has_date_selectors?(Date.today, 6,
                          localize(spanish: 5, portuguese: 5, english: 7),
                          localize(spanish: 7, portuguese: 7, english: 5)) &&
        has_time_selectors?(8, 9)
    end

    def has_location_options?
      has_task_options?(10, 9, localize(health_unit_options))
    end

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(call_to_schedule_final_title)
    end

    private

    def cancel_form
      @cancel_form ||= NurseTasks::CancelForm.new(locale: @locale)
    end
  end
end
