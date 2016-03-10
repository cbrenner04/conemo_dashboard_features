require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class FinalAppointment
      include Capybara::DSL
      include NurseTasksForms

      def initialize
        @task_name ||= 'Final in person appointment'
      end

      def scheduled?
        has_no_list_item? @task_name
        has_scheduled_progress_bar_item? @task_name
      end

      def active?
        has_list_item? @task_name
        has_active_progress_bar_item? @task_name
      end

      def canceled?
        has_no_list_item? @task_name
        has_canceled_progress_bar_item? @task_name
      end

      def complete?
        has_no_list_item? @task_name
        has_complete_progress_bar_item? @task_name
      end

      def confirm
        confirm_task @task_name
        visible?
      end

      def cancel
        cancel_task @task_name
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

      def enter_location
        fill_in 'final_appointment[appointment_location]',
                with: '100 West Ln, Chicago, IL 60601'
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
    end
  end
end
