require './lib/pages/translations/nurse_tasks'

module Translations
  module NurseTasksTranslations
    # translations for non adherence call
    module NonAdherenceCallTranslations
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
          'Razón para no-adherencia'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data da ligação',
          'Razão para não aderência'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Date/time of phone call',
          'Reason for non-adherence'
        ]
      end

      def spanish_responses
        @spanish_responses ||= [
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
        ]
      end

      def portuguese_responses
        @portuguese_responses ||= [
          'Reasons',
          'Dificuldades para usar CONEMO',
          'Sem tempo para CONEMO',
          'Sem vontade de usar CONEMO',
          'Erro na transmissão de dados (sessões foram completadas)',
          'Paciente está viajando (sem smartphone)',
          'Razão não foi comunicado',
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
      end
    end
  end
end
