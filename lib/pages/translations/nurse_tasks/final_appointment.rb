require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasks
    # translations for final appointment
    module FinalAppointment
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
          'Lugar de cita de finalización',
          'Notas',
          '¿El smartphone ha sido devuelto?'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data/hora',
          'Local',
          'Anotações',
          'O telefone foi devolvido?'
        ]
      end

      def english_headings
        @english_options ||= [
          'Date and time',
          'Location',
          'Notes',
          'Was the phone returned?'
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
