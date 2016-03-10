require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for the First Appointment Form in Active Participants
    class InitialInPersonAppointment
      include Capybara::DSL
      include NurseTasksForms

      def initialize
        @task_name ||= 'Initial in person appointment'
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

      def scheduled?
        has_no_list_item? @task_name
        has_scheduled_progress_bar_item? @task_name
      end

      def visible?
        has_css?('h1', text: @task_name)
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

      def has_next_contact_date?
        next_week = Date.today + 7
        selector[6].has_text? next_week.strftime('%B')
        selector[7].has_text? next_week.strftime('%-d')
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
    end
  end
end
