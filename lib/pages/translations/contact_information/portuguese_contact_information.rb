module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module PortugueseContactInformation
      def portuguese_headings
        @portuguese_headings ||= [
          'Unidade de Saúde da Família:',
          'Telefone fixo:',
          'Contato de Emergência (nome):',
          'Telefone fixo (Contato de Emergência):',
          'Data de nascimento:',
          'Endereço:',
          'Sexo:',
          'Número do Smartphone / número de serie:',
          'Código do Smartphone:'
        ]
      end
    end
  end
end
