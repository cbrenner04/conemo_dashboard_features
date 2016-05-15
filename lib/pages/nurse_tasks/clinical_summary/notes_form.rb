require './lib/pages/translations/clinical_summary'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/nurse_tasks/clinical_summary'

class NurseTasks
  class ClinicalSummary
    # page object for notes form
    class NotesForm
      include RSpec::Matchers
      include Capybara::DSL
      include NurseTasksForms
      include Translations::ClinicalSummaryTranslations

      def initialize(notes_form)
        @id ||= notes_form[:id]
        @note ||= notes_form[:note]
        @locale ||= notes_form.fetch(:locale, 'english')
      end

      def open
        find('th', text: notes_heading).find('.fa-edit').click
      end

      def create_note
        fill_in 'patient_contact[note]', with: @note
        navigation.submit
      end

      def has_form_heading?
        has_css?('h1', text: expected_notes_form_heading)
      end

      def has_form_labels?
        labels = all('.control-label')
        actual_labels = (0..1).map { |i| labels[i].text }
        expect(actual_labels).to eq(expected_notes_form_labels)
      end

      def has_notes_headers?
        clinical_summary.has_notes_headers?
      end

      def has_contact_dates?
        clinical_summary.has_contact_dates?
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: @locale)
      end

      def clinical_summary
        @clinical_summary ||= NurseTasks::ClinicalSummary.new(locale: @locale)
      end
    end
  end
end
