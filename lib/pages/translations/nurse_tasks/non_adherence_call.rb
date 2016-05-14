require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for non adherence call
    module NonAdherenceCallTranslations
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Fecha/hora de la llamada',
            'Razón para no-adherencia'
          ],
          portuguese: [
            'Data da ligação',
            'Razão para não aderência'
          ],
          english: [
            'Date/time of phone call',
            'Reason for non-adherence'
          ]
        )
      end

      def options
        localize(
          spanish: [
            'Razón',
            'Dificultades para usar CONEMO',
            'Sin tiempo para usar CONEMO',
            'Sin voluntad de usar CONEMO',
            'Error de transferencia de datos (sesiones fueron completadas)',
            'Paciente está viajando (sin el smartphone)',
            'Razón no fue comunicada',
            'Otra',
            'CANCELAR llamada (no realizada)',
            'No se pudo ubicar al paciente',
            'Paciente no desea continuar con la intervención',
            'Paciente no tuvo tiempo de hablar (repetitivamente)',
            'Paciente no estaba dispuesta/o de hablar',
            'Otra'
          ],
          portuguese: [
            'Razões',
            'Dificuldades para usar CONEMO',
            'Sem tempo para CONEMO',
            'Sem vontade de usar CONEMO',
            'Erro na transmissão de dados (sessões foram completadas)',
            'Paciente está viajando (sem smartphone)',
            'Razão não foi comunicado',
            'Outra',
            'Não realizado / Cancelar tarefa',
            'Não consegui falar com o paciente',
            'Paciente não quer continuar no programa',
            'Paciente não teve tempo para falar (várias vezes)',
            'Paciente não estava disposto/a a falar',
            'Outra razão'
          ],
          english: [
            'Reasons',
            'Difficulties using CONEMO',
            'No time for CONEMO',
            'Not willing to use CONEMO',
            'Failure of data transfer (sessions were completed)',
            'Patient is traveling (without the smartphone)',
            'No reason stated',
            'Other',
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
