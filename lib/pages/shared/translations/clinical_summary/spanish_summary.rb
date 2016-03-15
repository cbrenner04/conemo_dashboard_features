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
          'Cita final',
          'Call to schedule final appointment',
          'Llamada de seguimiento sem. 3',
          'Llamada de seguimiento sem. 1',
          'Cita de inicio',
          'Llamada confirmando cita'
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

      def spanish_contact_dates
        contact_day = [0, 1, 14, 35, 42, 45]
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
