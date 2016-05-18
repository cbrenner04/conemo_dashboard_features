# filename: ./spec/features/admin/configuration__token_spec.rb

require './spec/support/admin/configuration_token_helper'

feature 'Admin, Configuration Token', metadata: :not_first do
  background do
    english_admin.sign_in
    administration.open

    expect(administration).to be_visible

    administration.open_participants_table
  end

  scenario 'Admin creates and destroys configuration token' do
    token_page.open_first

    expect(token_page).to be_ready_for_token_creation

    token_page.create_token

    expect(token_page).to have_active_configuration_token

    token_page.destroy_token

    expect(token_page).to have_configuration_token_destroy_alert
    expect(token_page).to be_ready_for_token_creation
  end

  scenario 'Admin disables, enables, and destroys authentication token' do
    administration.order_by_participant_id
    token_page.open_for_participant

    expect(token_page).to have_active_authentication_token

    token_page.disable_auth_token

    expect(token_page).to have_disabled_authentication_token

    token_page.enable_auth_token

    expect(token_page).to have_active_authentication_token

    token_page.destroy_auth_token

    expect(token_page).to have_auth_token_destroy_alert
    expect(token_page).to be_ready_for_token_creation
  end
end

feature 'Spanish Admin, Configuration Token', metadata: :not_first do
  scenario 'Spanish Admin sees correct translations' do
    spanish_admin.sign_in
    spanish_administration.open

    expect(spanish_administration).to be_visible

    spanish_administration.open_participants_table
    spanish_token_page.open_first

    expect(spanish_token_page).to be_ready_for_token_creation

    spanish_token_page.create_token

    expect(spanish_token_page).to have_active_configuration_token

    spanish_token_page.destroy_token

    expect(spanish_token_page).to have_configuration_token_destroy_alert
    expect(spanish_token_page).to be_ready_for_token_creation

    spanish_administration.open

    expect(spanish_administration).to be_visible

    spanish_administration.open_participants_table
    spanish_administration.order_by_participant_id
    spanish_token_page.open_for_participant

    expect(spanish_token_page).to have_active_authentication_token

    spanish_token_page.disable_auth_token

    expect(spanish_token_page).to have_disabled_authentication_token

    spanish_token_page.enable_auth_token

    expect(spanish_token_page).to have_enabled_auth_token_success_alert
    expect(spanish_token_page).to have_active_authentication_token

    spanish_token_page.destroy_auth_token

    expect(spanish_token_page).to have_auth_token_destroy_alert
    expect(spanish_token_page).to be_ready_for_token_creation
  end
end

feature 'Portuguese Admin, Configuration Token', metadata: :not_first do
  scenario 'Portuguese Admin sees correct translations' do
    portuguese_admin.sign_in
    portuguese_administration.open

    expect(portuguese_administration).to be_visible

    portuguese_administration.open_participants_table
    portuguese_token_page.open_first

    expect(portuguese_token_page).to be_ready_for_token_creation

    portuguese_token_page.create_token

    expect(portuguese_token_page).to have_active_configuration_token

    portuguese_token_page.destroy_token

    expect(portuguese_token_page).to have_configuration_token_destroy_alert
    expect(portuguese_token_page).to be_ready_for_token_creation

    portuguese_administration.open

    expect(portuguese_administration).to be_visible

    portuguese_administration.open_participants_table
    portuguese_administration.order_by_participant_id
    portuguese_token_page.open_for_participant

    expect(portuguese_token_page).to have_active_authentication_token

    portuguese_token_page.disable_auth_token

    expect(portuguese_token_page).to have_disabled_authentication_token

    portuguese_token_page.enable_auth_token

    expect(portuguese_token_page).to have_enabled_auth_token_success_alert
    expect(portuguese_token_page).to have_active_authentication_token

    portuguese_token_page.destroy_auth_token

    expect(portuguese_token_page).to have_auth_token_destroy_alert
    expect(portuguese_token_page).to be_ready_for_token_creation
  end
end
