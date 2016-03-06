require './lib/pages/your_patients/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for second contact
    class FollowUpCallWeekOne
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Follow up call week one')
          .find('a', text: 'Confirm').click
      end

      def cancel
        find('.list-group-item', text: 'Follow up call week one')
          .find('input[value = "Cancel"]').click
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
        nurse_tasks.select_non_date_item(chance)
      end

      def general_notes
        'Notest are so much fun'
      end

      def enter_notes
        fill_in 'second_contact[notes]', with: general_notes
      end

      private

      def nurse_tasks
        @nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 'fake')
      end
    end
  end
end
