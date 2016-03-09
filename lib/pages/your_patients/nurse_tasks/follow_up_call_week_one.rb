require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for second contact
    class FollowUpCallWeekOne
      include Capybara::DSL
      include NurseTasksForms

      def scheduled?
        min = has_text?('1 minute ago') ? 1 : 'less than a'
        has_no_list_item? "Follow up call week one #{min}  minute ago"
        has_scheduled_progress_bar_item? 'Follow up call week one'
      end

      def active?
        has_list_item?('Follow up call week one')
        has_active_progress_bar_item?('Follow up call week one')
      end

      def complete?
        has_no_list_item?('Follow up call week one')
        has_complete_progress_bar_item?('Follow up call week one')
      end

      def canceled?
        has_no_list_item?('Follow up call week one')
        has_canceled_progress_bar_item?('Follow up call week one')
      end

      def confirm
        confirm_task('Follow up call week one')
        visible?
      end

      def cancel
        cancel_task('Follow up call week one')
      end

      def visible?
        has_css?('h1', text: 'Follow up call week 1')
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
        selector = page.all('.select2-container')
        selector[12].click
        chance = ['3 – Very probable', '2 – 50/50 (more or less probable)',
                  '1 – Not probable'].sample
        select_non_date_item(chance)
      end

      def general_notes
        'Notest are so much fun'
      end

      def enter_notes
        fill_in 'second_contact[notes]', with: general_notes
      end
    end
  end
end
