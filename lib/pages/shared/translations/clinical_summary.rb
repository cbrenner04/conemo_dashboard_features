require './lib/pages/shared/translations'

module Translations
  # translations for clinical summary page
  module ClinicalSummary
    include Translations

    def clinical_summary_link
      locale('Clinical Summary', 'Clinical Summary', 'Clinical Summary')
    end
  end
end
