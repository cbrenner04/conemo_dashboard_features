# filename: ./spec/features/admin/administration_spec.rb

require './lib/pages/administration'
require './lib/pages/admin/token_page'

def administration
  @administration ||= Administration.new(locale: 'english')
end

def token_page_1000
  @token_page_1000 ||= Admin::TokenPage.new(pt_id: 1000)
end

feature 'Admin, Administration', metadata: :last do
  background do
    english_admin.sign_in
    administration.open

    expect(administration).to be_visible
  end

  scenario 'Admin creates an admin' do
    administration.open_admin_table
    administration.add_new_admin

    expect(administration).to have_new_admin
  end

  scenario 'Admin creates a nurse supervisor' do
    administration.open_supervisor_table
    administration.add_new_supervisor

    expect(administration).to have_new_supervisor
  end

  scenario 'Admin creates a nurse' do
    administration.open_nurse_table
    administration.add_new_nurse

    expect(administration).to have_new_nurse
  end

  scenario 'Admin sees phone id under Participants' do
    administration.open_participants_table
    administration.order_by_participant_id

    expect(administration).to have_phone_id
  end

  scenario 'Admin sees devices are scoped by locale' do
    administration.open_devices_table

    expect(administration).to have_three_devices
  end

  scenario 'Admin sees device move to inactive when auth token destroyed' do
    administration.open_devices_table

    expect(administration).to have_three_devices

    administration.open_participants_table
    administration.order_by_participant_id
    token_page_1000.open_for_participant

    expect(token_page_1000).to have_active_authentication_token

    token_page_1000.destroy_auth_token

    expect(token_page_1000).to have_auth_token_destroy_alert

    administration.open
    administration.open_devices_table

    expect(administration).to have_two_devices

    administration.open_inactive_devices_table

    expect(administration).to have_one_inactive_device
  end
end
