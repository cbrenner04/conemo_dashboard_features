module Translations
  module ClinicalSummaryTranslations
    # English translations for clinical summary page
    module EnglishSummary
      def english_headers
        @english_headers ||= [
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

      def english_release_dates
        (1..15).map do |i|
          ((Date.today - @start_date_offset) + (i - 1)).strftime('%B %d, %Y')
        end
      end

      def english_contact_dates
        [0, 14, 35, 42].map do |i|
          (Date.today - i).strftime('%B %d, %Y')
        end
      end

      def english_notes_form_heading
        @english_notes_heading ||= "Create Note for First Last-#{@id}"
      end

      def english_notes_form_labels
        @english_notes_form_labels ||= ['time of note', 'notes']
      end
    end
  end
end
