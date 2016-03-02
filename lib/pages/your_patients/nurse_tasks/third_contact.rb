require './lib/pages/your_patients'

class YourPatients
  # page object for first contact page of active participants
  class ThirdContact
    include Capybara::DSL

    def your_patients
      @your_patients ||= YourPatients.new
    end

    def assert_on_page
      find('h1', text: 'Third contact')
    end

    def enter_final_appt_location
      fill_in 'third_contact[final_appointment_location]',
              with: '100 West Ln, Chicago, IL 60601'
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
      your_patients.pt_row(id).has_css?('.fa-check-circle', count: 4)
      date = DateTime.now + 14
      your_patients.check_date(id, date)
    end
  end
end
