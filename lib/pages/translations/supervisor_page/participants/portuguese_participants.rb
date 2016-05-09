module Translations
  module SupervisorPageTranslations
    module ParticipantsTranslations
      # Portuguese translations for Participants section of Supervisor Page
      module PortugueseParticipants
        def portuguese_pending_headers
          @portuguese_pending_headers ||= [
            'Editar Informações',
            'Nome',
            'Identificação do participante (ID)',
            'Data de inclusão no dashboard',
            'Ativar'
          ]
        end

        def portuguese_active_headers
          @portuguese_active_headers ||= [
            'Editar Informações',
            'Auxiliar de Engfermagem',
            'Nome',
            'Identificação do participante (ID)',
            'Data de inclusão no dashboard',
            'Desativar participante'
          ]
        end

        def portuguese_completed_headers
          @portuguese_completed_headers ||= [
            'Auxiliar de Engfermagem',
            'Nome',
            'Identificação do participante (ID)',
            'Data de inclusão no dashboard'
          ]
        end

        def portuguese_dropped_headers
          @portuguese_dropped_headers ||= [
            'Auxiliar de Engfermagem',
            'Nome',
            'Identificação do participante (ID)',
            'Data de inclusão no dashboard'
          ]
        end
      end
    end
  end
end
