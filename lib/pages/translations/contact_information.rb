# frozen_string_literal: true
require './lib/pages/translations'
require './lib/pages/translations/' \
        'contact_information/localized_contact_information'

module Translations
  # module for Contact Information page
  module ContactInformation
    include Translations
    include Translations::ContactInformation::LocalizedContactInformation

    def contact_information_title
      localize(
        spanish: 'Información de contacto',
        portuguese: 'Informações de contato',
        english: 'Contact information'
      )
    end

    def smartphone_information_title
      localize(
        spanish: 'Smartphone',
        portuguese: 'Informações de Smartphone',
        english: 'Smartphone Information'
      )
    end

    def phone_number_header
      localize(
        spanish: 'Número del smartphone / número de serie:',
        portuguese: 'Número do Smartphone / número de serie:',
        english: 'Phone number / serial number:'
      )
    end

    def serial_number_header
      localize(
        spanish: 'Código del smartphone:',
        portuguese: 'Código do Smartphone:',
        english: 'Phone ID:'
      )
    end

    def view_all_button
      localize(
        spanish: 'Mostrar todo',
        portuguese: 'Ver tudo',
        english: 'See all'
      )
    end

    def expected_headings
      localize(
        spanish: spanish_headings,
        portuguese: portuguese_headings,
        english: english_headings
      )
    end

    def expected_extra_headings
      localize(
        spanish: spanish_extras,
        portuguese: portuguese_extras,
        english: english_extras
      )
    end

    def saved_contact_information_alert
      localize(
        spanish: 'Información actualizada satisfactoriamente',
        portuguese: 'Informações do participante atualizadas com sucesso',
        english: 'Successfully updated participant'
      )
    end

    def smartphone_creation_alert
      localize(
        spanish: 'Smartphone guardado satisfactoriamente',
        portuguese: 'Smartphone registrado com sucesso',
        english: 'Successfully created smartphone'
      )
    end
  end
end
