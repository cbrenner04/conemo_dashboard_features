require './lib/pages/your_patients/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class ConfirmationCall
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Confirmation call')
          .find('a', text: 'Confirm').click
        find('h1', text: 'Confirmation call')
      end

      def visible?
        has_css?('h1', text: 'Confirmation call')
      end

      def enter_first_appt_location
        nurse_tasks.enter_location(10)
      end

      def cancel
        find('.list-group-item', text: 'Confirmation call')
          .find('input[value = "Cancel"]').click
      end

      def complete?
      end

      private

      def nurse_tasks
        @nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 'fake')
      end
    end
  end
end
