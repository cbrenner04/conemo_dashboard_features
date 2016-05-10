require './lib/pages/translations/supervisor_page'

module Translations
  module SupervisorPageTranslations
    # module for Nurses on Supervisor page
    module NursesTranslations
      include Translations::SupervisorPageTranslations

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

      private

      def spanish_questions_and_answers
        @spanish_questions_and_answers ||= [
          'Duración (min)', 'Tipo de reunión', 'Grupal',
          'Individual', 'Tipo de contacto', 'Llamada telefónica',
          'En persona', 'Temas discutidos', 'Cita de inicio',
          'Dificultad de contactarse con el paciente',
          'Solicitud de ayuda no resuelta', 'Llamada por no-conectividad',
          'No-adherencia', 'Dificultades del paciente con CONEMO',
          'Tareas atrasadas / Adherencia de la enfermera', 'Tareas canceladas',
          'Eventos adversos serios (mencionados por la enfermera)', 'Dropouts',
          'Dudas sobre las tareas', 'Dudas sobre la intervención',
          'Otros contactos programados', 'Solicitudes de ayuda resueltos',
          'Situaciones difíciles para la enfermera relacionados al estudio',
          'Asuntos administrativos', 'Contactos adicionales', 'Otro'
        ]
      end

      # Dificultades will be updated to Dificuldades
      # Administrative issues will need to be added
      def portuguese_questions_and_answers
        @portuguese_questions_and_answers ||= [
          'Duração da chamada (minutos)', 'Tipo de reunião',
          'Em grupo', 'Individual', 'Tipo de contato', 'por telefone',
          'presencial', 'Assuntos discutidos', 'Encontro inicial',
          'Dificultades em contatar participante',
          'Pedido de ajuda não resolvido', 'Chamada por não-conectividade',
          'Não aderência', 'Dificuldades do paciente com CONEMO',
          'Tarefas atrasadas / Aderência da/o AE', 'Tarefas canceladas',
          'Eventos adversos serios (mencionados pela/o AE)', 'Dropouts',
          'Dúvidad com respeito ás tarefas',
          'Dúvidas com respeito á intervenção',
          'Outros pontos de contato programados',
          'Pedidos de ajuda resolvidos',
          'Situações difíceis relacionadas ao estudo', 'Contatos adicionais',
          'Outros'
        ]
      end

      def english_questions_and_answers
        @english_questions_and_answers ||= [
          'Session length', 'Meeting kind', 'Group',
          'Individual ', 'Contact kind', 'Phone', 'In person',
          'Discussed topic(s)', 'First appointments',
          'Difficulty to contact patient', 'Non-resolved help requests',
          'Non connectivity calls', 'Non-adherence',
          'Patient’s difficulties with CONEMO',
          'Overdue tasks / Nurse adherence', 'Canceled tasks',
          'Serious adverse events (if nurse brings it up)', 'Dropouts',
          'Uncertainties related to tasks', 'Questions about intervention',
          'Other programmed contact points', 'Resolved help requests',
          'Difficult situations for the nurse related to the ' \
          'intervention/study', 'Administrative issues', 'Additional contacts',
          'Others'
        ]
      end
    end
  end
end
