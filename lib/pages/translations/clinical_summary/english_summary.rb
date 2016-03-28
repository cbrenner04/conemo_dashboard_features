module Translations
  module ClinicalSummaryTranslations
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

      def english_release_dates
        relative_release_date = (1..15).map do |i|
          ((Date.today - @start_date_offset) + (i - 1)).strftime('%B %d, %Y')
        end
        @english_release_dates ||= relative_release_date
      end

      def english_contact_dates
        contact_day = [0, 14, 35, 42]
        relative_contact_date = contact_day.map do |i|
          (Date.today - i).strftime('%B %d, %Y')
        end
        @english_contact_dates ||= relative_contact_date
      end

      def english_notes_form_heading
        @english_notes_heading ||= "Create Note for First Last-#{@id}"
      end

      def english_notes_form_labels
        @english_notes_form_labels ||= ['time of note', 'reason', 'notes']
      end

      def english_notes_reason_options
        @english_notes_reason_options ||=
          ['Programmed follow-up call', 'Non-adherence',
           'Requested phone call by patient', 'Other']
      end
    end
  end
end
