# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for non adherence call
    module RescheduleFormTranslations
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: ['Programado para', 'Razones',
                    'Observaciones (cuadrado de texto)'],
          portuguese: ['Agendado para', 'Motivo', 'Observações'],
          english: ['New date and time', 'Reason', 'Notes']
        )
      end

      def expected_options
        localize(
          spanish: [
            'Paciente faltó a su cita',
            'Paciente pidió reprogramar',
            'Enfermera necesitó reprogramar',
            'La fecha programada es un día feriado.',
            'Otro motivo'
          ],
          portuguese: [
            'Paciente não compareceu.',
            'Paciente pediu para reagendar',
            'AE precisou remarcar',
            'A data programanda é um feriado',
            'Outro motivo'
          ],
          english: [
            'Patient did not show up',
            'Patient asked to reschedule',
            'Nurse (assistant) needed to reschedule',
            'The programmed data is a national holiday',
            'Other'
          ]
        )
      end
    end
  end
end
