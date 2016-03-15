module Translations
  module ClinicalSummary
    # Spanish translations for clinical summary page
    module SpanishSummary
      def spanish_links
        @spanish_links ||= [
          'participant contact information page',
          'Sesiones'
        ]
      end

      def spanish_headers
        @spanish_headers ||= [
          'Mensajes',
          'Ingresos',
          'Fecha de lanzamiento',
          'Sesión',
          'Notas Write note'
        ]
      end

      def spanish_legend
        @spanish_legend ||= [
          'Unreleased',
          'Current',
          'Completed late',
          'Accessed but not completed',
          'Not accessed',
          'Completed on time'
        ]
      end

      def spanish_notes_headers
        @spanish_notes_headers ||= [
          'Final appointment',
          'Call to schedule final appointment',
          'Third contact',
          'Second contact',
          'First appointment'
        ]
      end

      def spanish_release_dates
        release_day = [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 24, 27, 29, 31,
                       34, 36, 38, 41]
        relative_release_date = release_day.map do |i|
          spanish_date((Date.today - @start_date_offset) + (i - 1))
        end
        @spanish_release_dates ||= relative_release_date
      end
    end
  end
end
