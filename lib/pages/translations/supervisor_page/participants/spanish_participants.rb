module Translations
  module SupervisorPageTranslations
    module ParticipantsTranslations
      # Spanish translations for Participants section of Supervisor Page
      module SpanishParticipants
        def spanish_pending_headers
          @spanish_pending_headers ||= [
            'Editar información',
            'Nombre',
            'Código del participante',
            'Fecha de incorporación en el dashboard',
            'Activar Participante'
          ]
        end

        def spanish_active_headers
          @spanish_active_headers ||= [
            'Editar información',
            'Enfermera',
            'Nombre',
            'Código del participante',
            'Fecha de incorporación en el dashboard',
            'Desactivar Participante'
          ]
        end

        def spanish_completed_headers
          @spanish_completed_headers ||= [
            'Enfermera',
            'Nombre',
            'Código del participante',
            'Fecha de incorporación en el dashboard'
          ]
        end

        def spanish_dropped_headers
          @spanish_dropped_headers ||= [
            'Enfermera',
            'Nombre',
            'Código del participante',
            'Fecha de incorporación en el dashboard'
          ]
        end
      end
    end
  end
end
