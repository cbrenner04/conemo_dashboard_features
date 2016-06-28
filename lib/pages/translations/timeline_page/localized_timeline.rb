# frozen_string_literal: true
module Translations
  module TimelineTranslations
    # Spanish translations for contact information page
    module LocalizedTimeline
      def timeline_dates
        @timeline_dates ||= {
          spanish: spanish_timeline_dates,
          portuguese: portuguese_timeline_dates,
          english: english_timeline_dates
        }
      end

      def timeline_headings
        @timeline_headings ||= {
          spanish: spanish_timeline_headings,
          portuguese: portuguese_timeline_headings,
          english: english_timeline_headings
        }
      end

      private

      def spanish_timeline_dates
        fourteen_days_ago = standard_date(today - 14)
        @spanish_timeline_dates ||= [
          "Fecha y hora de contacto: #{standard_date(today - 45)}",
          "Programada para: #{standard_date(today - 42)}",
          "Fecha/hora de la llamada: #{standard_date(today - 35)}",
          "Fecha/hora de la llamada: #{standard_date(today - 21)}",
          "Fecha/hora de la llamada: #{fourteen_days_ago}",
          "Fecha/hora de la llamada: #{fourteen_days_ago}",
          "Fecha/hora de la llamada: #{standard_date(today - 7)}",
          "Fecha y hora de contacto: #{standard_date(yesterday)}",
          "Programada para: #{standard_date(today)}"
        ]
      end

      def portuguese_timeline_dates
        fourteen_days_ago = standard_date(today - 14)
        @portuguese_timeline_dates ||= [
          "Contactado em: #{standard_date(today - 45)}",
          "Data/hora: #{standard_date(today - 42)}",
          "Data/hora: #{standard_date(today - 35)}",
          "Data da ligação: #{standard_date(today - 21)}",
          "Data/hora: #{fourteen_days_ago}",
          "Data da ligação: #{fourteen_days_ago}",
          "Data da ligação: #{standard_date(today - 7)}",
          "Data da ligação: #{standard_date(yesterday)}",
          "Data/hora: #{standard_date(today)}"
        ]
      end

      def english_timeline_dates
        @english_timeline_dates ||= [
          "Date of contact: #{standard_date(today - 45)}",
          "Appointment date/time: #{standard_date(today - 42)}",
          "Date of phone call: #{standard_date(today - 35)}",
          "Contact At: #{standard_date(today - 14)}",
          "Date/time of phone call: #{standard_date(yesterday)}",
          "Date and time: #{standard_date(today)}"
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

      def portuguese_timeline_headings
        @portuguese_timeline_headings ||= [
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
        ]
      end

      def english_timeline_headings
        @english_timeline_headings ||= [
          'Location of appointment:',
          'Session length (minutes):',
          'Length of phone call (minutes):',
          'Length of phone call (minutes):',
          'Location:',
          'Was the phone returned?'
        ]
      end
    end
  end
end
