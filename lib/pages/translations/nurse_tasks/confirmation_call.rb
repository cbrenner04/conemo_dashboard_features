require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasksTranslations
    # translations for confirmation call
    module ConfirmationCall
      include Translations::NurseTasksTranslations

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def spanish_headings
        @spanish_headings ||= [
          'Fecha y hora de contacto',
          'Cita de inicio programada para',
          'Lugar de cita de inicio'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Contactado por',
          'Primeiro encontro em',
          'Local do primeiro encontro'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Date of contact',
          'Schedule initial in person appointment',
          'Initial in person appointment location'
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
