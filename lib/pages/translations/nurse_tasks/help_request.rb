require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasksTranslations
    # translations for help request
    module HelpRequest
      include Translations::NurseTasksTranslations

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_responses, portuguese_responses, english_responses)
      end

      private

      def spanish_headings
        @spanish_headings ||= [
          'Fecha/hora de la llamada',
          'Razón por la solicitud de ayuda'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data da ligação',
          'Razão pelo pedido de ajuda'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Date/time of phone call',
          'Reason for help request'
        ]
      end

      def spanish_responses
        @spanish_responses ||= [
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
        ]
      end

      def portuguese_responses
        @portuguese_responses ||= [
          'Reasons',
          'Dificuldades com o CONEMO',
          'Perguntas sobre a intervenção',
          'Botão para pedir ajuda pressionado por engano',
          'Não relacionada ao CONEMO (p. ex. saúde)',
          'Outra',
          'Not done / CANCEL task',
          'Não consegi falar com o paciente',
          'Paciente não quer continuar no programa',
          'Paciente não houve tempo para falar (várias vezes)',
          'Paciente não estava disposto/a a falar com a AE',
          'Outra razão'
        ]
      end

      def english_responses
        @english_responses ||= [
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
      end
    end
  end
end
