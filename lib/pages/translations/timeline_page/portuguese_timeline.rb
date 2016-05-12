module Translations
  module TimelineTranslations
    # Spanish translations for contact information page
    module PortugueseTimeline
      def portuguese_timeline_dates
        @portuguese_timeline_dates ||= [
          "Contactado em: #{portuguese_date(Date.today - 45)}",
          "Data/hora: #{portuguese_date(Date.today - 42)}",
          "Data/hora: #{portuguese_date(Date.today - 35)}",
          "Data da ligação: #{portuguese_date(Date.today - 21)}",
          # switch to "Data/hora" when update is made
          "Data da ligação: #{portuguese_date(Date.today - 14)}",
          "Data da ligação: #{portuguese_date(Date.today - 14)}",
          "Data da ligação: #{portuguese_date(Date.today - 7)}",
          "Data da ligação: #{portuguese_date(Date.today - 1)}",
          "Data/hora: #{portuguese_date(Date.today)}"
        ]
      end

      def portuguese_timeline_headings
        @portuguese_timeline_headings ||= [
          'Duração da sessão (minutos):',
          'Local:',
          'Duração da chamada (minutos):',
          'O paciente tem tido dificuldades com CONEMO?:',
          'Razão para não aderência:',
          'Duração da chamada (minutos):',
          'O paciente tem tido dificuldades com CONEMO?:',
          'Razão para não-conectividade:',
          'Razão pelo pedido de ajuda:',
          'O telefone foi devolvido?:',
          'Local:'
        ]
      end
    end
  end
end
