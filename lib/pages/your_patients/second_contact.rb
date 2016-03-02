require './lib/pages/your_patients'

class YourPatients
  # page object for second contact
  class SecondContact
    include Capybara::DSL

    def your_patients
      @your_patients ||= YourPatients.new
    end

    def assert_on_page
      find('h1', text: 'Second contact')
    end

    def fill_in_questions
      assert_on_page
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
      your_patients.select_non_date_item(chance)
    end

    def general_notes
      'Notest are so much fun'
    end

    def enter_notes
      fill_in 'second_contact[notes]', with: general_notes
    end

    def created_for_participant?(id)
      your_patients.pt_row(id).has_css?('.fa-check-circle', count: 3)
      date = DateTime.now + 21
      your_patients.check_date(id, date)
    end
  end
end