module Translations
  module SupervisorPageTranslations
    module NursesTranslations
      # module for Nurses on Supervisor page
      module PortugueseNurses
        def portuguese_questions_and_answers
          @portuguese_questions_and_answers ||= [
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
          ]
        end

        def portuguese_headers
          @portuguese_headers ||= [
            'Data/hora',
            'Duração da chamada (minutos)',
            'Tipo de reunião',
            'Tipo de contato',
            'Assuntos discutidos'
          ]
        end
      end
    end
  end
end
