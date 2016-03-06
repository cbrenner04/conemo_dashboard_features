class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class FinalAppointment
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Final in person appointment')
          .find('a', text: 'Confirm').click
      end

      def cancel
        find('.list-group-item', text: 'Final in person appointment')
          .find('input[value = "Cancel"]').click
      end

      def visible?
        has_css?('h1', text: 'Final in person appointment')
      end

      def enter_location
        fill_in 'final_appointment[appointment_location]',
                with: '100 West Ln, Chicago, IL 60601'
      end

      def general_notes
        'Final notes'
      end

      def enter_notes
        fill_in 'final_appointment[notes]', with: general_notes
      end

      def choose_phone_returned
        resp = ['true', 'false'].sample
        find("#final_appointment_phone_returned_#{resp}").click
      end

      def choose_phone_returned_negative
        find('#final_appointment_phone_returned_false').click
      end
    end
  end
end
