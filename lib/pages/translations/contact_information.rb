require './lib/pages/translations'

module Translations
  # module for Contact Information page
  module ContactInformation
    include Translations

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

    def expected_headings
      localize headings
    end

    def saved_contact_information_alert
      localize(
        spanish: 'Información actualizada exitosamente',
        portuguese: 'Informações do participante atualizadas com sucesso',
        english: 'Successfully updated participant'
      )
    end

    def smartphone_creation_alert
      localize(
        spanish: 'Smartphone guardado exitosamente',
        portuguese: 'Smartphone registrado com sucesso',
        english: 'Successfully created smartphone'
      )
    end

    private

    def headings
      @headings ||= {
        spanish: [
          'Centro de salud:', 'Telefóno fijo:', 'Celular (propio):',
          'Teléfono fijo (Contacto de Emergencia):', 'Teléfono alternativo 1:',
          'Nombre de persona / Lugar del teléfono alternativo 1:',
          'Dirección actual:', 'Sexo:',
          'Número del smartphone / número de serie:', 'Código del smartphone:'
        ],
        portuguese: [
          'Unidade de Saúde da Família:', 'Telefone fixo:',
          'Celular (pessoal):', 'Telefone fixo (Contato de Emergência):',
          'Telefone alternativo 1:',
          'Nome de pessoa / lugar de telefone alternativo 1:', 'Endereço:',
          'Sexo:', 'Número do Smartphone / número de serie:',
          'Código do Smartphone:'
        ],
        english: [
          'Family health unit:', 'Telephone:', 'Cell phone:', 'Telephone:',
          'Alternate phone 1:', 'Contact person:', 'Home address:', 'Gender:',
          'Phone number / serial number:', 'Phone ID:'
        ]
      }
    end
  end
end
