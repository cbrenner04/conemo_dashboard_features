module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module PortugueseContactInformation
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
    end
  end
end
