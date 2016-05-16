require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/nurse_tasks_unscheduled'

module Translations
  module NurseTaskTitles
    # translations for non adherence call
    module NonAdherenceCallTranslations
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles
      include Translations::NurseTasksUnscheduled

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
        @options ||= localize(
          spanish: spanish_options.concat(spanish_cancel_options),
          portuguese: portuguese_options.concat(portuguese_cancel_options),
          english: english_options.concat(english_cancel_options)
        )
      end

      private

      def spanish_options
        @spanish_options ||= [
          'Razón',
          'Dificultades para usar CONEMO',
          'Sin tiempo para usar CONEMO',
          'Sin voluntad de usar CONEMO',
          'Error de transferencia de datos (sesiones fueron completadas)',
          'Paciente está viajando (sin el smartphone)',
          'Razón no fue comunicada',
          'Otra'
        ]
      end

      def portuguese_options
        @portuguese_options ||= [
          'Razões',
          'Dificuldades para usar CONEMO',
          'Sem tempo para CONEMO',
          'Sem vontade de usar CONEMO',
          'Erro na transmissão de dados (sessões foram completadas)',
          'Paciente está viajando (sem smartphone)',
          'Razão não foi comunicado',
          'Outra'
        ]
      end

      def english_options
        @english_options ||= [
          'Reasons',
          'Difficulties using CONEMO',
          'No time for CONEMO',
          'Not willing to use CONEMO',
          'Failure of data transfer (sessions were completed)',
          'Patient is traveling (without the smartphone)',
          'No reason stated',
          'Other'
        ]
      end
    end
  end
end
