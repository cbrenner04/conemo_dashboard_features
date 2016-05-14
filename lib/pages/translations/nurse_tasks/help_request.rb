require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for help request
    module HelpRequest
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        localize(
          spanish: [
            'Fecha/hora de la llamada',
            'Razón por la solicitud de ayuda'
          ],
          portuguese: [
            'Data da ligação',
            'Razão pelo pedido de ajuda'
          ],
          english: [
            'Date/time of phone call',
            'Reason for help request'
          ]
        )
      end

      def options
        localize(
          spanish: [
            'Razón de la solicitud de ayuda',
            'Dificultades con CONEMO',
            'Pregunta sobre la intervención',
            'Botón de solicitar ayuda presionado por error',
            'No relacionado a CONEMO (p. ej. salud)',
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
            'Dificuldades com o CONEMO',
            'Perguntas sobre a intervenção',
            'Botão para pedir ajuda pressionado por engano',
            'Não relacionada ao CONEMO (p. ex. saúde)',
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
            'Difficulty using the CONEMO app',
            'Question about the intervention',
            'Pressed help button by mistake',
            'Not related to CONEMO (e.g. health)',
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
