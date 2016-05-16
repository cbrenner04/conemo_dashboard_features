require './lib/pages/nurse_tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/final_appointment'

class NurseTasks
  # page object for first contact page of active participants
  class FinalAppointment
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::FinalAppointment

    def initialize(final_appointment)
      @locale ||= final_appointment.fetch(:locale, 'english')
    end

    def active?
      has_list_item?(final_appointment_title) &&
        has_active_progress_bar_item?(final_appointment_title)
    end

    def canceled?
      has_no_list_item?(final_appointment_title) &&
        has_canceled_progress_bar_item?(final_appointment_title)
    end

    def complete?
      has_no_list_item?(final_appointment_title) &&
        has_complete_progress_bar_item?(final_appointment_title)
    end

    def overdue?
      has_list_item?(final_appointment_title) &&
        has_overdue_progress_bar_item?(final_appointment_title)
    end

    def rescheduled?
      has_no_list_item?(final_appointment_title) &&
        has_scheduled_progress_bar_item_with_time?(final_appointment_title)
    end

    def confirm
      confirm_task final_appointment_title
      visible?
    end

    def cancel
      cancel_task final_appointment_title
    end

    def open_reschedule_form
      open_reschedule final_appointment_title
    end

    def visible?
      has_css?('h1', text: final_appointment_title)
    end

    def enter_location
      enter_task_location(5)
    end

    def toggle_options_list
      selector[5].click
    end

    def general_notes
      'Final notes'
    end

    def enter_notes
      fill_in 'final_appointment[notes]', with: general_notes
    end

    def choose_phone_returned
      resp = ['true', 'false'].sample
      find("#final_appointment_phone_returned_#{resp}").click
    end

    def choose_phone_returned_negative
      find('#final_appointment_phone_returned_false').click
    end

    def has_form_headings?
      has_task_form_headings?(3)
    end

    def has_current_date_selections?
      has_date_selectors?(Date.today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_hour_selector?(3)
    end

    def has_location_options?
      has_task_options?(5, 2, location_options)
    end

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(final_appointment_title)
    end

    private

    def cancel_form
      @cancel_form ||= NurseTasks::CancelForm.new(locale: @locale)
    end
  end
end
