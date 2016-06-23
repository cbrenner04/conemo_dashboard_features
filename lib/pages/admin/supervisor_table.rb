# frozen_string_literal: true
module Admin
  # page object for supervisor table in rails admin
  class SupervisorTable
    include Capybara::DSL

    def open
      first('a', text: 'Nurse supervisors').click
    end

    def add_new_supervisor
      click_on 'Add new'
      fill_in 'Email', with: 'new_supervisor@example.com'
      fill_in 'Phone', with: '202-555-0149'
      fill_in 'First name', with: 'New'
      fill_in 'Last name', with: 'Supervisor'
      click_on 'Save'
    end

    def has_new_supervisor?
      has_css?('.alert', text: 'Nurse supervisor successfully created') &&
        has_css?('.nurse_supervisor_row', text: 'new_supervisor@example.com')
    end
  end
end
