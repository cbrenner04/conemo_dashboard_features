module Translations
  module TimelineTranslations
    # Spanish translations for contact information page
    module EnglishTimeline
      def english_timeline_dates
        @english_timeline_dates ||= [
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
