module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module SpanishContactInformation
      def spanish_headings
        @spanish_headings ||= [
          'Centro de salud:',
          'Telefóno fijo:',
          'Contacto de Emergencia (nombre):',
          'Teléfono fijo:', # (Contacto de Emergencia):',
          'Fecha de nacimiento:',
          'Dirección actual:',
          'Fecha de inclusión:',
          'Sexo:'
        ]
      end

      def spanish_contact_info_contact_dates
        @spanish_contact_info_contact_dates ||= [
          "Fecha y hora de contacto: #{spanish_date(Date.today - 45)}",
          "Programada para: #{spanish_date(Date.today - 42)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 35)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 21)}",
          "Fecha de la llamada: #{spanish_date(Date.today - 14)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 14)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 7)}",
          "Fecha y hora de contacto: #{spanish_date(Date.today - 1)}",
          "Programada para: #{spanish_date(Date.today)}"
        ]
      end

      def spanish_timeline_headings
        @spanish_timeline_headings ||= [
          'Lugar de cita de inicio:',
          'Duración de la sesión (minutos):',
          'Duración de la llamada (min):',
          'Razón para no-adherencia:',
          'Duración de la llamada (min):',
          'Razón para no-conectividad:',
          'Razón por la solicitud de ayuda:',
          'Lugar de cita de finalización:',
          '¿El smartphone ha sido devuelto?:'
        ]
      end
    end
  end
end
