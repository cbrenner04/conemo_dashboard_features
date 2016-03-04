require './lib/pages/your_patients/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class FollowUpCallWeekThree
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Follow up call week three')
          .find('a', text: 'Confirm').click
      end

      def cancel
        find('.list-group-item', text: 'Follow up call week three')
          .find('input[value = "Cancel"]').click
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

      def created_for_participant?(id)
        nurse_tasks.pt_row(id).has_css?('.fa-check-circle', count: 4)
        date = DateTime.now + 14
        nurse_tasks.check_date(id, date)
      end

      private

      def nurse_tasks
        @nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 'fake')
      end
    end
  end
end
