module Translations
  module SupervisorPageTranslations
    module NursesTranslations
      # module for Nurses on Supervisor page
      module LocalizedNurses
        def questions_and_answers
          @questions_and_answers ||= {
            spanish: spanish_q_and_a,
            portuguese: portuguese_q_and_a,
            english: english_q_and_a
          }
        end

        def headers
          @headers ||= {
            spanish: [
              'Fecha/hora',
              'Duración (min)',
              'Tipo de reunión',
              'Tipo de contacto',
              'Temas discutidos'
            ],
            portuguese: [
              'Data/hora',
              'Duração da chamada (minutos)',
              'Tipo de reunião',
              'Tipo de contato',
              'Assuntos discutidos'
            ],
            english: [
              'Session at',
              'Session length',
              'Meeting kind',
              'Contact kind',
              'Discussed topic(s)'
            ]
          }
        end

        private

        def spanish_q_and_a
          @spanish_q_and_a ||= [
            'Duración (min)', 'Tipo de reunión', 'Grupal',
            'Individual', 'Tipo de contacto', 'Llamada telefónica',
            'En persona', 'Temas discutidos', 'Cita de inicio',
            'Dificultad de contactarse con el paciente',
            'Solicitud de ayuda no resuelta', 'Llamada por no-conectividad',
            'No-adherencia', 'Dificultades del paciente con CONEMO',
            'Tareas atrasadas / Adherencia de la enfermera',
            'Tareas canceladas',
            'Eventos adversos serios (mencionados por la enfermera)',
            'Suspensión del Tratamiento', 'Dudas sobre las tareas',
            'Dudas sobre la intervención', 'Otros contactos programados',
            'Solicitudes de ayuda resueltos',
            'Situaciones difíciles para la enfermera relacionados al estudio',
            'Asuntos administrativos', 'Contactos adicionales', 'Otro'
          ]
        end

        def portuguese_q_and_a
          @portuguese_q_and_a ||= [
            'Duração da chamada (minutos)', 'Tipo de reunião',
            'Em grupo', 'Individual', 'Tipo de contato', 'por telefone',
            'presencial', 'Assuntos discutidos', 'Encontro inicial',
            'Dificuldades em contatar participante',
            'Pedido de ajuda não resolvido', 'Chamada por não-conectividade',
            'Não aderência', 'Dificuldades do paciente com CONEMO',
            'Tarefas atrasadas / Aderência da/o AE', 'Tarefas canceladas',
            'Eventos adversos sérios (mencionados pela/o AE)',
            'Términos de Tratamento', 'Dúvidad com respeito às tarefas',
            'Dúvidas com respeito à intervenção',
            'Outros pontos de contato programados',
            'Pedidos de ajuda resolvidos',
            'Situações difíceis relacionadas ao estudo',
            'Questões Administrativas', 'Contatos adicionais', 'Outros'
          ]
        end

        def english_q_and_a
          @english_q_and_a ||= [
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
            'intervention/study', 'Administrative issues',
            'Additional contacts', 'Others'
          ]
        end
      end
    end
  end
end
