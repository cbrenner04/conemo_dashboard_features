require './lib/pages/translations'
Dir['./lib/pages/translations/contact_information/*.rb']
  .each { |file| require file }

module Translations
  # module for Contact Information page
  module ContactInformation
    include Translations
    include Translations::ContactInformation::SpanishContactInformation
    include Translations::ContactInformation::PortugueseContactInformation
    include Translations::ContactInformation::EnglishContactInformation

    def contact_information_title
      locale('Información de contacto', 'Informações de contato',
             'Contact Information')
    end

    def smartphone_information_title
      locale('Smartphone', 'Informações de Smartphone',
             'Smartphone Information')
    end

    def phone_number_header
      locale('Número del Smartphone', 'Número do Smartphone', 'Phone number')
    end

    def serial_number_header
      locale('Número de Serie', 'Código do Smartphone', 'Serial number')
    end

    def expected_headings
      locale(spanish_headings, portuguese_headings, english_headings)
    end
  end
end
