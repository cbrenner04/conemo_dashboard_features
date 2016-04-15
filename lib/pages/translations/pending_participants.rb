require './lib/pages/translations'
path = './lib/pages/translations/pending_participants'
Dir["#{path}/*.rb"].each { |file| require file }

module Translations
  # module for pending participants translations
  module PendingParticipants
    include Translations
    include Translations::PendingParticipants::EnglishContactForm
    include Translations::PendingParticipants::SpanishContactForm
    include Translations::PendingParticipants::PortugueseContactForm

    def main_button
      locale('Participantes pendientes', 'Participantes pendentes',
             'Pending Participants')
    end

    def main_heading
      locale('Participante', 'Participante', 'Participants')
    end

    def create_button
      locale('Añadir nuevo participante', 'Adicionar Novo Participante',
             'ADD NEW PARTICIPANT')
    end

    def ineligible_button
      locale('Ineligible', 'Inelegível', 'Ineligible')
    end

    def disqualify_alert
      locale('¿Está seguro que quiere desactivar este participante?',
             'Você tem certeza que quer desativar essa pessoa?',
             'Are you sure you want to mark this person as ineligible?')
    end

    def expected_form_fields
      locale(spanish_form, portuguese_form, english_form)
    end

    def expected_relationship_options
      locale(spanish_relationship_options, portuguese_relationship_options,
             english_relationship_options)
    end

    def gender_label
      locale('Sexo', 'Sexo', 'Gender')
    end

    def gender_options
      locale(spanish_gender_options, portuguese_gender_options,
             english_gender_options)
    end

    def expected_pending_headers
      locale(spanish_pending_headers, portuguese_pending_headers,
             english_pending_headers)
    end

    def expected_ineligible_headers
      locale(spanish_ineligible_headers, portuguese_ineligible_headers,
             english_ineligible_headers)
    end

    def has_nurse_assignment_form?
      has_text? locale('Asignar enfermero para activar participante',
                       'Designar enfermeira para ativar participante',
                       'Assign nurse to activate participant')
    end

    def expected_health_unit_options
      locale(spanish_health_unit_options, portuguese_health_unit_options,
             english_health_unit_options)
    end

    def has_pending_participant_table_title?
      locale('Participantes no asignados', 'Participantes pendentes',
             'Pending participants')
    end

    private

    def spanish_pending_headers
      @spanish_headers ||= [
        'Editar información', 'Nombre', 'Código del participante',
        'Fecha de inclusión en el estudio', 'Activar Participante'
      ]
    end

    def portuguese_pending_headers
      @portuguese_pending_headers ||= [
        'Editar Informações', 'Nome', 'Identificação do participante',
        'Data de inclusão', 'Ativar'
      ]
    end

    def english_pending_headers
      @english_headers ||= [
        'Edit Information', 'Name', 'Study Identifier', 'Enrollment Date',
        'Activate'
      ]
    end

    def spanish_ineligible_headers
      @spanish_ineligible_headers ||= [
        'Editar información', 'Nombre', 'Código del participante',
        'Fecha de inclusión en el estudio', 'Activar Participante'
      ]
    end

    def portuguese_ineligible_headers
      @portuguese_ineligible_headers ||= [
        'Editar Informações', 'Nome', 'Identificação do participante',
        'Data de inclusão', 'Ativar'
      ]
    end

    def english_ineligible_headers
      @english_ineligible_headers ||= [
        'Edit Information', 'Name', 'Study Identifier',
        'Enrollment Date Activate'
      ]
    end
  end
end
