module Translations
  # translations for 'Your Patients' page
  module YourPatientsTranslations
    include Translations

    def expected_headers
      locale(spanish_headers, portuguese_headers, english_headers)
    end

    def no_tasks
      locale('Sin tareas pendientes', 'Sem tarefas pendentes',
             'No active/overdue task')
    end

    def active_task
      locale('Tarea actual', 'Tarefa atual', 'Active task')
    end

    def overdue_task
      locale('Tarea atrasada', 'Tarefa atrasada', 'Overdue task')
    end

    private

    def spanish_headers
      @spanish_headers ||= [
        'Nombre',
        'Código del participante',
        'Tareas',
        'Identificador'
      ]
    end

    def portuguese_headers
      @portuguese_headers ||= [
        'Nome',
        'Identificação do participante',
        'Tarefas',
        'Configurar token'
      ]
    end

    def english_headers
      @english_headers ||= [
        'Name',
        'Participant ID',
        'Tasks',
        'Configuration token'
      ]
    end
  end
end
