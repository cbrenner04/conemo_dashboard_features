# filename: ./spec/features/admin/configuration__token_spec.rb

require './lib/pages/administration'

def administration
  @administration ||= Administration.new(
    locale: 'english',
    pt_id: 201
  )
end

def spanish_administration
  @spanish_administration ||= Administration.new(
    locale: 'spanish',
    pt_id: 501
  )
end

def portuguese_administration
  @portuguese_administration ||= Administration.new(
    locale: 'portuguese',
    pt_id: 601
  )
end

feature 'Admin, Configuration Token', metadata: :not_first do
  background do
    english_admin.sign_in
    administration.open

    expect(administration).to be_visible

    administration.open_participants_table
  end

  scenario 'Admin creates and destroys configuration token' do
    administration.open_first_configuration_page

    expect(administration).to be_ready_for_token_creation

    administration.create_token

    expect(administration).to have_active_configuration_token

    administration.destroy_token

    expect(administration).to have_configuration_token_destroy_alert
    expect(administration).to be_ready_for_token_creation
  end

  scenario 'Admin disables, enables, and destroys authentication token' do
    administration.order_by_participant_id
    administration.open_participant_configuration_page

    expect(administration).to have_active_authentication_token

    administration.disable_auth_token

    expect(administration).to have_disabled_authentication_token

    administration.enable_auth_token

    expect(administration).to have_active_authentication_token

    administration.destroy_auth_token

    expect(administration).to have_auth_token_destroy_alert
    expect(administration).to be_ready_for_token_creation
  end
end

feature 'Spanish Admin, Configuration Token', metadata: :not_first do
  scenario 'Spanish Admin sees correct translations' do
    spanish_admin.sign_in
    spanish_administration.open

    expect(spanish_administration).to be_visible

    spanish_administration.open_participants_table
    spanish_administration.open_first_configuration_page

    expect(spanish_administration).to be_ready_for_token_creation

    spanish_administration.create_token

    expect(spanish_administration).to have_active_configuration_token

    spanish_administration.destroy_token

    expect(spanish_administration).to have_configuration_token_destroy_alert
    expect(spanish_administration).to be_ready_for_token_creation

    spanish_administration.open

    expect(spanish_administration).to be_visible

    spanish_administration.open_participants_table
    spanish_administration.order_by_participant_id
    spanish_administration.open_participant_configuration_page

    expect(spanish_administration).to have_active_authentication_token

    spanish_administration.disable_auth_token

    expect(spanish_administration).to have_disabled_authentication_token

    spanish_administration.enable_auth_token

    expect(spanish_administration).to have_enabled_auth_token_success_alert
    expect(spanish_administration).to have_active_authentication_token

    spanish_administration.destroy_auth_token

    expect(spanish_administration).to have_auth_token_destroy_alert
    expect(spanish_administration).to be_ready_for_token_creation
  end
end

feature 'Portuguese Admin, Configuration Token', metadata: :not_first do
  scenario 'Portuguese Admin sees correct translations' do
    portuguese_admin.sign_in
    portuguese_administration.open

    expect(portuguese_administration).to be_visible

    portuguese_administration.open_participants_table
    portuguese_administration.open_first_configuration_page

    expect(portuguese_administration).to be_ready_for_token_creation

    portuguese_administration.create_token

    expect(portuguese_administration).to have_active_configuration_token

    portuguese_administration.destroy_token

    expect(portuguese_administration).to have_configuration_token_destroy_alert
    expect(portuguese_administration).to be_ready_for_token_creation

    portuguese_administration.open

    expect(portuguese_administration).to be_visible

    portuguese_administration.open_participants_table
    portuguese_administration.order_by_participant_id
    portuguese_administration.open_participant_configuration_page

    expect(portuguese_administration).to have_active_authentication_token

    portuguese_administration.disable_auth_token

    expect(portuguese_administration).to have_disabled_authentication_token

    portuguese_administration.enable_auth_token

    expect(portuguese_administration).to have_enabled_auth_token_success_alert
    expect(portuguese_administration).to have_active_authentication_token

    portuguese_administration.destroy_auth_token

    expect(portuguese_administration).to have_auth_token_destroy_alert
    expect(portuguese_administration).to be_ready_for_token_creation
  end
end
