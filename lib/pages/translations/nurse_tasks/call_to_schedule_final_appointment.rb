require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for Call to schedule final appointment
    module CallToScheduleFinalAppointment
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Fecha y hora de contacto',
            'Cita final para',
            'Lugar de cita final'
          ],
          portuguese: [
            'Data da ligação',
            'Encontro Final em',
            'Local do Encontro Final'
          ],
          english: [
            'Date/time of phone call',
            'Final in person appointment date and time',
            'Final appointment location'
          ]
        )
      end
    end
  end
end
