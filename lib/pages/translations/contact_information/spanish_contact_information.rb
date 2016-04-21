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
          'Fecha de inclusión:',
          'Sexo:'
        ]
      end
    end
  end
end
