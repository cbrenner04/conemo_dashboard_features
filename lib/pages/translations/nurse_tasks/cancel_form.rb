require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasksTranslations
    # translations for confirmation call
    module CancellationForm
      include Translations::NurseTasksTranslations

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def english_options
        @english_options ||= [
          'Could not reach patient',
          'Patient does not want to continue in the program',
          'Patient did not have time to talk (multiple times)',
          'Patient not willing to talk to nurse (assistant)',
          'Other'
        ]
      end

      def spanish_options
        @spanish_options ||= [
          'No se pudo ubicar al paciente',
          'Paciente no desea continuar con la intervención',
          'Paciente no tuvo tiempo de hablar (repetitivamente)',
          'Paciente no estaba dispuesta/o de hablar',
          'Otra'
        ]
      end

      def portuguese_options
        @protuguese_options ||= [
          'Não consegi falar com o paciente',
          'Paciente não quer continuar no programa',
          'Paciente não houve tempo para falar (várias vezes)',
          'Paciente não estava disposto/a a falar com a AE',
          'Outra razão'
        ]
      end
    end
  end
end
