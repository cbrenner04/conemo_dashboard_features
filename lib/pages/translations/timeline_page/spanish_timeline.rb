module Translations
  module TimelineTranslations
    # Spanish translations for contact information page
    module SpanishTimeline
      def spanish_timeline_dates
        @spanish_timeline_dates ||= [
          "Fecha y hora de contacto: #{spanish_date(Date.today - 45)}",
          "Programada para: #{spanish_date(Date.today - 42)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 35)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 21)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 14)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 14)}",
          "Fecha/hora de la llamada: #{spanish_date(Date.today - 7)}",
          "Fecha y hora de contacto: #{spanish_date(Date.today - 1)}",
          "Programada para: #{spanish_date(Date.today)}"
        ]
      end

      def spanish_timeline_headings
        @spanish_timeline_headings ||= [
          'Duración de la sesión (minutos):',
          'Lugar de cita de inicio:',
          'Duración de la llamada (min):',
          '¿El paciente ha tenido algunas dificultades usando CONEMO?:',
          'Razón para no-adherencia:',
          'Duración de la llamada (min):',
          '¿El paciente ha tenido algunas dificultades usando CONEMO?:',
          'Razón para no-conectividad:',
          'Razón por la solicitud de ayuda:',
          '¿El smartphone ha sido devuelto?:',
          'Lugar de cita de finalización:'
        ]
      end
    end
  end
end
