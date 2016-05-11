module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module EnglishContactInformation
      def english_headings
        @english_headings ||= [
          'Family health unit:',
          'Telephone:',
          'Cell phone:',
          'Telephone:',
          'Alternate phone 1:',
          'Contact person:',
          'Home address:',
          'Gender:',
          'Phone number / serial number:',
          'Phone ID:'
        ]
      end
    end
  end
end
