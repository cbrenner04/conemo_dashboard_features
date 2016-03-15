module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module SpanishContactInformation
      def spanish_headings
        @spanish_headings ||= [
          'Código del participante:',
          'Centro de salud:',
          'Número de historia clínica:',
          'Número de teléfono:',
          'Contacto de emergencia:',
          'Teléfono de contacto de emergencia:',
          'Correo electrónico:',
          'Fecha de nacimiento:',
          'Dirección:',
          'Fecha de inclusión en el estudio:',
          'Sexo:',
          'Enfermedad crónica principal:'
        ]
      end

      def spanish_timeline_titles
        @spanish_timeline_titles ||= [
          'Llamada confirmando cita',
          'Cita de inicio',
          'Llamada de seguimiento sem. 1',
          'Llamada de seguimiento sem. 3',
          'Call to schedule final appointment',
          'Cita final'
        ]
      end

      def spanish_contact_dates
        @spanish_contact_dates ||= [
          "Fecha y hora de contacto: #{spanish_date(Date.today - 45)}",
          "Programada para: #{spanish_date(Date.today - 42)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 35)}",
          "Fecha de la llamada: #{spanish_date(Date.today - 14)}",
          "Fecha y hora de contacto: #{spanish_date(Date.today - 1)}",
          "Programada para: #{spanish_date(Date.today)}"
        ]
      end

      def spanish_timeline_headings
        @spanish_timeline_headings ||= [
          'Lugar de cita de inicio:',
          'Duración de la sesión (minutos):',
          'Duración de la llamada (min):',
          'Duración de la llamada (min):',
          'Lugar de cita de finalización:',
          '¿El smartphone ha sido devuelto?:'
        ]
      end
    end
  end
end
