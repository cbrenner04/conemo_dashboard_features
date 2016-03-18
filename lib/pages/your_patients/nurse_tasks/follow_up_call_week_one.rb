require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations/nurse_tasks/follow_up_call_week_one'

class YourPatients
  class NurseTasks
    # page object for second contact
    class FollowUpCallWeekOne
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks::FollowUpCallWeekOne

      def initialize(follow_up_call_week_one)
        @locale ||= follow_up_call_week_one[:locale]
      end

      def scheduled?
        has_no_list_item?(follow_up_week_one_title) &&
          has_scheduled_progress_bar_item?(follow_up_week_one_title)
      end

      def active?
        has_list_item?(follow_up_week_one_title) &&
          has_active_progress_bar_item?(follow_up_week_one_title)
      end

      def complete?
        has_no_list_item?(follow_up_week_one_title) &&
          has_complete_progress_bar_item?(follow_up_week_one_title)
      end

      def canceled?
        has_no_list_item?(follow_up_week_one_title) &&
          has_canceled_progress_bar_item?(follow_up_week_one_title)
      end

      def confirm
        confirm_task follow_up_week_one_title
        visible?
      end

      def cancel
        cancel_task follow_up_week_one_title
      end

      def open_reschedule_form
        open_reschedule follow_up_week_one_title
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def visible?
        has_css?('h1', text: follow_up_week_one_title)
      end

      def fill_in_questions
        fill_in 'second_contact[q1]', with: 'q1 response'
        (2..7).each do |i|
          execute_script('window.scrollBy(0,150)')
          radio = ['true', 'false'].sample
          find("#second_contact_q#{i}_#{radio}").click
          fill_in "second_contact[q#{i}_notes]", with: "q#{i} notes"
        end
      end

      def select_chances
        selector[12].click
        chance = ['3 – Very probable', '2 – 50/50 (more or less probable)',
                  '1 – Not probable'].sample
        select_list_item(chance)
      end

      def toggle_options_list
        selector[5].click
      end

      def general_notes
        'Notes are so much fun'
      end

      def enter_notes
        fill_in 'second_contact[notes]', with: general_notes
      end

      def has_form_headings?
        has_task_form_headings?(5)
      end

      def has_current_date_selections?
        has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
          has_hour_selector?(3, Time.now)
      end

      def has_difficulties_options?
        has_task_options?(5, 5)
      end

      def has_next_contact_date?
        next_contact = Date.today + 14
        has_date_selectors?(next_contact, 7, locale(6, 6, 8),
                            locale(8, 8, 6)) && has_hour_selector?(9, Time.now)
      end
    end
  end
end
