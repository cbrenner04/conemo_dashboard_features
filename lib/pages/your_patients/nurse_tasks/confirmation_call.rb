require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class ConfirmationCall
      include Capybara::DSL
      include NurseTasksForms

      def active?
        has_list_item?('Confirmation call')
        has_active_progress_bar_item?('Confirmation call')
      end

      def confirm
        confirm_task('Confirmation call')
        visible?
      end

      def visible?
        has_css?('h1', text: 'Confirmation call')
      end

      def enter_first_appt_location
        enter_task_location(10)
      end

      def cancel
        cancel_task('Confirmation call')
      end

      def canceled?
        has_no_list_item?('Confirmation call')
        has_canceled_progress_bar_item?('Confirmation call')
      end

      def complete?
        has_no_list_item?('Confirmation call')
        has_complete_progress_bar_item?('Confirmation call')
      end
    end
  end
end
