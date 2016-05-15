require './lib/pages/translations'

module Translations
  # translations for Nurse Tasks
  module NurseTasksTranslations
    include Translations

    def singular_active_task
      localize(spanish: 'Tarea total', portuguese: 'Tarefa Total',
               english: 'Task pending')
    end

    def plural_active_task
      localize(spanish: 'Tareas totales', portuguese: 'Tarefas Totalis',
               english: 'Tasks pending')
    end

    def singular_overdue_task
      localize(spanish: 'Tarea astrasada', portuguese: 'Tarefa atrasada',
               english: 'Overdue task')
    end

    def plural_overdue_task
      localize(spanish: 'Tareas astrasadas', portuguese: 'Tarefas atrasadas',
               english: 'Overdue tasks')
    end

    def scheduled_key_label
      localize(spanish: 'Próximos tareas', portuguese: 'Tarefas futuras',
               english: 'Scheduled but not due')
    end

    def confirmed_key_label
      localize(spanish: 'Confirmado', portuguese: 'Confirmado',
               english: 'Confirmed')
    end

    def active_key_label
      localize(spanish: 'Tareas actuales', portuguese: 'Ativo',
               english: 'Active due')
    end

    def canceled_key_label
      localize(spanish: 'Cancelado', portuguese: 'Cancelado',
               english: 'Cancelled')
    end

    def overdue_key_label
      localize(spanish: 'Atrasado', portuguese: 'Atrasado', english: 'Overdue')
    end

    def progress_bar_heading
      localize(spanish: 'Línea de tiempo', portuguese: 'Linha do tempo',
               english: 'Timeline')
    end

    def tasks_heading
      localize(spanish: 'Tareas', portuguese: 'Tarefas', english: 'Tasks')
    end

    def mark_resolved_button
      localize(spanish: 'Tarea resuelta',
               portuguese: 'Marcar tarefa como resolvida',
               english: 'Mark as resolved')
    end

    def contact_supervisor_button
      localize(spanish: 'Contactar supervisor/a',
               portuguese: 'Contactar supervisor',
               english: 'Contact supervisor')
    end

    def contact_supervisor_alert
      localize(spanish: '¿Estás seguro/a de que quieres enviar una solicitud ' \
                        'de ayuda al supervisor?',
               portuguese: 'Tem certeza que quer pedir ajuda ao seu ' \
                           'supervisor?',
               english: 'are you sure you want to notify the supervisor that ' \
                        'you need help?')
    end

    def last_supervisor_contact_heading
      localize(spanish: 'último contacto supervisor de enviado en',
               portuguese: 'último aviso para supervisor enviado em',
               english: 'Last supervisor contact sent')
    end

    def contact_supervisor_confirmation
      localize(spanish: 'Una solicitud de ayuda fue enviada a tu supervisor/a' \
                        ' para que revise este asunto',
               portuguese: 'Uma notificação foi enviada para o seu supervisor' \
                           ' sobre este assunto',
               english: 'a notification has been sent for your supervisor to' \
                        ' review this issue')
    end

    def clear_supervisor_contact_button
      localize(spanish: 'Borrar tarea', portuguese: 'Limpar tarefa',
               english: 'Clear')
    end

    def clear_supervisor_contact_alert
      localize(spanish: '¿Estás seguro/a de que quieres borrar esto?',
               portuguese: 'Está certo de que deseja apagar?',
               english: 'Are you sure you want to clear this?')
    end

    def feminine_success_alert
      localize(spanish: 'guardada exitosamente',
               portuguese: 'salvo com sucesso',
               english: 'saved successfully')
    end

    def masculine_success_alert
      localize(spanish: 'guardado exitosamente',
               portuguese: 'registrado com sucesso',
               english: 'saved successfully')
    end

    def location_options
      localize(
        spanish: ['Casa del paciente', 'Centro de salud', 'Otro lugar'],
        portuguese: ['Casa do paciente', 'Unidade de saúde', 'Outro lugar'],
        english: ['Patient\'s home', 'Health unit', 'Other location']
      )
    end
  end
end
