require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for lack of connectivity call
    module LackOfConnectivityCall
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Fecha/hora de la llamada',
            'Razón para no-conectividad'
          ],
          portuguese: [
            'Data da ligação',
            'Razão para não-conectividade'
          ],
          english: [
            'Date/time of phone call',
            'Reason for lack of connectivity'
          ]
        )
      end

      def options
        localize(
          spanish: [
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
          ],
          portuguese: [
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
          ],
          english: [
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
        )
      end
    end
  end
end
