module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module SpanishContactInformation
      def spanish_headings
        @spanish_headings ||= [
          'Centro de salud:',
          'Telefóno fijo:',
          'Celular (propio):',
          'Teléfono fijo (Contacto de Emergencia):',
          'Teléfono alternativo 1:',
          'Nombre de persona / Lugar del teléfono alternativo 1:',
          'Dirección actual:',
          'Sexo:',
          'Número del smartphone / número de serie:',
          'Código del smartphone:'
        ]
      end
    end
  end
end
