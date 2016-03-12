require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for call to schedule final appointment task
    class CallToScheduleFinalAppointment
      include Capybara::DSL
      include NurseTasksForms

      def initialize
        @task_name ||= 'Call to schedule final appointment'
      end

      def scheduled?
        has_no_list_item?(@task_name) &&
          has_scheduled_progress_bar_item?(@task_name)
      end

      def active?
        has_list_item?(@task_name) &&
          has_active_progress_bar_item?(@task_name)
      end

      def complete?
        has_no_list_item?(@task_name) &&
          has_complete_progress_bar_item?(@task_name)
      end

      def canceled?
        has_no_list_item?(@task_name) &&
          has_canceled_progress_bar_item?(@task_name)
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

      def enter_next_contact_date
        select_next_date(7)
      end

      def has_next_contact_date?
        next_week = Date.today + 7
        selector[6].has_text?(next_week.strftime('%B')) &&
          selector[7].has_text?(next_week.strftime('%-d'))
      end

      def select_location
        sleep(1)
        selector[10].click
        location = []
        (2..9).each { |i| location.push("unit #{i}") }
        find('.select2-result-label', text: location.sample).click
      end
    end
  end
end
