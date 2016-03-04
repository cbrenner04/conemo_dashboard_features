require './lib/pages/your_patients/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for the First Appointment Form in Active Participants
    class InitialInPersonAppointment
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Initial in person appointment')
          .find('a', text: 'Confirm').click
      end

      def cancel
        find('.list-group-item', text: 'Initial in person appointment')
          .find('input[value = "Cancel"]').click
      end

      def visible?
        has_css?('h1', text: 'Initial in person appointment')
      end

      def enter_location
        nurse_tasks.enter_location(5)
      end

      def general_notes
        'Who takes notes?'
      end

      def enter_general_notes
        fill_in 'first_appointment[notes]', with: general_notes
      end

      # def created_for_participant?(id)
      #   your_patients.pt_row(id).has_css?('.fa-check-circle', count: 2)
      #   date = DateTime.now + 7
      #   your_patients.check_date(id, date)
      # end

      private

      def nurse_tasks
        @nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 'fake')
      end
    end
  end
end
