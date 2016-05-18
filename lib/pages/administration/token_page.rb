require './lib/pages/translations/administration'

class Administration
  # page object for the configuration and authentication token page
  class TokenPage
    include Capybara::DSL
    include Translations::AdministrationTranslations

    def initialize(token_page)
      @locale ||= token_page.fetch(:locale, 'english')
      @pt_id ||= token_page[:pt_id]
    end

    def open_first
      first('a', text: 'Show').click
    end

    def ready_for_token_creation?
      has_css?("input[value = \"#{creation_button}\"]")
    end

    def create_token
      click_on creation_button
    end

    def has_active_configuration_token?
      has_css?('.alert', text: configuration_token_success_alert) &&
        has_text?(/#{active_configuration_token}/) &&
        has_css?("input[value = \"#{destroy_button}\"]")
    end

    def destroy_token
      click_on destroy_button
    end

    def has_configuration_token_destroy_alert?
      has_css?('.alert', text: configuration_destroy_alert)
    end

    def open_for_participant
      find('tr', text: "Last-#{@pt_id}").find('a', text: 'Show').click
    end

    def has_active_authentication_token?
      has_content?(authentication_token) &&
        has_css?("input[value = \"#{disable_button}\"]") &&
        has_css?("input[value = \"#{destroy_button}\"]")
    end

    def disable_auth_token
      click_on disable_button
    end

    def has_disabled_authentication_token?
      has_css?('.alert', text: successful_save_of_auth_token_alert) &&
        has_css?('.label-danger', text: disable_badge) &&
        has_css?("input[value = \"#{enable_button}\"]")
    end

    def enable_auth_token
      click_on enable_button
    end

    def has_enabled_auth_token_success_alert?
      has_css?('.alert', text: successful_save_of_auth_token_alert)
    end

    def destroy_auth_token
      click_on destroy_button
      accept_alert localize(spanish: '¿Estás seguro?',
                            portuguese: 'Está certo disto?',
                            english: 'Are you sure?')
    end

    def has_auth_token_destroy_alert?
      has_css?('.alert', text: auth_token_destroyed_alert)
    end
  end
end
