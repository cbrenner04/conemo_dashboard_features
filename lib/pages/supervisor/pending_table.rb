# frozen_string_literal: true
require './lib/pages/translations/supervisor_page/participants'

module Supervisor
  # page object for Pending Participants Table on nurse supervisor page
  class PendingTable
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::ParticipantsTranslations

    def initialize(pending_table)
      @pt_id ||= pending_table[:pt_id]
      @locale ||= pending_table.fetch(:locale, 'english')
    end

    def has_pending_participants?
      within(pending_panel) do
        array_of_elements_equal?(
          elements: find('tbody').all('tr'),
          ids: (0..3),
          expectation: PENDING_PT_EXPECTED_ROWS
        )
      end
    end

    def has_patient?
      pending_panel
        .has_text? "Last-#{@pt_id}, First #{@pt_id} #{standard_date(today)}"
    end

    PENDING_PT_EXPECTED_ROWS = [
      "Edit Information Last-495, First 495 #{standard_date(today)} Activate",
      "Edit Information Last-496, First 496 #{standard_date(today)} Activate",
      "Edit Information Last-497, First 497 #{standard_date(today)} Activate",
      "Edit Information Last-498, First 498 #{standard_date(today)} Activate"
    ].freeze

    def activate
      pending_panel.find('tr', text: @pt_id).find('.fa-thumbs-up').click
    end

    def has_nurse_assignment_form_visible?
      has_css?('h1', text: "#{nurse_assignment_heading} First Last-#{@pt_id}")
    end

    def has_nurse_options?
      find('select').click
      sleep(0.25) # won't wait to map otherwise
      array_of_elements_match?(
        elements: all('option'),
        ids: (0..4),
        expectation: expected_options
      )
    end

    EXPECTED_NURSE_OPTIONS = [
      'Nurse-400, English',
      'Nurse-401, English',
      'Nurse-402, English',
      'Nurse-403, English',
      'Nurse-404, English'
    ].freeze

    def has_pending_panel_title?
      has_css?('.panel', text: pending_participants_header)
    end

    def has_pending_table_headers?
      array_of_elements_equal?(
        elements: pending_panel.all('th'),
        ids: (0..4),
        expectation: expected_pending_headers
      )
    end

    private

    def pending_panel
      find('.panel', text: pending_participants_header)
    end
  end
end
