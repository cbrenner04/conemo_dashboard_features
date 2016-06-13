# frozen_string_literal: true
module Translations
  module PendingParticipants
    # English content for contact information form
    module LocalizedContactForm
      def form
        @form ||= {
          spanish: spanish_form_field_arry,
          portuguese: portuguese_form_field_arry,
          english: english_form_field_arry
        }
      end

      def relationship_options
        @relationship_options ||= {
          spanish: ['Padre / Madre', 'Esposo(a) / Pareja', 'Hijo (a)',
                    'Otro miembro de la familia', 'Amigo',
                    'Otro (especificar)'],
          portuguese: ['Pai / Mãe', 'Marido / Esposa / Parceiro/a', 'Filho/a',
                       'Outro membro da família', 'Outro (especificar)'],
          english: ['Parent', 'Husband / Wife / Partner', 'Son / Daughter',
                    'Another family member', 'Friend', 'Other)']
        }
      end

      def gender_options
        @gender_options ||= { spanish: ['Masculino', 'Femenino'],
                              portuguese: ['Masculino', 'Feminino'],
                              english: ['Male', 'Female'] }
      end

      def pending_headers
        @pending_headers ||= {
          spanish: [
            'Editar información', 'Nombre', 'Código del participante',
            'Fecha de incorporación en el dashboard', 'Activar Participante'
          ],
          portuguese: [
            'Editar Informações', 'Nome', 'Identificação do participante',
            'Data de inclusão no dashboard', 'Ativar'
          ],
          english: [
            'Edit Information', 'Name', 'Study Identifier', 'Enrollment Date',
            'Activate'
          ]
        }
      end

      def ineligible_headers
        @ineligible_headers ||= {
          spanish: [
            'Editar información', 'Nombre', 'Código del participante',
            'Fecha de inclusión en el estudio', 'Activar Participante'
          ],
          portuguese: [
            'Editar Informações', 'Nome', 'Identificação do participante',
            'Data de inclusão', 'Ativar'
          ],
          english: [
            'Edit Information', 'Name', 'Study Identifier',
            'Enrollment Date Activate'
          ]
        }
      end

      private

      def spanish_form_field_arry
        @spanish_form_field_arry ||= [
          'Nombres', 'Apellidos', 'Código del participante',
          'Centro de salud', 'Dirección actual', 'Telefóno fijo',
          'Celular (propio)', 'Teléfono alternativo 1',
          'Nombre de persona / Lugar del teléfono alternativo 1',
          'Relación con el participante', 'Si marcaste “otro”, por ' \
          'favor especifícalo aquí', 'Telefóno alternativo 2',
          'Nombre de persona / Lugar del teléfono alternativo 2',
          'Relación con el participante', 'Si marcaste “otro”, por ' \
          'favor especifícalo aquí', 'Fecha de nacimiento', 'Sexo',
          'Contacto de Emergencia (nombre)', 'Relación con el participante',
          'Si marcaste “otro”, por favor especifícalo aquí',
          'Dirección actual', 'Teléfono fijo (Contacto de Emergencia)',
          'Celular'
        ]
      end

      def portuguese_form_field_arry
        @portuguese_form_field_arry ||= [
          'Nome', 'Sobrenome', 'Identificação do participante (ID)',
          'Unidade de Saúde da Família', 'Endereço', 'Telefone fixo',
          'Celular (pessoal)', 'Telefone alternativo 1',
          'Nome de pessoa / lugar de telefone alternativo 1',
          'Grau de parentesco/relacionamento', 'Se marcou "outro", por ' \
          'favor especifique', 'Telefone alternativo 2',
          'Nome de pessoa / lugar de telefone alternativo 2',
          'Grau de parentesco/relacionamento', 'Se marcou "outro", por ' \
          'favor especifique', 'Data de nascimento', 'Sexo',
          'Contato de Emergência (nome)', 'Grau de parentesco/relacionamento',
          'Se marcou "outro", por favor especifique', 'Endereço',
          'Telefone fixo (Contato de Emergência)', 'Celular'
        ]
      end

      def english_form_field_arry
        @english_form_field_arry ||= [
          'First name', 'Last name', 'Participant ID', 'Family health unit',
          'Home address', 'Telephone ', 'Cell phone', 'Alternate phone 1',
          'Contact person ', 'Relationship', 'Alternate phone 2',
          'Contact person ', 'Relationship', 'Birth date', 'Gender',
          'Emergency contact (name)', 'Relationship', 'Address', 'Telephone',
          'Cell phone'
        ]
      end
    end
  end
end
