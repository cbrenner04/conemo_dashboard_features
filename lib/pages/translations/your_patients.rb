module Translations
  # translations for 'Your Patients' page
  module YourPatientsTranslations
    include Translations

    def expected_headers
      locale(spanish_headers, portuguese_headers, english_headers)
    end

    def no_tasks
      locale('Sin tareas pendientes', 'Sem tarefas pendentes',
             'no active/overdue task')
    end

    def active_task
      locale('Tarea actual', 'Tarefa atual', 'active task')
    end

    def overdue_task
      locale('Tarea atrasada', 'Tarefa atrasada', 'overdue task')
    end

    private

    def spanish_headers
      @spanish_headers ||= [
        'Nombre',
        'Código del participante',
        'Tareas',
        'Configurar identificador'
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
