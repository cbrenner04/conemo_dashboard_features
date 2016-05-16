module Translations
  module ContactInformation
    # module for translations for contact information
    module LocalizedContactInformation
      def spanish_headings
        @spanish_headings ||= [
          'Centro de salud:',
          'Telefóno fijo:',
          'Celular (propio):',
          'Teléfono fijo (Contacto de Emergencia):',
          'Teléfono alternativo 1:',
          'Nombre de persona / Lugar del teléfono alternativo 1:',
          'Dirección actual:',
          'Sexo:',
          'Número del smartphone / número de serie:',
          'Código del smartphone:'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Unidade de Saúde da Família:',
          'Telefone fixo:',
          'Celular (pessoal):',
          'Telefone fixo (Contato de Emergência):',
          'Telefone alternativo 1:',
          'Nome de pessoa / lugar de telefone alternativo 1:',
          'Endereço:',
          'Sexo:',
          'Número do Smartphone / número de serie:',
          'Código do Smartphone:'
        ]
      end

      def english_headings
        @english_headings ||= [
          'Family health unit:',
          'Telephone:',
          'Cell phone:',
          'Telephone:',
          'Alternate phone 1:',
          'Contact person:',
          'Home address:',
          'Gender:',
          'Phone number / serial number:',
          'Phone ID:'
        ]
      end

      def spanish_extras
        @spanish_extras ||= [
          'Contacto de Emergencia (nombre):',
          'Fecha de nacimiento:',
          'Telefóno alternativo 2:',
          'Relación con el participante:',
          'Relación con el participante:',
          'Nombre de persona / Lugar del teléfono alternativo 2:',
          'Relación con el participante:',
          'Relación con el participante:',
          'Relación con el participante:',
          'Relación con el participante:',
          'Dirección actual:', 'Celular:'
        ]
      end

      def portuguese_extras
        @portuguese_extras ||= [
          'Contato de Emergência (nome):',
          'Data de nascimento:',
          'Telefone alternativo 2:',
          'Grau de parentesco/relacionamento:',
          'Grau de parentesco/relacionamento:',
          'Nome de pessoa / lugar de telefone alternativo 2:',
          'Grau de parentesco/relacionamento:',
          'Grau de parentesco/relacionamento:',
          'Grau de parentesco/relacionamento:',
          'Grau de parentesco/relacionamento:', 'Endereço:',
          'Celular:'
        ]
      end

      def english_extras
        @english_extras ||= [
          'Emergency contact (name):',
          'Birth date:',
          'Alternate phone 2:',
          'Relationship:',
          'Relationship:',
          'Contact person:',
          'Relationship:',
          'Relationship:',
          'Relationship:',
          'Relationship:',
          'Address:',
          'Cell phone:'
        ]
      end
    end
  end
end
