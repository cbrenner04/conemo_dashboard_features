# frozen_string_literal: true
require './lib/pages/translations/supervisor_page'
require './lib/pages/translations/supervisor_page/' \
        'participants/localized_participants.rb'

module Translations
  module SupervisorPageTranslations
    # module for Participants on Supervisor page
    module ParticipantsTranslations
      include Translations::SupervisorPageTranslations
      include Translations::SupervisorPageTranslations::
              ParticipantsTranslations::LocalizedParticipants

      def participants_title
        localize(
          spanish: 'participantes',
          portuguese: 'Participantes',
          english: 'Participants'
        )
      end

      def pending_participants_header
        localize(
          spanish: 'pendiente',
          portuguese: 'Pendente',
          english: 'Pending'
        )
      end

      def active_participants_header
        localize(spanish: 'activo', portuguese: 'Ativo', english: 'Active')
      end

      def completed_participants_header
        localize(
          spanish: 'completado',
          portuguese: 'Completo',
          english: 'Complete'
        )
      end

      def dropped_participants_header
        localize(
          spanish: 'Suspensión del Tratamiento',
          portuguese: 'Término de Tratamento',
          english: 'Dropped'
        )
      end

      def expected_pending_headers
        localize pending_headers
      end

      def expected_active_headers
        localize active_headers
      end

      def expected_completed_headers
        localize completed_headers
      end

      def expected_dropped_headers
        localize dropped_headers
      end

      def nurse_assignment_heading
        localize(
          spanish: 'Asignar enfermero para activar participante',
          portuguese: 'Designar enfermeira para ativar participante',
          english: 'Assign nurse to activate participant'
        )
      end

      def termination_alert
        localize(
          spanish: '¿Estás seguro/a de que quieres suspender el tratamiento ' \
                   'de este participante?',
          portuguese: 'Tem certeza que quer terminar o acompanhamento deste ' \
                      'participante?',
          english: 'Are you sure you want to terminate this person?'
        )
      end
    end
  end
end
