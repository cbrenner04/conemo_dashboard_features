require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for follow up call week 3
    module FollowUpCallWeekThree
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      def difficulty_directions
        locale(
          'Si el participante no ha tenido dificultades, por favor selecciona' \
          ' "NO". Si el participante tuvo dificultades, selecciona todas las' \
          ' dificultades que tuvo el participante. Por favor NO marques "No"' \
          ' Y algunas dificultades al mismo tiempo.',
          'Se o participante não teve dificuldades, por favor, selecione ' \
          '"NÃO". Se o participante teve dificuldades, selecione todas as ' \
          'dificuldades que o participante teve. Por favor, NÃO SELECIONE ' \
          '"NÃO" e outras opções em sua resposta.',
          'If the participant did not have difficulties, please select "NO".' \
          ' If the participant did have difficulties, select all of the ' \
          'difficulties a participant had. Please DO NOT mark "No" AND ' \
          'certain dificulties at the same time.'
        )
      end

      private

      def spanish_headings
        @spanish_headings ||= [
          'Fecha/hora de la llamada',
          'Duración de la llamada (min)',
          '¿El paciente ha tenido algunas dificultades usando CONEMO?',
          'Observaciones (cuadrado de texto)'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data da ligação',
          'Duração da chamada (minutos)',
          'O paciente tem tido dificuldades com CONEMO?',
          'Anotações'
        ]
      end

      def english_headings
        @english_options ||= [
          'Date of phone call',
          'Length of phone call (minutes)',
          'Did the patient have any difficulties using CONEMO?',
          'Notes'
        ]
      end

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
