module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module EnglishContactInformation
      def english_headings
        @english_headings ||= [
          'Family health unit:',
          'Telephone:',
          'Emergency contact (name):',
          'Telephone:',
          'Birth date:',
          'Home address:',
          'Date of inclusion:',
          'Gender:'
        ]
      end
    end
  end
end
