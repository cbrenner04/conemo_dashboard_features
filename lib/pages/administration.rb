# page object for the administration page
class Administration
  include RSpec::Matchers
  include Capybara::DSL

  def open
    find('.btn', text: 'ADMIN').click
  end

  def visible?
    has_css?('h1', text: 'Site Administration')
  end

  def open_participants_table
    first('a', text: 'Participants').click
  end

  def open_first_configuration_page
    first('a', text: 'Show').click
  end

  def ready_for_token_creation?
    has_css?('input[value = "Create"]')
  end

  def create_token
    click_on 'Create'
  end

  def has_active_configuration_token?
    has_content?(/Expires in 28 days ago Value .+ Case insensitive/) &&
      has_css?('input[value = "Destroy"]')
  end

  def destroy_token
    click_on 'Destroy'
  end

  def has_configuration_token_destroy_alert?
    has_css?('.alert', text: 'Successfully destroyed Configuration token')
  end

  def order_by_participant_id
    find('th', text: 'Participant ID').click
  end

  def open_pt_201_configuration_page
    find('tr', text: 'Last-201').find('a', text: 'Show').click
  end

  def has_active_authentication_token?
    has_content?(/Client uuid .+/) &&
      has_css?('input[value = "Disable"]') &&
      has_css?('input[value = "Destroy"]')
  end

  def disable_auth_token
    click_on 'Disable'
  end

  def has_disabled_authentication_token?
    has_css?('.label-danger', text: 'Disabled') &&
      has_css?('input[value = "Enable"]')
  end

  def enable_auth_token
    click_on 'Enable'
  end

  def destroy_auth_token
    click_on 'Destroy'
    accept_alert 'Are you sure?'
  end

  def has_auth_token_destroy_alert?
    has_css?('.alert', text: 'Successfully destroyed Authentication token')
  end
end
