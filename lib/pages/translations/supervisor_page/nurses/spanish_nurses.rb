module Translations
  module SupervisorPageTranslations
    module NursesTranslations
      # module for Nurses on Supervisor page
      module SpanishNurses
        def spanish_questions_and_answers
          @spanish_questions_and_answers ||= [
            'Duración (min)', 'Tipo de reunión', 'Grupal',
            'Individual', 'Tipo de contacto', 'Llamada telefónica',
            'En persona', 'Temas discutidos', 'Cita de inicio',
            'Dificultad de contactarse con el paciente',
            'Solicitud de ayuda no resuelta', 'Llamada por no-conectividad',
            'No-adherencia', 'Dificultades del paciente con CONEMO',
            'Tareas atrasadas / Adherencia de la enfermera',
            'Tareas canceladas',
            'Eventos adversos serios (mencionados por la enfermera)',
            'Dropouts', 'Dudas sobre las tareas', 'Dudas sobre la intervención',
            'Otros contactos programados', 'Solicitudes de ayuda resueltos',
            'Situaciones difíciles para la enfermera relacionados al estudio',
            'Asuntos administrativos', 'Contactos adicionales', 'Otro'
          ]
        end

        def spanish_headers
          @spanish_headers ||= [
            'Fecha/hora',
            'Duración (min)',
            'Tipo de reunión',
            'Tipo de contacto',
            'Temas discutidos'
          ]
        end
      end
    end
  end
end
