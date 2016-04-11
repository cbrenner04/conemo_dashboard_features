module Translations
  module ClinicalSummaryTranslations
    # Spanish translations for clinical summary page
    module SpanishSummary
      def spanish_links
        @spanish_links ||= [
          'las tareas',
          'Todos los contactos realizados'
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

      def spanish_release_dates_1
        release_day = [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 24, 27, 29, 31,
                       34, 36, 38, 41]
        relative_release_date = release_day.map do |i|
          spanish_date((Date.today - @start_date_offset) + (i - 1))
        end
        @spanish_release_dates ||= relative_release_date
      end

      def spanish_release_dates_2
        release_day = [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 27, 29, 31,
                       34, 36, 38, 41]
        relative_release_date = release_day.map do |i|
          spanish_date((Date.today - @start_date_offset) + (i - 1))
        end
        @spanish_release_dates ||= relative_release_date
      end

      def spanish_contact_dates
        contact_day = [0, 14, 35, 42]
        relative_contact_date = contact_day.map do |i|
          spanish_date(Date.today - i)
        end
        @spanish_contact_dates ||= relative_contact_date
      end

      def spanish_notes_form_heading
        @spanish_notes_heading ||= "Escribir una nota de First Last-#{@id}"
      end

      def spanish_notes_form_labels
        @spanish_notes_form_labels ||=
          ['Fecha / hora de nota', 'Razones', 'Notas']
      end

      def spanish_notes_reason_options
        @spanish_notes_reason_options ||=
          ['Llamada de seguimiento programada', 'Llamada por no-adherencia',
           'Llamada solicitada por el paciente', 'Otro']
      end
    end
  end
end
