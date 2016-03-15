module Translations
  module ClinicalSummary
    # English translations for clinical summary page
    module EnglishSummary
      def english_links
        @english_links ||= [
          'participant contact information page',
          'Lessons'
        ]
      end

      def english_headers
        @english_headers ||= [
          'Messages',
          'Logins',
          'Release day',
          'Lesson',
          'Notes Write note'
        ]
      end

      def english_legend
        @english_legend ||= [
          'Unreleased',
          'Current',
          'Completed late',
          'Accessed but not completed',
          'Not accessed',
          'Completed on time'
        ]
      end

      def english_notes_headers
        @english_notes_headers ||= [
          'Final appointment',
          'Call to schedule final appointment',
          'Third contact',
          'Second contact',
          'First appointment'
        ]
      end

      def english_release_dates
        @english_release_dates ||= []
      end
    end
  end
end
