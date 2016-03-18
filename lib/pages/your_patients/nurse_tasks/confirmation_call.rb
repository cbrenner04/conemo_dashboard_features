require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations/nurse_tasks/confirmation_call'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class ConfirmationCall
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks::ConfirmationCall

      def initialize(confirmation_call)
        @locale ||= confirmation_call[:locale]
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

      def scheduled?
        has_no_list_item?(confirmation_call_title) &&
          has_scheduled_progress_bar_item?(confirmation_call_title)
      end

      def confirm
        confirm_task confirmation_call_title
        visible?
      end

      def open_reschedule_form
        open_reschedule confirmation_call_title
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def visible?
        has_css?('h1', text: confirmation_call_title)
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
        cancel_task confirmation_call_title
      end

      def has_form_headings?
        has_task_form_headings?(2)
      end

      def has_site_options?
        has_task_options?(10, 2)
      end

      def has_current_date_selections?
        has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
          has_time_selectors?(3, 4, Time.now)
      end

      def has_next_contact_date_selections?
        has_date_selectors?(Date.today, 6, locale(5, 5, 7), locale(7, 7, 5)) &&
          has_time_selectors?(8, 9, Time.now)
      end
    end
  end
end
