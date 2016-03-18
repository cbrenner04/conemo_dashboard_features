module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module PortugueseContactInformation
      def portuguese_headings
        @portuguese_headings ||= [
          'Identificação do participante:',
          'UBS:',
          'Telefone 1:',
          'Contato de emergência:',
          'Telefone de emergência:',
          'Data de nascimento:',
          'Endereço:',
          'Data de inclusão no estudo:',
          'Sexo:'
        ]
      end

      def portuguese_contact_info_contact_dates
        @portuguese_contact_info_contact_dates ||= [
          "Contactado por: #{portuguese_date(Date.today - 45)}",
          "Data/hora: #{portuguese_date(Date.today - 42)}",
          "Data da ligação: #{portuguese_date(Date.today - 35)}",
          "Data da ligação: #{portuguese_date(Date.today - 21)}",
          "Data da ligação: #{portuguese_date(Date.today - 14)}",
          "Data da ligação: #{portuguese_date(Date.today - 14)}",
          "Data da ligação: #{portuguese_date(Date.today - 7)}",
          "Data da ligação: #{portuguese_date(Date.today - 1)}",
          "Data/hora: #{portuguese_date(Date.today)}"
        ]
      end

      def portuguese_timeline_headings
        @portuguese_timeline_headings ||= [
          'Local:',
          'Duração da sessão (minutos):',
          'Duração da chamada (minutos):',
          'Razão para não aderência:',
          'Duração da chamada (minutos):',
          'Razão para não-conectividade:',
          'Razão pelo pedido de ajuda:',
          'Local:',
          'O telefone foi devolvido?:'
        ]
      end
    end
  end
end
