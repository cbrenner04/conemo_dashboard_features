require './lib/pages/translations'

module Translations
  # translations for Nurse Tasks
  module NurseTasksUnscheduled
    include Translations

    def spanish_cancel_options
      @spanish_cancel_options ||= [
        'CANCELAR llamada (no realizada)',
        'No se pudo ubicar al paciente',
        'Paciente no desea continuar con la intervención',
        'Paciente no tuvo tiempo de hablar (repetitivamente)',
        'Paciente no estaba dispuesta/o de hablar',
        'Otra'
      ]
    end

    def portuguese_cancel_options
      @portuguese_cancel_options ||= [
        'Não realizado / Cancelar tarefa',
        'Não consegui falar com o paciente',
        'Paciente não quer continuar no programa',
        'Paciente não teve tempo para falar (várias vezes)',
        'Paciente não estava disposto/a a falar',
        'Outra razão'
      ]
    end

    def english_cancel_options
      @english_cancel_options ||= [
        'Not done / CANCEL task',
        'Could not reach patient',
        'Patient does not want to continue in the program',
        'Patient did not have time to talk (multiple times)',
        'Patient not willing to talk to nurse (assistant)',
        'Other'
      ]
    end
  end
end
