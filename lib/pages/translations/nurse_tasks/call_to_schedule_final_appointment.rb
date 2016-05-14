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

      def options
        localize(
          spanish: (1..10).map { |i| "Centro de salud #{i}" },
          portuguese: [
            'Adão Manoel', 'Celso Daniel', 'Dom João Nery', 'Jardim Campos',
            'Jardim Copa', 'Jardim Rubro II', 'Profeta Jeremias',
            'Santo Estevão', 'Silva Teles', 'Vila Ramos'
          ],
          english: (1..10).map { |i| "unit #{i}" }
        )
      end
    end
  end
end
