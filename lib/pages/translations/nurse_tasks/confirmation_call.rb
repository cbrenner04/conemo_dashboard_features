require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for confirmation call
    module ConfirmationCall
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Fecha y hora de contacto',
            'Cita de inicio programada para',
            'Lugar de cita de inicio'
          ],
          portuguese: [
            'Contactado em',
            'Primeiro encontro em',
            'Local do primeiro encontro'
          ],
          english: [
            'Date of contact',
            'Schedule initial in person appointment',
            'Initial in person appointment location'
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
