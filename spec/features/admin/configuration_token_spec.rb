# filename: ./spec/features/admin/configuration__token_spec.rb

require './lib/pages/administration'

def administration
  @administration ||= Administration.new
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
    administration.open_pt_201_configuration_page

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
  scenario 'Spanish Admin sees correct translations'
end

feature 'Portuguese Admin, Configuration Token', metadata: :not_first do
  scenario 'Portuguese Admin sees correct translations'
end
