module Translations
  module SupervisorPageTranslations
    module NursesTranslations
      # module for Nurses on Supervisor page
      module LocalizedNurses
        def questions_and_answers
          @questions_and_answers ||= {
            spanish: [
              'Duración (min)', 'Tipo de reunión', 'Grupal',
              'Individual', 'Tipo de contacto', 'Llamada telefónica',
              'En persona', 'Temas discutidos', 'Cita de inicio',
              'Dificultad de contactarse con el paciente',
              'Solicitud de ayuda no resuelta', 'Llamada por no-conectividad',
              'No-adherencia', 'Dificultades del paciente con CONEMO',
              'Tareas atrasadas / Adherencia de la enfermera',
              'Tareas canceladas',
              'Eventos adversos serios (mencionados por la enfermera)',
              'Dropouts', 'Dudas sobre las tareas',
              'Dudas sobre la intervención', 'Otros contactos programados',
              'Solicitudes de ayuda resueltos',
              'Situaciones difíciles para la enfermera relacionados al estudio',
              'Asuntos administrativos', 'Contactos adicionales', 'Otro'
            ],
            portuguese: [
              'Duração da chamada (minutos)', 'Tipo de reunião',
              'Em grupo', 'Individual', 'Tipo de contato', 'por telefone',
              'presencial', 'Assuntos discutidos', 'Encontro inicial',
              'Dificuldades em contatar participante',
              'Pedido de ajuda não resolvido', 'Chamada por não-conectividade',
              'Não aderência', 'Dificuldades do paciente com CONEMO',
              'Tarefas atrasadas / Aderência da/o AE', 'Tarefas canceladas',
              'Eventos adversos serios (mencionados pela/o AE)', 'Dropouts',
              'Dúvidad com respeito ás tarefas',
              'Dúvidas com respeito á intervenção',
              'Outros pontos de contato programados',
              'Pedidos de ajuda resolvidos',
              'Situações difíceis relacionadas ao estudo',
              'Questões Admnistrativas', 'Contatos adicionais', 'Outros'
            ],
            english: [
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
      end
    end
  end
end