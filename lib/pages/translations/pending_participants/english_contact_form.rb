module Translations
  module PendingParticipants
    # English content for contact information form
    module EnglishContactForm
      def english_form
        @english_form ||= [
          'First name',
          'Last name',
          'Participant ID',
          'Family health unit',
          'Home address',
          'Telephone ',
          'Cell phone',
          'Alternate phone 1',
          'Contact person ',
          'Relationship',
          'Alternate phone 2',
          'Contact person ',
          'Relationship',
          'Birth date',
          'Gender',
          'Emergency contact (name)',
          'Relationship',
          'Address',
          'Telephone',
          'Cell phone'
        ]
      end

      def english_health_unit_options
        @english_health_unit_options ||= (1..10).map { |i| "unit #{i}" }
      end

      def english_relationship_options
        @english_relationship_options ||= [
          'Parent',
          'Husband / Wife / Partner',
          'Son / Daughter',
          'Another family member',
          'Friend',
          'Other)'
        ]
      end

      def english_gender_options
        @english_gender_options ||= ['Male', 'Female']
      end
    end
  end
end
