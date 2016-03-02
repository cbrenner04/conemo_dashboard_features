require './lib/pages/your_patients'

class YourPatients
  # page object for first contact page of active participants
  class FinalAppointment
    include Capybara::DSL

    def your_patients
      @your_patients ||= YourPatients.new
    end

    def assert_on_page
      find('h1', text: 'Final Appointment')
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

    def created_for_participant?(id)
      your_patients.pt_row(id).has_css?('.fa-check-circle', count: 5)
    end
  end
end
