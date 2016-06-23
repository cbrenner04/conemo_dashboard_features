# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/tasks/initial_in_person_appointment'
require './lib/pages/tasks/follow_up_call_week_one'
require './lib/pages/tasks/follow_up_call_week_three'
require './lib/pages/translations/clinical_summary'

module Summary
  # page object for notes in clinical Summary
  class Notes
    include RSpec::Matchers
    include Capybara::DSL
    include NurseTasksForms
    include ClinicalSummaryTranslations

    def initialize(notes)
      @locale ||= notes.fetch(:locale, 'english')
      @note ||= notes[:note]
      @pt_id ||= notes[:pt_id] # needed for translations for notes_headings
    end

    def has_note?
      notes_table
        .has_css?('dt', text: additional_note_title) && has_text?(@note)
    end

    def delete_note
      find('td', text: @note).find('.fa-times-circle').click
      accept_alert 'Are you sure you want to delete this note?'
    end

    def has_first_appt_notes_visible?
      has_text? "#{initial_appointment_title}\n" \
                "#{initial_in_person_appointment.general_notes}\n" \
                "#{standard_date(yesterday)}"
    end

    def has_follow_up_week_1_notes_visible?
      has_text? "#{follow_up_week_one_title}\n" \
                "#{follow_up_call_week_one.general_notes}\n" \
                "#{standard_date(today)}"
    end

    def has_follow_up_week_3_notes_visible?
      has_text? "#{follow_up_week_three_title}\n" \
                "#{follow_up_call_week_three.general_notes}\n" \
                "#{standard_date(today)}"
    end

    def has_notes_headers?
      headers = notes_table.all('dt')
      actual_notes_headers = (0..3).map { |cell_num| headers[cell_num].text }
      expect(actual_notes_headers).to eq(expected_notes_headers)
    end

    def has_contact_dates?
      dates = notes_table.all('em')
      expect(
        (0..3).map do |cell_num|
          year = today.strftime('%Y')
          string = dates[cell_num].text
          string.slice(0..(string.index(year) + (year.length - 1)))
        end
      ).to eq(expected_contact_dates)
    end

    def open_form
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
      actual_labels = (0..1).map { |label_num| labels[label_num].text }
      expect(actual_labels).to eq(expected_notes_form_labels)
    end

    private

    def notes_table
      if has_css?('.table', text: notes_heading, count: 1)
        find('.table', text: notes_heading)
      else
        first('.table', text: notes_heading)
      end
    end

    def navigation
      Navigation.new(locale: @locale)
    end

    def initial_in_person_appointment
      Tasks::InitialInPersonAppointment.new(locale: @locale)
    end

    def follow_up_call_week_one
      Tasks::FollowUpCallWeekOne.new(locale: @locale)
    end

    def follow_up_call_week_three
      Tasks::FollowUpCallWeekThree.new(locale: @locale)
    end
  end
end
