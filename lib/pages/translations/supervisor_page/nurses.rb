require './lib/pages/translations/supervisor_page'
require './lib/pages/translations/supervisor_page/nurses/localized_nurses.rb'

module Translations
  module SupervisorPageTranslations
    # module for Nurses on Supervisor page
    module NursesTranslations
      include Translations::SupervisorPageTranslations
      include Translations::SupervisorPageTranslations::
              NursesTranslations::LocalizedNurses

      def nurse_title
        localize(
          spanish: 'Enfermera',
          portuguese: 'Auxiliar de Engfermagem',
          english: 'Nurses'
        )
      end

      def subheadings
        localize(
          spanish: /\d+ participantes \d+ Tareas \d+ tareas atrasadas/,
          portuguese: /(?x)\d+ Participantes \d+ Tarefas \d+ Tarefas Atrasadas/,
          english: /\d+ Participants \d+ Tasks \d+ Overdue/
        )
      end

      def log_session_button
        localize(
          spanish: 'Añadir nueva supervisión',
          portuguese: 'Resgistrar Sessão de Supervisão',
          english: 'Log supervision session'
        )
      end

      def supervision_form_heading
        localize(
          spanish: 'Sesion de supervisión',
          portuguese: 'Sessão de Supervisão',
          english: 'Supervision session'
        )
      end

      def expected_questions_and_answers
        localize questions_and_answers
      end

      def last_supervision_header
        localize(
          spanish: 'Última supervisión',
          portuguese: 'Última Sessão de Supervisão',
          english: 'Last supervision session'
        )
      end

      def review_link
        localize(spanish: 'Detalles', portuguese: 'Detalhes', english: 'Review')
      end

      def expected_headers
        localize headers
      end
    end
  end
end
