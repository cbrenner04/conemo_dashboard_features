require './lib/pages/translations/supervisor_page'
Dir['./lib/pages/translations/supervisor_page/participants/*.rb']
  .each { |file| require file }

module Translations
  module SupervisorPageTranslations
    # module for Participants on Supervisor page
    module ParticipantsTranslations
      include Translations::SupervisorPageTranslations
      include Translations::SupervisorPageTranslations::
              ParticipantsTranslations::EnglishParticipants
      include Translations::SupervisorPageTranslations::
              ParticipantsTranslations::SpanishParticipants
      include Translations::SupervisorPageTranslations::
              ParticipantsTranslations::PortugueseParticipants

      def participants_title
        locale('participantes', 'Participantes', 'Participants')
      end

      def pending_participants_header
        locale('pendiente', 'Pendente', 'Pending')
      end

      def active_participants_header
        locale('activo', 'Ativo', 'Active')
      end

      def completed_participants_header
        locale('completado', 'Completo', 'Complete')
      end

      def dropped_participants_header
        locale('Suspensión del Tratamiento', 'Término de Tratamento',
               'Dropped')
      end

      def pending_headers
        locale(spanish_pending_headers, portuguese_pending_headers,
               english_pending_headers)
      end

      def active_headers
        locale(spanish_active_headers, portuguese_active_headers,
               english_active_headers)
      end

      def completed_headers
        locale(spanish_completed_headers, portuguese_completed_headers,
               english_completed_headers)
      end

      def dropped_headers
        locale(spanish_dropped_headers, portuguese_dropped_headers,
               english_dropped_headers)
      end

      def nurse_assignment_heading
        locale('Asignar enfermero para activar participante',
               'Designar enfermeira para ativar participante',
               'Assign nurse to activate participant')
      end

      def termination_alert
        locale('¿Estás seguro/a de que quieres suspender el tratamiento de ' \
               'este participante?',
               'Tem certeza que quer terminar o acompanhamento deste ' \
               'participante?',
               'Are you sure you want to terminate this person?')
      end
    end
  end
end
