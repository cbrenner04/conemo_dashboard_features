module Translations
  module ClinicalSummaryTranslations
    # Portuguese translations for clinical summary page
    module PortugueseSummary
      def portuguese_links
        @portuguese_links ||= [
          'participant contact information page',
          'Sessões'
        ]
      end

      def portuguese_headers
        @portuguese_headers ||= [
          'Solicitação de ajuda',
          'Logins',
          'Sessão enviada em',
          'Sessão',
          'Anotações Write note'
        ]
      end

      def portuguese_legend
        @portuguese_legend ||= [
          'Unreleased',
          'Current',
          'Completed late',
          'Accessed but not completed',
          'Not accessed',
          'Completed on time'
        ]
      end

      def portuguese_release_dates
        release_day = [1, 3, 6, 8, 10]
        relative_release_date = release_day.map do |i|
          portuguese_date((Date.today - @start_date_offset) + (i - 1))
        end
        @portuguese_release_dates ||= relative_release_date
      end

      def portuguese_contact_dates
        contact_day = [0, 14, 35, 42]
        relative_contact_date = contact_day.map do |i|
          portuguese_date(Date.today - i)
        end
        @portuguese_contact_dates ||= relative_contact_date
      end

      def portuguese_notes_form_heading
        @portuguese_notes_heading ||= "Escrever nota para First Last-#{@id}"
      end

      def portuguese_notes_form_labels
        @portuguese_notes_form_labels ||=
          ['Data do contato', 'Motivo', 'Anotações']
      end

      def portuguese_notes_reason_options
        @portuguese_notes_reason_options ||=
          ['Contato programado - Seguimento', 'Contato por não adesão',
           'Solicitação de contato pelo paciente', 'Outro']
      end
    end
  end
end
