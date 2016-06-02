# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/nurse_tasks_unscheduled'

module Translations
  module NurseTaskTitles
    # translations for lack of connectivity call
    module LackOfConnectivityCall
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles
      include Translations::NurseTasksUnscheduled

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
          'Datos móviles apagados',
          'Sin cobertura de internet',
          'Se agotaron los datos móviles disponibles',
          'Celular inteligente apagado',
          'Otra',
          'No lo sé'
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
          'Não sei'
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
          'I don\'t know'
        ]
      end
    end
  end
end
