# frozen_string_literal: true
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
    end
  end
end
