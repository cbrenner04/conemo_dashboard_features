require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class ConfirmationCall
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks

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

      def enter_first_appt_location
        enter_task_location(10)
      end

      def cancel
        cancel_task confirmation_call_title
      end
    end
  end
end
