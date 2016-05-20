require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/tasks/cancel_form'
require './lib/pages/translations/nurse_tasks/confirmation_call'

module Tasks
  # page object for first contact page of active participants
  class ConfirmationCall
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::ConfirmationCall

    def initialize(confirmation_call)
      @locale ||= confirmation_call.fetch(:locale, 'english')
    end

    def active?
      has_list_item?(confirmation_call_title) &&
        has_active_progress_bar_item?(confirmation_call_title)
    end

    def canceled?
      has_no_list_item?(confirmation_call_title) &&
        has_canceled_progress_bar_item?(confirmation_call_title)
    end

    def complete?
      has_no_list_item?(confirmation_call_title) &&
        has_complete_progress_bar_item?(confirmation_call_title)
    end

    def overdue?
      has_list_item?(confirmation_call_title) &&
        has_overdue_progress_bar_item?(confirmation_call_title)
    end

    def rescheduled?
      has_no_list_item?(confirmation_call_title) &&
        has_scheduled_progress_bar_item?(confirmation_call_title)
    end

    def confirm
      execute_script 'window.scrollBy(0,100)'
      confirm_task confirmation_call_title
      visible?
    end

    def open_reschedule_form
      visible?
      execute_script 'window.scrollBy(0,100)'
      open_reschedule confirmation_call_title
    end

    def visible?
      has_text? confirmation_call_title
    end

    def visible_on_timeline?
      has_css?('.timeline-title', text: confirmation_call_title)
    end

    def enter_next_contact_date
      select_next_date(7)
    end

    def toggle_options_list
      selector[10].click
    end

    def enter_first_appt_location
      enter_task_location(10)
    end

    def cancel
      visible?
      execute_script 'window.scrollBy(0,100)'
      cancel_task confirmation_call_title
    end

    def has_form_headings?
      has_task_form_headings?(2)
    end

    def has_site_options?
      has_task_options?(10, 2, location_options)
    end

    def has_current_date_selections?
      has_date_selectors?(today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_time_selectors?(3, 4)
    end

    def has_next_contact_date_selections?
      has_date_selectors?(today, 6,
                          localize(spanish: 5, portuguese: 5, english: 7),
                          localize(spanish: 7, portuguese: 7, english: 5)) &&
        has_time_selectors?(8, 9)
    end

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(confirmation_call_title)
    end

    def has_time_ago_in_words?
      has_text? localize(
        spanish: 'hace cerca de 2 horas',
        portuguese: 'aproximadamente 2 horas atrás',
        english: 'about 2 hours ago'
      )
    end

    private

    def cancel_form
      @cancel_form ||= Tasks::CancelForm.new(locale: @locale)
    end
  end
end
