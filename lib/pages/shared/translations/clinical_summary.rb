require './lib/pages/shared/translations'
path = './lib/pages/shared/translations/clinical_summary'
Dir["#{path}/*.rb"].each { |file| require file }

module Translations
  # translations for clinical summary page
  module ClinicalSummary
    include Translations
    include Translations::ClinicalSummary::EnglishSummary
    include Translations::ClinicalSummary::SpanishSummary
    include Translations::ClinicalSummary::PortugueseSummary

    def clinical_summary_link
      locale('Clinical Summary', 'Clinical Summary', 'Clinical Summary')
    end

    def notes_heading
      locale('Notas', 'Anotações', 'Notes')
    end

    def expected_links
      locale(spanish_links, portuguese_links, english_links)
    end

    def expected_headers
      locale(spanish_headers, portuguese_headers, english_headers)
    end

    def expected_legend
      locale(spanish_legend, portuguese_legend, english_legend)
    end

    def expected_notes_headers
      locale(spanish_notes_headers, portuguese_notes_headers,
             english_notes_headers)
    end
  end
end
