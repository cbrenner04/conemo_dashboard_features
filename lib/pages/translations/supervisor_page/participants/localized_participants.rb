# frozen_string_literal: true
module Translations
  module SupervisorPageTranslations
    module ParticipantsTranslations
      # english translations for Participants section of Supervisor Page
      module LocalizedParticipants
        def pending_headers
          @pending_headers ||= {
            spanish: [
              'Editar información',
              'Nombre',
              'Código del participante',
              'Fecha de incorporación en el dashboard',
              'Activar Participante'
            ],
            portuguese: [
              'Editar Informações',
              'Nome',
              'Identificação do participante (ID)',
              'Data de inclusão no dashboard',
              'Ativar'
            ],
            english: [
              'Edit Information',
              'Name',
              'Study Identifier',
              'Date added to dashboard',
              'Activate'
            ]
          }
        end

        def active_headers
          @active_headers ||= {
            spanish: [
              'Editar información', 'Enfermera', 'Nombre',
              'Código del participante',
              'Fecha de incorporación en el dashboard',
              'Desactivar Participante'
            ],
            portuguese: [
              'Editar Informações', 'Auxiliar de Engfermagem', 'Nome',
              'Identificação do participante (ID)',
              'Data de inclusão no dashboard', 'Desativar participante'
            ],
            english: [
              'Edit Information', 'Nurse', 'Name', 'Study Identifier',
              'Date added to dashboard', 'Treatment termination'
            ]
          }
        end

        def completed_headers
          @completed_headers ||= {
            spanish: [
              'Enfermera',
              'Nombre',
              'Código del participante',
              'Fecha de incorporación en el dashboard'
            ],
            portuguese: [
              'Auxiliar de Engfermagem',
              'Nome',
              'Identificação do participante (ID)',
              'Data de inclusão no dashboard'
            ],
            english: [
              'Nurse',
              'Name',
              'Study Identifier',
              'Date added to dashboard'
            ]
          }
        end

        def dropped_headers
          @dropped_headers ||= {
            spanish: [
              'Enfermera',
              'Nombre',
              'Código del participante',
              'Fecha de incorporación en el dashboard'
            ],
            portuguese: [
              'Auxiliar de Engfermagem',
              'Nome',
              'Identificação do participante (ID)',
              'Data de inclusão no dashboard'
            ],
            english: [
              'Nurse',
              'Name',
              'Study Identifier',
              'Date added to dashboard'
            ]
          }
        end
      end
    end
  end
end
