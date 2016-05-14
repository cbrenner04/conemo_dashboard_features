require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for confirmation call
    module CancellationForm
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def options
        localize(
          english: [
            'Could not reach patient',
            'Patient does not want to continue in the program',
            'Patient did not have time to talk (multiple times)',
            'Patient not willing to talk to nurse (assistant)',
            'Other'
          ],
          spanish: [
            'No se pudo ubicar al paciente',
            'Paciente no desea continuar con la intervención',
            'Paciente no tuvo tiempo de hablar (repetitivamente)',
            'Paciente no estaba dispuesta/o de hablar',
            'Otra'
          ],
          portuguese: [
            'Não consegi falar com o paciente',
            'Paciente não quer continuar no programa',
            'Paciente não teve tempo para falar (várias vezes)',
            'Paciente não estava disposto/a a falar',
            'Outra razão'
          ]
        )
      end
    end
  end
end
