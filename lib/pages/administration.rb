require './lib/pages/translations'

# page object for the administration page
class Administration
  include RSpec::Matchers
  include Capybara::DSL
  include Translations

  def initialize(administration)
    @locale ||= administration.fetch(:locale, 'english')
    @pt_id ||= administration[:pt_id]
  end

  def open
    find('.btn', text: 'ADMIN').click
  end

  def visible?
    has_css?('h1', text: localize(spanish: 'Administración del sitio',
                                  portuguese: 'Administração do Site',
                                  english: 'Site Administration'))
  end

  def open_participants_table
    first('a', text: localize(spanish: 'Participantes',
                              portuguese: 'Participantes',
                              english: 'Participants')).click
  end

  def open_first_configuration_page
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

  def order_by_participant_id
    find('th', text: localize(spanish: 'Código del participante',
                              portuguese: 'Identificação do participante (ID)',
                              english: 'Participant ID')).click
  end

  def open_participant_configuration_page
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

  private

  def creation_button
    localize(spanish: 'Crear identificador', portuguese: 'Criar token',
             english: 'Create')
  end

  def destroy_button
    localize(spanish: 'Destruir', portuguese: 'Destruir', english: 'Destroy')
  end

  def configuration_token_success_alert
    localize(
      spanish: 'Guardado exitosamente Identificador',
      portuguese: 'Salvo com sucesso Configurar token',
      english: 'Successfully saved Configuration token'
    )
  end

  def active_configuration_token
    localize(
      spanish: "Vence en hace 28 días Valor #{%r{.+}} " \
               "No distingue mayúsculas y minúsculas",
      portuguese: "Expira em 28 dias atrás Valor #{%r{.+}} " \
                  "Não distingue maiúsculas e minúsculas",
      english: "Expires in 28 days ago Value #{%r{.+}} Case insensitive"
    )
  end

  def configuration_destroy_alert
    localize(
      spanish: 'Destruido exitosamente Identificador',
      portuguese: 'Destruído com sucesso Configurar token',
      english: 'Successfully destroyed Configuration token'
    )
  end

  def authentication_token
    localize(
      spanish: /Identificador único universal \(uuid\) del cliente .+/,
      portuguese: /Identificador Único Universal \(uuid\) do cliente .+/,
      english: /Client uuid .+/
    )
  end

  def disable_button
    localize(
      spanish: 'Desactivar',
      portuguese: 'Desativar',
      english: 'Disable'
    )
  end

  def disable_badge
    localize(
      spanish: 'Inhabilitado',
      portuguese: 'Desabilitado',
      english: 'Disabled'
    )
  end

  def successful_save_of_auth_token_alert
    localize(
      spanish: 'Guardado exitosamente Autorizar identificador',
      portuguese: 'Salvo com sucesso Autorizar Token',
      english: 'Successfully saved Authentication token'
    )
  end

  def enable_button
    localize(
      spanish: 'Activar',
      portuguese: 'Ativar',
      english: 'Enable'
    )
  end

  def auth_token_destroyed_alert
    localize(
      spanish: 'Destruido exitosamente Autorizar identificador',
      portuguese: 'Destruído com sucesso Autorizar Token',
      english: 'Successfully destroyed Authentication token'
    )
  end
end
