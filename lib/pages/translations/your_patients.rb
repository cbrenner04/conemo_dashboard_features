module Translations
  # translations for 'Your Patients' page
  module YourPatientsTranslations
    def expected_headers
      locale(spanish_headers, portuguese_headers, english_headers)
    end

    private

    def spanish_headers
      @spanish_headers ||= [
        'Código del participante',
        'las tareas',
        'Configurar identificador'
      ]
    end

    def portuguese_headers
      @portuguese_headers ||= [
        'Identificação do participante (ID)',
        'as tarefas',
        'Configurar token'
      ]
    end

    def english_headers
      @english_headers ||= [
        'Participant ID',
        'Tasks',
        'Configuration token'
      ]
    end
  end
end
