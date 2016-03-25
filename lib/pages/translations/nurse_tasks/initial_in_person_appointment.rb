require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasks
    # translations for initial in person appointment
    module InitialInPersonAppointment
      include Translations::NurseTasks

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def spanish_headings
        @spanish_headings ||= [
          'Programada para',
          'Lugar de cita de inicio',
          'Duración de la sesión (minutos)',
          'Llamada de seguimiento sem. 1',
          'Notas'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data/hora',
          'Local',
          'Duração da sessão (minutos)',
          'Chamada de seguimento sem. 1',
          'Anotações/Impressões'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Appointment date/time',
          'Location of appointment',
          'Session length (minutes)',
          'Follow-up Call Week 1',
          'Notes'
        ]
      end

      def spanish_options
        @spanish_options ||= [
          'Casa del paciente',
          'Centro de salud',
          'Otro lugar'
        ]
      end

      def portuguese_options
        @portuguese_options ||= [
          'Casa do paciente',
          'Unidade de saúde',
          'Outro lugar'
        ]
      end

      def english_options
        @english_options ||= [
          'Patient\'s home',
          'Health unit',
          'Other location'
        ]
      end
    end
  end
end
