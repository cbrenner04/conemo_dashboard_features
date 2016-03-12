require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class FollowUpCallWeekThree
      include Capybara::DSL
      include NurseTasksForms

      def initialize
        @task_name ||= 'Follow up call week three'
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
        has_css?('h1', text: 'Follow up call week 3')
      end

      def respond_to_questions
        fill_in 'third_contact[q1]', with: 'q1 response'
        (2..5).each do |i|
          execute_script('window.scrollBy(0,150)')
          radio = ['true', 'false'].sample
          find("#third_contact_q#{i}_#{radio}").click
          fill_in "third_contact[q#{i}_notes]", with: "q#{i} notes"
        end
      end

      def general_notes
        'Notes notes notes notes'
      end

      def enter_general_notes
        fill_in 'third_contact[notes]', with: general_notes
      end
    end
  end
end
