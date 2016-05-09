module Translations
  module PendingParticipants
    # Portuguese content for contact information form
    module PortugueseContactForm
      def portuguese_form
        @portuguese_form ||= [
          'Nome', 'Sobrenome', 'Identificação do participante (ID)',
          'Unidade de Saúde da Família', 'Endereço', 'Telefone fixo',
          'Celular (pessoal)', 'Telefone alternativo 1',
          'Nome de pessoa / lugar de telefone alternativo 1',
          'Grau de parentesco/relacionamento',
          'Grau de parentesco/relacionamento',
          'Telefone alternativo 2',
          'Nome de pessoa / lugar de telefone alternativo 2',
          'Grau de parentesco/relacionamento',
          'Grau de parentesco/relacionamento',
          'Data de nascimento', 'Sexo',
          'Contato de Emergência (nome)',
          'Grau de parentesco/relacionamento',
          'Grau de parentesco/relacionamento',
          'Endereço', 'Telefone fixo (Contato de Emergência)', 'Celular'
        ]
      end

      def portuguese_health_unit_options
        @portuguese_health_unit_options ||= [
          'Adão Manoel',
          'Celso Daniel',
          'Dom João Nery',
          'Jardim Campos',
          'Jardim Copa',
          'Jardim Rubro II',
          'Profeta Jeremias',
          'Santo Estevão',
          'Silva Teles',
          'Vila Ramos'
        ]
      end

      def portuguese_relationship_options
        @portuguese_relationship_options ||= [
          'Pai / Mãe',
          'Marido / Esposa / Parceiro/a',
          'Filho/a',
          'Outro membro da família',
          'Outro (especificar)'
        ]
      end

      def portuguese_gender_options
        @portuguese_gender_options ||= ['Masculino', 'Feminino']
      end
    end
  end
end
