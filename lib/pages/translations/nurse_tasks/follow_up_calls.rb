require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/nurse_tasks_unscheduled'

module Translations
  module NurseTaskTitles
    # translations for follow up calls
    module FollowUpCalls
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles
      include Translations::NurseTasksUnscheduled

      def expected_headings
        localize(
          spanish: [
            'Fecha/hora de la llamada',
            'Duración de la llamada (min)',
            '¿El paciente ha tenido algunas dificultades usando CONEMO?',
            'Observaciones (cuadrado de texto)'
          ],
          portuguese: [
            'Data/hora',
            'Duração da chamada (minutos)',
            'O paciente tem tido dificuldades com CONEMO?',
            'Anotações'
          ],
          english: [
            'Date of phone call',
            'Length of phone call (minutes)',
            'Did the patient have any difficulties using CONEMO?',
            'Notes'
          ]
        )
      end

      def options
        localize(spanish: spanish_options, portuguese: portuguese_options,
                 english: english_options)
      end

      def difficulty_directions
        localize(
          spanish: 'Si el participante no ha tenido dificultades, por favor ' \
                   'selecciona "El paciente no tuvo dificultades" bajo el ' \
                   'título "NO". Si el participante tuvo dificultades, ' \
                   'selecciona todas las dificultades que tuvo el ' \
                   'participante. Por favor NO marques respuestas bajo el ' \
                   'título "NO" y el título "SÍ" al mismo tiempo.',
          portuguese: 'Se o participante não teve dificuldades, por favor, ' \
                      'selecione "NÃO". Se o participante teve dificuldades, ' \
                      'selecione todas as dificuldades que o participante ' \
                      'teve. Por favor, NÃO SELECIONE "NÃO" e outras opções ' \
                      'em sua resposta.',
          english: 'If the participant did not have difficulties, please ' \
                   'select "NO". If the participant did have difficulties, ' \
                   'select all of the difficulties a participant had. ' \
                   'Please DO NOT mark "No" AND certain dificulties at the ' \
                   'same time.'
        )
      end

      private

      def spanish_options
        @spanish_options ||= [
          'NO',
          'El paciente no tuvo dificultades',
          'Sí',
          'Dificultades con el celular inteligente ' \
          '(batería, contraseña, encenderlo, volumen)',
          'Dificultades para entrar a CONEMO',
          'Dificultades para leer las sesiones',
          'Dificultades para ver los videos',
          'Dificultades para seleccionar actividades',
          'Otras dificultades'
        ]
      end

      def portuguese_options
        @portuguese_options ||= [
          'NãO',
          'O participante não teve dificuldades',
          'SIM',
          'Dificuldade com o smartphone (bateria, PIN, ligar, volume, etc.)',
          'Dificuldade para entrar no CONEMO app',
          'Dificuldade para ler sessões',
          'Dificuldade para ver vídeo(s)',
          'Dificuldade na seleção de atividades',
          'Outras dificuldades'
        ]
      end

      def english_options
        @english_options ||= [
          'NO',
          'Patient had no difficulty',
          'YES',
          'Difficulty with cell phone (battery, PIN code, turning it on, ' \
          'volume, etc.)',
          'Difficulty accessing CONEMO app',
          'Difficulty reading sessions',
          'Difficulty watching video(s)',
          'Difficulties with activity selection',
          'Other difficulties'
        ]
      end
    end
  end
end
