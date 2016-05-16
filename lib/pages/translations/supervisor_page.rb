require './lib/pages/translations'

module Translations
  # module for supervisor page translations
  module SupervisorPageTranslations
    include Translations

    def participants_title
      localize(
        spanish: 'participante',
        portuguese: 'Participante',
        english: 'Participants'
      )
    end

    def nurse_title
      localize(
        spanish: 'Enfermera',
        portuguese: 'Auxiliar de Engfermagem',
        english: 'Nurse'
      )
    end

    def toggle_button
      localize(
        spanish: 'Mostrar / Ocultar tareas canceladas y reprogramadas',
        portuguese: 'Mostrar / Ocultar tarefas canceladas e reagendadas',
        english: 'Toggle cancelled / rescheduled tasks'
      )
    end

    def rescheduled
      localize(
        spanish: 'reprogramada',
        portuguese: 'reagendada',
        english: 'rescheduled'
      )
    end

    def canceled
      localize(
        spanish: 'cancelada',
        portuguese: 'cancelada',
        english: 'cancelled'
      )
    end
  end
end
