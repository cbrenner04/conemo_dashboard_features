module Translations
  module PendingParticipants
    # English content for contact information form
    module LocalizedContactForm
      def form
        @form ||= {
          spanish: [
            'Nombres', 'Apellidos', 'Código del participante',
            'Centro de salud', 'Dirección actual', 'Telefóno fijo',
            'Celular (propio)', 'Teléfono alternativo 1',
            'Nombre de persona / Lugar del teléfono alternativo 1',
            'Relación con el participante', 'Relación con el participante',
            'Telefóno alternativo 2',
            'Nombre de persona / Lugar del teléfono alternativo 2',
            'Relación con el participante', 'Relación con el participante',
            'Fecha de nacimiento', 'Sexo', 'Contacto de Emergencia (nombre)',
            'Relación con el participante', 'Relación con el participante',
            'Dirección actual', 'Teléfono fijo (Contacto de Emergencia)',
            'Celular'
          ],
          portuguese: [
            'Nome', 'Sobrenome', 'Identificação do participante (ID)',
            'Unidade de Saúde da Família', 'Endereço', 'Telefone fixo',
            'Celular (pessoal)', 'Telefone alternativo 1',
            'Nome de pessoa / lugar de telefone alternativo 1',
            'Grau de parentesco/relacionamento',
            'Grau de parentesco/relacionamento', 'Telefone alternativo 2',
            'Nome de pessoa / lugar de telefone alternativo 2',
            'Grau de parentesco/relacionamento',
            'Grau de parentesco/relacionamento', 'Data de nascimento', 'Sexo',
            'Contato de Emergência (nome)', 'Grau de parentesco/relacionamento',
            'Grau de parentesco/relacionamento',
            'Endereço', 'Telefone fixo (Contato de Emergência)', 'Celular'
          ],
          english: [
            'First name', 'Last name', 'Participant ID', 'Family health unit',
            'Home address', 'Telephone ', 'Cell phone', 'Alternate phone 1',
            'Contact person ', 'Relationship', 'Alternate phone 2',
            'Contact person ', 'Relationship', 'Birth date', 'Gender',
            'Emergency contact (name)', 'Relationship', 'Address', 'Telephone',
            'Cell phone'
          ]
        }
      end

      def health_unit_options
        @health_unit_options ||= {
          spanish: (1..10).map { |i| "Centro de salud #{i}" },
          portuguese: [
            'Adão Manoel', 'Celso Daniel', 'Dom João Nery', 'Jardim Campos',
            'Jardim Copa', 'Jardim Rubro II', 'Profeta Jeremias',
            'Santo Estevão', 'Silva Teles', 'Vila Ramos'
          ],
          english: (1..10).map { |i| "unit #{i}" }
        }
      end

      def relationship_options
        @relationship_options ||= {
          spanish: [
            'Padre / Madre', 'Esposo(a) / Pareja', 'Hijo (a)',
            'Otro miembro de la familia', 'Amigo', 'Otro (especificar)'
          ],
          portuguese: [
            'Pai / Mãe', 'Marido / Esposa / Parceiro/a', 'Filho/a',
            'Outro membro da família', 'Outro (especificar)'
          ],
          english: [
            'Parent', 'Husband / Wife / Partner', 'Son / Daughter',
            'Another family member', 'Friend', 'Other)'
          ]
        }
      end

      def gender_options
        @gender_options ||= {
          spanish: ['Masculino', 'Femenino'],
          portuguese: ['Masculino', 'Feminino'],
          english: ['Male', 'Female']
        }
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
    end
  end
end
