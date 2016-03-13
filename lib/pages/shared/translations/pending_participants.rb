require './lib/pages/shared/translations'

module Translations
  # module for pending participants translations
  module PendingParticipants
    include Translations

    def main_button
      locale('Participantes reclutados', 'Participantes pendentes',
             'Pending Participants')
    end

    def main_heading
      locale('Participantes pendientes', 'Participantes Pendentes',
             'Pending Participants')
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
      locale(spanish_relationship_options, portuguese_relationship_options.
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

    private

    def spanish_form
      @spanish_form ||= [
        'Nombre completo',
        'Código del participante',
        'Fecha de inclusión',
        'Centro de salud',
        'Dirección actual',
        'Telefóno fijo',
        'Celular (propio)',
        'Teléfono alternativo 1',
        'Nombre de persona / Lugar del teléfono alternativo 1',
        'Relación con el participante',
        'Telefóno alternativo 2',
        'Nombre de persona / Lugar del teléfono alternativo 2',
        'Relación con el participante',
        'Fecha de nacimiento',
        'Sexo',
        'Contacto de Emergencia (nombre)',
        'Relación con el participante',
        'Dirección actual',
        'Teléfono fijo',
        'Celular'
      ]
    end

    def portuguese_form
      @portuguese_form ||= [
        'Nome completo',
        'Identificação do participante (ID)',
        'Data de inclusão no estudo',
        'Unidade de Saúde da Família',
        'Endereço',
        'Telefone fixo',
        'Celular (pessoal)',
        'Telefone alternativo 1',
        'Nome de pessoa / lugar de telefone alternativo 1',
        'Grau de parentesco/relacionamento:',
        'Telefone alternativo 2',
        'Nome de pessoa / lugar de telefone alternativo 2',
        'Grau de parentesco/relacionamento:',
        'Data de nascimento',
        'Sexo',
        'Contato de Emergência (nome)',
        'Grau de parentesco/relacionamento:',
        'Endereço',
        'Telefone fixo',
        'Celular'
      ]
    end

    def english_form
      @english_form ||= [
        'Name',
        'Participant ID',
        'Date of inclusion',
        'Family health unit',
        'Home address',
        'Telephone ',
        'Cell phone',
        'Alternate phone 1',
        'Contact person ',
        'Relationship',
        'Alternate phone 2',
        'Contact person ',
        'Relationship',
        'Birth date',
        'Gender',
        'Emergency contact (name)',
        'Relationship',
        'Address',
        'Telephone',
        'Cell phone'
      ]
    end

    def spanish_relationship_options
      @spanish_relationship_options ||= [
        'Menu:',
        'Padre / Madre',
        'Esposo(a) / Pareja',
        'Hijo (a)',
        'Otro miembro de la familia',
        'Amigo',
        'Otro (especificar)'
      ]
    end

    def portuguese_relationship_options
      @portuguese_relationship_options ||= [
        'Pai / Mãe',
        'Marido / Esposa / Parceiro/a',
        'Filho/a',
        'Outro membro da família',
        'Outro (especificar):'
      ]
    end

    def english_relationship_options
      @english_relationship_options ||= [
        'Parent',
        'Husband / Wife / Partner',
        'Son / Daughter',
        'Another family member',
        'Friend',
        'Other)'
      ]
    end

    def spanish_gender_options
      @spanish_gender_options ||= [
        'Hombre',
        'Mujer'
      ]
    end

    def portuguese_gender_options
      @portuguese_gender_options ||= [
        'Masculino',
        'Feminino'
      ]
    end

    def english_gender_options
      @english_gender_options ||= [
        'Male',
        'Female'
      ]
    end

    def spanish_pending_headers
      @spanish_headers ||= [
        'Editar información',
        'Nombre',
        'Código del participante',
        'Fecha de inclusión en el estudio',
        'Activar Participante',
        'Desactivar Participante'
      ]
    end

    def portuguese_pending_headers
      @portuguese_pending_headers ||= [
        'Editar Informações',
        'Nome',
        'Identificação do participante',
        'Data de inclusão',
        'Ativar',
        'Desativar participante'
      ]
    end

    def english_pending_headers
      @english_headers ||= [
        'Edit Information',
        'Name',
        'Study Identifier',
        'Enrollment Date',
        'Activate',
        'Disqualify'
      ]
    end

    def spanish_ineligible_headers
      @spanish_ineligible_headers ||= [
        'Editar información',
        'Nombre',
        'Código del participante',
        'Fecha de inclusión en el estudio',
        'Activar Participante'
      ]
    end

    def portuguese_ineligible_headers
      @portuguese_ineligible_headers ||= [
        'Editar Informações',
        'Nome',
        'Identificação do participante',
        'Data de inclusão',
        'Ativar'
      ]
    end

    def english_ineligible_headers
      @english_ineligible_headers ||= [
        'Edit Information',
        'Name',
        'Study Identifier',
        'Enrollment Date Activate'
      ]
    end
  end
end
