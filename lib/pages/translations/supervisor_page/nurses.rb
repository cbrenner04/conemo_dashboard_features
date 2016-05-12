require './lib/pages/translations/supervisor_page'
Dir['./lib/pages/translations/supervisor_page/nurses/*.rb']
  .each { |file| require file }

module Translations
  module SupervisorPageTranslations
    # module for Nurses on Supervisor page
    module NursesTranslations
      include Translations::SupervisorPageTranslations
      include Translations::SupervisorPageTranslations::
              NursesTranslations::EnglishNurses
      include Translations::SupervisorPageTranslations::
              NursesTranslations::SpanishNurses
      include Translations::SupervisorPageTranslations::
              NursesTranslations::PortugueseNurses

      def nurse_title
        locale('Enfermera', 'Auxiliar de Engfermagem', 'Nurses')
      end

      def subheadings
        locale(
          /\d+ participantes \d+ Tareas \d+ tareas atrasadas/,
          /\d+ Participantes \d+ Tarefas \d+ Tarefas Atrasadas/,
          /\d+ Participants \d+ Tasks \d+ Overdue/
        )
      end

      def log_session_button
        locale('Añadir nueva supervisión', 'Resgistrar Sessão de Supervisão',
               'Log supervision session')
      end

      def supervision_form_heading
        locale('Añadir nueva supervisión', 'Sessão de Supervisão',
               'Supervision session')
      end

      def expected_questions_and_answers
        locale(spanish_questions_and_answers, portuguese_questions_and_answers,
               english_questions_and_answers)
      end

      def last_supervision_header
        locale('Última supervisión', 'Última Sessão de Supervisão',
               'Last supervision session')
      end

      def review_link
        locale('Detalles', 'Detalhes', 'Review')
      end

      def expected_headers
        locale(spanish_headers, portuguese_headers, english_headers)
      end
    end
  end
end
