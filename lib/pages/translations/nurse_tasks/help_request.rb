require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/nurse_tasks_unscheduled'

module Translations
  module NurseTaskTitles
    # translations for help request
    module HelpRequest
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles
      include Translations::NurseTasksUnscheduled

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
          spanish: spanish_options.concat(spanish_cancel_options),
          portuguese: portuguese_options.concat(portuguese_cancel_options),
          english: english_options.concat(english_cancel_options)
        )
      end

      private

      def spanish_options
        @spanish_options ||= [
          'Razón de la solicitud de ayuda',
          'Dificultades con CONEMO',
          'Pregunta sobre la intervención',
          'Botón de solicitar ayuda presionado por error',
          'No relacionado a CONEMO (p. ej. salud)',
          'Otra'
        ]
      end

      def portuguese_options
        @portuguese_options ||= [
          'Razões',
          'Dificuldades com o CONEMO',
          'Perguntas sobre a intervenção',
          'Botão para pedir ajuda pressionado por engano',
          'Não relacionada ao CONEMO (p. ex. saúde)',
          'Outra'
        ]
      end

      def english_options
        @english_options ||= [
          'Reasons',
          'Difficulty using the CONEMO app',
          'Question about the intervention',
          'Pressed help button by mistake',
          'Not related to CONEMO (e.g. health)',
          'Other'
        ]
      end
    end
  end
end
