require './lib/pages/shared/translations/nurse_tasks'

module Translations
  module NurseTasks
    # translations for lack of connectivity call
    module LackOfConnectivityCall
      include Translations::NurseTasks

      def spanish_responses
        @spanish_responses ||= [
          'Datos móviles apagados',
          'Sin cobertura de internet',
          'Se agotaron los datos móviles disponibles',
          'Celular inteligente apagado',
          'Otra',
          'No lo sé',
          'No se pudo ubicar al paciente',
          'Paciente no desea continuar con la intervención',
          'Paciente no tuvo tiempo de hablar (repetitivamente)',
          'Paciente no estaba dispuesta/o de hablar ',
          'Otra'
        ]
      end

      def portuguese_responses
        @portuguese_responses ||= [
          'Dados móveis desligados',
          'Falta de cobertura de internet',
          'Sem crédito / Pacote de dados acabou',
          'Smartphone desligado',
          'Outra',
          'Não sei',
          'Não consegi falar com o paciente',
          'Paciente não quer continuar no programa',
          'Paciente não houve tempo para falar (várias vezes)',
          'Paciente não estava disposto/a a falar com a AE',
          'Outra razão'
        ]
      end

      def english_responses
        @english_responses ||= [
          'Mobile data turned off',
          'No internet coverage',
          'Mobile plan used up',
          'Cellphone turned off',
          'Other',
          'I don\'t know',
          'Could not reach patient',
          'Patient does not want to continue in the program',
          'Patient did not have time to talk (multiple times)',
          'Patient not willing to talk to nurse (assistant)',
          'Other'
        ]
      end
    end
  end
end
