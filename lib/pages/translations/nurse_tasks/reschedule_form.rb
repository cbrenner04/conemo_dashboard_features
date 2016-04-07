require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasksTranslations
    # translations for non adherence call
    module RescheduleFormTranslations
      include Translations::NurseTasksTranslations

      def expected_headings
        locale(
          ['Nueva fecha y hora', 'Razones',
           'Observaciones (cuadrado de texto)'],
          ['Nova data e hora', 'Motivo', 'Observações'],
          ['New date and time', 'Reason', 'Notes']
        )
      end

      def expected_options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def spanish_options
        @spanish_options ||= [
          'Paciente faltó a su cita',
          'Paciente pidió reprogramar',
          'Enfermera necesitó reprogramar',
          'La fecha programada es un día feriado.',
          'Otro motivo'
        ]
      end

      def portuguese_options
        @portuguese_options ||= [
          'Paciente não compareceu.',
          'Paciente pediu para reagendar',
          'AE precisou remarcar',
          'A data programanda é um feriado',
          'Outro motivo'
        ]
      end

      def english_options
        @english_options ||= [
          'Patient did not show up',
          'Patient asked to reschedule',
          'Nurse (assistant) needed to reschedule',
          'The programmed data is a national holiday',
          'Other'
        ]
      end
    end
  end
end
