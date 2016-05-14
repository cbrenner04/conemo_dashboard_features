module Translations
  # translations for 'Your Patients' page
  module YourPatientsTranslations
    include Translations

    def expected_headers
      localize(
        spanish: [
          'Nombre',
          'Código del participante',
          'Tareas',
          'Identificador'
        ],
        portuguese: [
          'Nome',
          'Identificação do participante (ID)',
          'Tarefas',
          'Configurar token'
        ],
        english: [
          'Name',
          'Participant ID',
          'Tasks',
          'Configuration token'
        ]
      )
    end

    def no_tasks
      localize(
        spanish: 'Sin tareas pendientes',
        portuguese: 'Tarefas Não Ativas',
        english: 'No active/overdue task'
      )
    end

    def active_task
      localize(
        spanish: 'Tarea actual',
        portuguese: 'Tarefa Ativa',
        english: 'Active task'
      )
    end

    def overdue_task
      localize(
        spanish: 'Tarea atrasada',
        portuguese: 'Tarefa Atrasada',
        english: 'Overdue task'
      )
    end
  end
end
