module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module PortugueseContactInformation
      def portuguese_headings
        @portuguese_headings ||= [
          'Identificação do participante:',
          'UBS:',
          'Prontuário da Família:',
          'Telefone 1:',
          'Contato de emergência:',
          'Telefone de emergência:',
          'E-mail:',
          'Data de nascimento:',
          'Endereço:',
          'Data de inclusão no estudo:',
          'Sexo:',
          'Doença Crônica:'
        ]
      end

      def portuguese_timeline_titles
        @portuguese_timeline_titles ||= [
          'Chamada de confirmação',
          'Primeiro encontro',
          'Chamada de seguimento sem. 1',
          'Chamada de seguimento sem. 3',
          'Chamada para agendar encontro fina',
          'Encontro final'
        ]
      end

      def portuguese_contact_dates
        @portuguese_contact_dates ||= [
          "Contactado por: #{portuguese_date(Date.today - 45)}",
          "Data/hora: #{portuguese_date(Date.today - 42)}",
          "Data da ligação: #{portuguese_date(Date.today - 35)}",
          "Data da ligação: #{portuguese_date(Date.today - 14)}",
          "Data da ligação: #{portuguese_date(Date.today - 1)}",
          "Data/hora: #{portuguese_date(Date.today)}"
        ]
      end

      def portuguese_timeline_headings
        @portuguese_timeline_headings ||= [
          'Local:',
          'Duração da sessão (minutos):',
          'Duração da chamada (minutos):',
          'Duração da chamada (minutos):',
          'Local:',
          'O telefone foi devolvido?:'
        ]
      end
    end
  end
end
