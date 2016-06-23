# frozen_string_literal: true
module Admin
  # page object for admin user table in rails admin
  class AdminTable
    include Capybara::DSL

    def open
      first('a', text: 'Admins').click
    end

    def add_new_admin
      click_on 'Add new'
      fill_in 'Email', with: 'new_admin@example.com'
      fill_in 'Phone', with: '202-555-0149'
      fill_in 'First name', with: 'New'
      fill_in 'Last name', with: 'Admin'
      find('.ra-filtering-select-input').set('en')
      click_on 'Save'
    end

    def has_new_admin?
      has_css?('.alert', text: 'Admin successfully created') &&
        has_css?('.admin_row', text: 'new_admin@example.com')
    end
  end
end