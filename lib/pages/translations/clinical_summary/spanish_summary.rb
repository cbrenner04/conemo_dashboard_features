module Translations
  module ClinicalSummaryTranslations
    # Spanish translations for clinical summary page
    module SpanishSummary
      def spanish_links
        @spanish_links ||= [
          'Tareas',
          'Todos los contactos realizados'
        ]
      end

      def spanish_headers
        @spanish_headers ||= [
          'Solicitudes de ayuda',
          'Ingresos',
          'Fecha de lanzamiento',
          'Sesión',
          'Notas Write note'
        ]
      end

      def spanish_legend
        @spanish_legend ||= [
          'Unreleased',
          'Sesión actual',
          'Sesión finalizada tarde',
          'Sesión accedida, pero no finalizada',
          'Sesión no accedida',
          'Sesión finalizada a tiempo'
        ]
      end

      def spanish_release_dates_1
        [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 24, 27, 29, 31, 34, 36, 38, 41
        ].map { |i| spanish_date((Date.today - @start_date_offset) + (i - 1)) }
      end

      def spanish_release_dates_2
        [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 27, 29, 31, 34, 36, 38, 41
        ].map { |i| spanish_date((Date.today - @start_date_offset) + (i - 1)) }
      end

      def spanish_contact_dates
        [0, 14, 35, 42].map { |i| spanish_date(Date.today - i) }
      end

      def spanish_notes_form_heading
        @spanish_notes_heading ||= "Escribir una nota de First Last-#{@id}"
      end

      def spanish_notes_form_labels
        @spanish_notes_form_labels ||= ['Fecha / hora de nota', 'Notas']
      end
    end
  end
end
