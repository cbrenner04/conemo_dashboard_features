class ActiveParticipants
  # page_object for nurse page
  class Nurse
    include Capybara::DSL
    include RSpec::Matchers

    def open(id)
      find('tr', text: "Last-#{id}, First")
        .find('a', text: 'Nurse-400, English').click
    end

    def edit(id, nurse)
      open(id)
      select "Nurse-#{nurse}, English", from: 'participant[nurse_id]'
      click_on 'Save'
    end

    def assert_new_nurse(id, nurse)
      row = find('tr', text: "Last-#{id}, First")
      expect(row).to have_content "Nurse-#{nurse}, English"
    end
  end
end
