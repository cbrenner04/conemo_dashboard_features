require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for lack of connectivity call
    module LackOfConnectivityCall
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def spanish_headings
        @spanish_headings ||= [
          'Fecha/hora de la llamada',
          'Razón para no-conectividad'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data da ligação',
          'Razão para não-conectividade'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Date/time of phone call',
          'Reason for lack of connectivity'
        ]
      end

      def spanish_options
        @spanish_options ||= [
          'Razón',
          'Datos móviles apagados',
          'Sin cobertura de internet',
          'Se agotaron los datos móviles disponibles',
          'Celular inteligente apagado',
          'Otra',
          'No lo sé',
          'CANCELAR llamada (no realizada)',
          'No se pudo ubicar al paciente',
          'Paciente no desea continuar con la intervención',
          'Paciente no tuvo tiempo de hablar (repetitivamente)',
          'Paciente no estaba dispuesta/o de hablar',
          'Otra'
        ]
      end

      def portuguese_options
        @portuguese_options ||= [
          'Razões',
          'Dados móveis desligados',
          'Falta de cobertura de internet',
          'Sem crédito / Pacote de dados acabou',
          'Smartphone desligado',
          'Outra',
          'Não sei',
          'Não realizado / Cancelar tarefa',
          'Não consegui falar com o paciente',
          'Paciente não quer continuar no programa',
          'Paciente não teve tempo para falar (várias vezes)',
          'Paciente não estava disposto/a a falar',
          'Outra razão'
        ]
      end

      def english_options
        @english_options ||= [
          'Reasons',
          'Mobile data turned off',
          'No internet coverage',
          'Mobile plan used up',
          'Cellphone turned off',
          'Other',
          'I don\'t know',
          'Not done / CANCEL task',
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
