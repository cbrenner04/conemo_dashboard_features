# frozen_string_literal: true
require './lib/pages/translations'
require './lib/pages/translations/pending_participants/localized_contact_form'

module Translations
  # module for pending participants translations
  module PendingParticipants
    include Translations
    include Translations::PendingParticipants::LocalizedContactForm

    def main_button
      localize(
        spanish: 'Participantes pendientes',
        portuguese: 'Participantes pendentes',
        english: 'Pending Participants'
      )
    end

    def main_heading
      localize(
        spanish: 'Participante',
        portuguese: 'Participante',
        english: 'Participants'
      )
    end

    def create_button
      localize(
        spanish: 'Añadir nuevo participante',
        portuguese: 'Adicionar Novo Participante',
        english: 'ADD NEW PARTICIPANT'
      )
    end

    def ineligible_button
      localize(
        spanish: 'Ineligible',
        portuguese: 'Inelegível',
        english: 'Ineligible'
      )
    end

    def disqualify_alert
      localize(
        spanish: '¿Está seguro que quiere desactivar este participante?',
        portuguese: 'Você tem certeza que quer desativar essa pessoa?',
        english: 'Are you sure you want to mark this person as ineligible?'
      )
    end

    def expected_form_fields
      localize form
    end

    def expected_relationship_options
      localize relationship_options
    end

    def gender_label
      localize(spanish: 'Sexo', portuguese: 'Sexo', english: 'Gender')
    end

    def expected_gender_options
      localize gender_options
    end

    def expected_pending_headers
      localize pending_headers
    end

    def expected_ineligible_headers
      localize ineligible_headers
    end

    def expected_health_unit_options
      localize health_unit_options
    end
  end
end
