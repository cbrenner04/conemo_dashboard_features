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
            'Notas'
          ],
          portuguese: [
            'Data/hora',
            'Local',
            'Duração da sessão (minutos)',
            'Anotações/Impressões'
          ],
          english: [
            'Appointment date/time',
            'Location of appointment',
            'Session length (minutes)',
            'Notes'
          ]
        )
      end
    end
  end
end
