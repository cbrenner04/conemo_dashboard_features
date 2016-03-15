require './lib/pages/shared/translations/clinical_summary'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/your_patients/nurse_tasks/clinical_summary'

class YourPatients
  class NurseTasks
    class ClinicalSummary
      # page object for notes form
      class NotesForm
        include RSpec::Matchers
        include Capybara::DSL
        include NurseTasksForms
        include Translations::ClinicalSummary

        def initialize(notes_form)
          @id ||= notes_form[:id]
          @locale ||= notes_form[:locale]
        end

        def open
          find('th', text: notes_heading).find('.fa-edit').click
        end

        def create_note
          open
          fill_in 'patient_contact[note]', with: @note
          navigation.submit
        end

        def has_form_heading?
          actual_heading = find('h1').text
          expect(actual_heading).to eq(expected_notes_form_heading)
        end

        def has_form_labels?
          actual_labels = (0..2).map { |i| all('.control-label')[i].text }
          expect(actual_labels).to eq(expected_notes_form_labels)
        end

        def has_notes_headers?
          clinical_summary.has_notes_headers?
        end

        def has_contact_dates?
          clinical_summary.has_contact_dates?
        end

        def has_reason_options?
          selector[5].click
          # sleep(1)
          actual = (0..3).map { |i| all('.select2-result-label')[i].text }
          expect(actual).to eq(expected_notes_reason_options)
        end

        private

        def navigation
          @navigation ||= Navigation.new(locale: @locale)
        end

        def clinical_summary
          @clinical_summary ||= YourPatients::NurseTasks::ClinicalSummary.new(
            locale: @locale
          )
        end
      end
    end
  end
end
