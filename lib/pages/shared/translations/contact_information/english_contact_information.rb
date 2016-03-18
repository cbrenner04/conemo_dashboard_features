module Translations
  module ContactInformation
    # Spanish translations for contact information page
    module EnglishContactInformation
      def english_headings
        @english_headings ||= [
          'Study Identifier:',
          'Family health unit name:',
          'Phone:',
          'Emergency Contact Name:',
          'Emergency Contact Phone:',
          'Date of birth:',
          'Address:',
          'Enrollment date:',
          'Gender:'
        ]
      end

      def english_contact_info_contact_dates
        @english_contact_info_contact_dates ||= [
          "Date of contact: #{(Date.today - 45).strftime('%B %d, %Y')}",
          "Appointment date/time: #{(Date.today - 42).strftime('%B %d, %Y')}",
          "Date of phone call: #{(Date.today - 35).strftime('%B %d, %Y')}",
          "Contact At: #{(Date.today - 14).strftime('%B %d, %Y')}",
          "Date/time of phone call: #{(Date.today - 1).strftime('%B %d, %Y')}",
          "Date and time: #{Date.today.strftime('%B %d, %Y')}"
        ]
      end

      def english_timeline_headings
        @english_timeline_headings ||= [
          'Location of appointment:',
          'Session length (minutes):',
          'Length of phone call (minutes):',
          'Length of phone call (minutes):',
          'Location:',
          'Was the phone returned?'
        ]
      end
    end
  end
end
