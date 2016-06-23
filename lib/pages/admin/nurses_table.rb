# frozen_string_literal: true
module Admin
  # page object for nurse table in rails Admin
  class NurseTable
    include Capybara::DSL

    def open
      first('a', text: 'Nurses').click
    end

    def add_new_nurse
      click_on 'Add new'
      fill_in 'Email', with: 'new_nurse@example.com'
      fill_in 'Phone', with: '202-555-0149'
      fill_in 'First name', with: 'New'
      fill_in 'Last name', with: 'Nurse'
      click_on 'Save'
    end

    def has_new_nurse?
      has_css?('.alert', text: 'Nurse successfully created') &&
        has_css?('.nurse_row', text: 'new_nurse@example.com')
    end
  end
end