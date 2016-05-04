module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module SpanishContactInformation
      def spanish_headings
        @spanish_headings ||= [
          'Centro de salud:',
          'Telefóno fijo:',
          'Contacto de Emergencia (nombre):',
          'Teléfono fijo (Contacto de Emergencia):',
          'Fecha de nacimiento:',
          'Dirección actual:',
          'Sexo:',
          'Número del smartphone / número de serie:',
          'Código del smartphone:'
        ]
      end
    end
  end
end
