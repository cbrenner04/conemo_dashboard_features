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
          'Gender:',
          'Phone number / serial number:',
          'Phone ID:'
        ]
      end
    end
  end
end
