require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for final appointment
    module FinalAppointment
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Programada para',
            'Lugar de cita de finalización',
            'Notas',
            '¿El smartphone ha sido devuelto?'
          ],
          portuguese: [
            'Data/hora',
            'Local',
            'Anotações',
            'O telefone foi devolvido?'
          ],
          english: [
            'Date and time',
            'Location',
            'Notes',
            'Was the phone returned?'
          ]
        )
      end

      def options
        localize(
          spanish: [
            'Casa del paciente',
            'Centro de salud',
            'Otro lugar'
          ],
          portuguese: [
            'Casa do paciente',
            'Unidade de saúde',
            'Outro lugar'
          ],
          english: [
            'Patient\'s home',
            'Health unit',
            'Other location'
          ]
        )
      end
    end
  end
end
