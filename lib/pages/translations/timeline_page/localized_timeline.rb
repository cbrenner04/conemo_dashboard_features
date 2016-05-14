module Translations
  module TimelineTranslations
    # Spanish translations for contact information page
    module LocalizedTimeline
      def timeline_dates
        @timeline_dates ||= {
          spanish: [
            "Fecha y hora de contacto: #{locale_date(Date.today - 45)}",
            "Programada para: #{locale_date(Date.today - 42)}",
            "Fecha/hora de la llamada: #{locale_date(Date.today - 35)}",
            "Fecha/hora de la llamada: #{locale_date(Date.today - 21)}",
            "Fecha/hora de la llamada: #{locale_date(Date.today - 14)}",
            "Fecha/hora de la llamada: #{locale_date(Date.today - 14)}",
            "Fecha/hora de la llamada: #{locale_date(Date.today - 7)}",
            "Fecha y hora de contacto: #{locale_date(Date.today - 1)}",
            "Programada para: #{locale_date(Date.today)}"
          ],
          portuguese: [
            "Contactado em: #{locale_date(Date.today - 45)}",
            "Data/hora: #{locale_date(Date.today - 42)}",
            "Data/hora: #{locale_date(Date.today - 35)}",
            "Data da ligação: #{locale_date(Date.today - 21)}",
            "Data/hora: #{locale_date(Date.today - 14)}",
            "Data da ligação: #{locale_date(Date.today - 14)}",
            "Data da ligação: #{locale_date(Date.today - 7)}",
            "Data da ligação: #{locale_date(Date.today - 1)}",
            "Data/hora: #{locale_date(Date.today)}"
          ],
          english: [
            "Date of contact: #{locale_date(Date.today - 45)}",
            "Appointment date/time: #{locale_date(Date.today - 42)}",
            "Date of phone call: #{locale_date(Date.today - 35)}",
            "Contact At: #{locale_date(Date.today - 14)}",
            "Date/time of phone call: #{locale_date(Date.today - 1)}",
            "Date and time: #{locale_date(Date.today)}"
          ]
        }
      end

      def timeline_headings
        @timeline_headings ||= {
          spanish: [
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
          ],
          portuguese: [
            'Duração da sessão (minutos):',
            'Local:',
            'Duração da chamada (minutos):',
            'O paciente tem tido dificuldades com CONEMO?:',
            'Razão para não aderência:',
            'Duração da chamada (minutos):',
            'O paciente tem tido dificuldades com CONEMO?:',
            'Razão para não-conectividade:',
            'Razão pelo pedido de ajuda:',
            'O telefone foi devolvido?:',
            'Local:'
          ],
          english: [
            'Location of appointment:',
            'Session length (minutes):',
            'Length of phone call (minutes):',
            'Length of phone call (minutes):',
            'Location:',
            'Was the phone returned?'
          ]
        }
      end
    end
  end
end
