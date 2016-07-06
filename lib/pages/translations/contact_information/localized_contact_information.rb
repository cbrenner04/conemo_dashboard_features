# frozen_string_literal: true
module Translations
  module ContactInformation
    # module for translations for contact information
    module LocalizedContactInformation
      def spanish_headings
        @spanish_headings ||= [
          'Centro de salud:',
          'Telefóno fijo:',
          'Celular (propio):',
          'Dirección actual:',
          'Sexo:',
          'Teléfono fijo (Contacto de Emergencia):',
          'Contacto de Emergencia (nombre):',
          'Teléfono alternativo 1:',
          'Nombre de persona / Lugar del teléfono alternativo 1:',
          'Número del smartphone / número de serie:',
          'Código del smartphone:'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Unidade de Saúde da Família:',
          'Telefone fixo:',
          'Celular (pessoal):',
          'Endereço:',
          'Sexo:',
          'Telefone fixo (Contato de Emergência):',
          'Contato de Emergência (nome):',
          'Telefone alternativo 1:',
          'Nome de pessoa / lugar de telefone alternativo 1:',
          'Número do Smartphone / número de serie:',
          'Código do Smartphone:'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Family health unit:',
          'Telephone:',
          'Cell phone:',
          'Home address:',
          'Gender:',
          'Emergency contact (name):',
          'Alternate phone 1:',
          'Contact person:'
        ]
      end

      def spanish_extras
        @spanish_extras ||= [
          'Fecha de nacimiento:',
          'Relación con el participante (Contacto de Emergencia):',
          'Si marcaste “otro”, por favor especifícalo aquí:',
          'Dirección actual (Contacto de Emergencia):',
          'Celular (Contacto de Emergencia):',
          'Relación con el participante (Teléfono alternativo 1):',
          'Si marcaste “otro”, por favor especifícalo aquí:',
          'Telefóno alternativo 2:',
          'Nombre de persona / Lugar del teléfono alternativo 2:',
          'Relación con el participante (Teléfono alternativo 2):',
          'Si marcaste “otro”, por favor especifícalo aquí:'
        ]
      end

      def portuguese_extras
        @portuguese_extras ||= [
          'Data de nascimento:',
          'Grau de parentesco/relacionamento:',
          'Se marcou "outro", por favor especifique:',
          'Endereço:',
          'Celular:',
          'Grau de parentesco/relacionamento:',
          'Se marcou "outro", por favor especifique:',
          'Telefone alternativo 2:',
          'Nome de pessoa / lugar de telefone alternativo 2:',
          'Grau de parentesco/relacionamento:',
          'Se marcou "outro", por favor especifique:'
        ]
      end

      def english_extras
        @english_extras ||= [
          'Birth date:',
          'Relationship:',
          'If other, specify here:',
          'Address:',
          'Cell phone:',
          'Relationship:',
          'If other, specify here:',
          'Alternate phone 2:',
          'Contact person:',
          'Relationship:',
          'If other, specify here:'
        ]
      end
    end
  end
end
