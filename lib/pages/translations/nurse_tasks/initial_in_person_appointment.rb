require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for initial in person appointment
    module InitialInPersonAppointment
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Programada para',
            'Lugar de cita de inicio',
            'Duración de la sesión (minutos)',
            'Llamada de seguimiento sem. 1',
            'Notas'
          ],
          portuguese: [
            'Data/hora',
            'Local',
            'Duração da sessão (minutos)',
            'Chamada de seguimento sem. 1',
            'Anotações/Impressões'
          ],
          english: [
            'Appointment date/time',
            'Location of appointment',
            'Session length (minutes)',
            'Follow-up Call Week 1',
            'Notes'
          ]
        )
      end
    end
  end
end
