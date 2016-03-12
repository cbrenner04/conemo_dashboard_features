require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class ConfirmationCall
      include Capybara::DSL
      include NurseTasksForms

      def initialize
        @task_name ||= 'Confirmation call'
      end

      def active?
        has_list_item?(@task_name) &&
          has_active_progress_bar_item?(@task_name)
      end

      def canceled?
        has_no_list_item?(@task_name) &&
          has_canceled_progress_bar_item?(@task_name)
      end

      def complete?
        has_no_list_item?(@task_name) &&
          has_complete_progress_bar_item?(@task_name)
      end

      def scheduled?
        has_no_list_item?(@task_name) &&
          has_scheduled_progress_bar_item?(@task_name)
      end

      def confirm
        confirm_task @task_name
        visible?
      end

      def open_reschedule_form
        open_reschedule @task_name
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def visible?
        has_css?('h1', text: @task_name)
      end

      def enter_next_contact_date
        select_next_date(7)
      end

      def enter_first_appt_location
        enter_task_location(10)
      end

      def cancel
        cancel_task @task_name
      end
    end
  end
end
