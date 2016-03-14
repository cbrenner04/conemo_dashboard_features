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
    end
  end
end
