# frozen_string_literal: true
# filename: ./spec/features/admin/administration_spec.rb

require './lib/pages/administration'
require './lib/pages/admin/admin_table'
require './lib/pages/admin/devices_table'
require './lib/pages/admin/nurses_table'
require './lib/pages/admin/participants_table'
require './lib/pages/admin/supervisor_table'
require './lib/pages/admin/token_page'

def administration
  @administration ||= Administration.new(locale: 'english')
end

def admin_table
  @admin_table ||= Admin::AdminTable.new
end

def devices_table
  @devices_table ||= Admin::DevicesTable.new
end

def nurse_table
  @nurse_table ||= Admin::NurseTable.new
end

def participants_table
  @participants_table ||= Admin::ParticipantsTable.new(locale: 'english')
end

def supervisor_table
  @supervisor_table ||= Admin::SupervisorTable.new
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
    admin_table.open
    admin_table.add_new_admin

    expect(admin_table).to have_new_admin
  end

  scenario 'Admin creates a nurse supervisor' do
    supervisor_table.open
    supervisor_table.add_new_supervisor

    expect(supervisor_table).to have_new_supervisor
  end

  scenario 'Admin creates a nurse' do
    nurse_table.open
    nurse_table.add_new_nurse

    expect(nurse_table).to have_new_nurse
  end

  scenario 'Admin sees phone id under Participants' do
    participants_table.open
    participants_table.order_by_participant_id

    expect(participants_table).to have_phone_id
  end

  scenario 'Admin sees devices are scoped by locale' do
    devices_table.open

    expect(devices_table).to have_five_devices
  end

  scenario 'Admin sees device move to inactive when auth token destroyed' do
    devices_table.open

    expect(devices_table).to have_five_devices

    participants_table.open
    token_page_1000.open_for_participant

    expect(token_page_1000).to have_active_authentication_token

    token_page_1000.destroy_auth_token

    expect(token_page_1000).to have_auth_token_destroy_alert

    administration.open
    devices_table.open

    expect(devices_table).to have_four_devices

    devices_table.open_inactive_devices_table

    expect(devices_table).to have_one_inactive_device
  end
end
