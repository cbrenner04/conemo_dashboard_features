require './lib/pages/translations'

module Translations
  # module for administration translations
  module AdministrationTranslations
    include Translations

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
        spanish: 'Vence en hace 28 días Valor .+ ' \
                 'No distingue mayúsculas y minúsculas',
        portuguese: 'Expira em 28 dias atrás Valor .+ ' \
                    'Não distingue maiúsculas e minúsculas',
        english: 'Expires in 28 days ago Value .+ Case insensitive'
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
end
