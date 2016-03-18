require './lib/pages/shared/translations/nurse_tasks'

module Translations
  module NurseTasks
    # translations for non adherence call
    module NonAdherenceCallTranslations
      include NurseTasks

      def spanish_responses
        @spanish_responses ||= [
          'Dificultades para usar CONEMO',
          'Sin tiempo para usar CONEMO',
          'Sin voluntad de usar CONEMO',
          'Error de transferencia de datos (sesiones fueron completadas)',
          'Paciente está viajando (sin el smartphone)',
          'Razón no fue comunicadao',
          'Otra',
          'No se pudo ubicar al paciente',
          'Paciente no desea continuar con la intervención',
          'Paciente no tuvo tiempo de hablar (repetitivamente)',
          'Paciente no estaba dispuesta/o de hablar ',
          'Otra'
        ]
      end

      def portuguese_responses
        @portuguese_responses ||= [
          'Dificuldades para usar CONEMO',
          'Sem tempo para CONEMO',
          'Sem vontade de usar CONEMO',
          'Erro na transmissão de dados (sessões foram completadas)',
          'Paciente está viajando (sem smartphone)',
          'Razão não foi comunicado',
          'Outra',
          'Não consegi falar com o paciente',
          'Paciente não quer continuar no programa',
          'Paciente não houve tempo para falar (várias vezes)',
          'Paciente não estava disposto/a a falar com a AE',
          'Outra razão'
        ]
      end

      def english_responses
        @english_responses ||= [
          'Difficulties using CONEMO',
          'No time for CONEMO',
          'Not willing to use CONEMO',
          'Failure of data transfer (sessions were completed)',
          'Patient is traveling (without the smartphone)',
          'No reason stated',
          'Other',
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
