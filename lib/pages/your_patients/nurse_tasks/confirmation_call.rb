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

      def enter_first_appt_location
        fill_in 'first_contact[first_appointment_location]',
                with: '100 West Ln, Chicago, IL 60601'
      end

      def complete?
      end
    end
  end
end
