module Translations
  module ClinicalSummaryTranslations
    # Portuguese translations for clinical summary page
    module PortugueseSummary
      def portuguese_headers
        @portuguese_headers ||= [
          'Acessos',
          'Sessão enviada em',
          'Sessão',
          'Anotações Write note'
        ]
      end

      def portuguese_legend
        @portuguese_legend ||= [
          'Ainda não enviada',
          'Atual',
          'Concluída com atraso',
          'Acessada mas não concluída',
          'Não acessada',
          'Concluída em tempo'
        ]
      end

      def portuguese_release_dates
        [1, 3, 6, 8, 10].map do |i|
          portuguese_date((Date.today - @start_date_offset) + (i - 1))
        end
      end

      def portuguese_contact_dates
        [0, 14, 35, 42].map { |i| portuguese_date(Date.today - i) }
      end

      def portuguese_notes_form_heading
        @portuguese_notes_heading ||= "Escrever nota para First Last-#{@id}"
      end

      def portuguese_notes_form_labels
        @portuguese_notes_form_labels ||= ['Data do contato', 'Anotações']
      end
    end
  end
end
