module Translations
  module ClinicalSummary
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

      def portuguese_notes_headers
        @portuguese_notes_headers ||= [
          'Final appointment',
          'Call to schedule final appointment',
          'Third contact',
          'Second contact',
          'First appointment'
        ]
      end
    end
  end
end
