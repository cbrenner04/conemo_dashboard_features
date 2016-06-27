# frozen_string_literal: true
require './lib/pages/translations/supervisor_page/participants'

module Supervisor
  # page object for Completed Participants Table on nurse supervisor page
  class CompletedTable
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::ParticipantsTranslations

    def has_total_completed?
      has_panel_heading?('12 Completed')
    end

    def has_updated_completed?
      has_panel_heading?('13 Completed')
    end

    def has_new_completed_participant_information?
      date = standard_date(today - 39)
      completed_panel.find('input[type = search]').set('341')
      has_css?('tr', text: "Nurse-400, English Last-341, First 341 #{date}")
    end

    def has_completed_participant_information?
      # updated to use `select...` for Poltergeist
      within(completed_panel) { select '25', from: 'DataTables_Table_2_length' }
      within(completed_panel.find('.table')) do
        array_of_elements_match?(
          elements: all('tr'),
          ids: (1..12),
          expectation: COMPLETED_PT_EXPECTED_ROWS
        )
      end
    end

    COMPLETED_PT_EXPECTED_ROWS = [
      "Nurse-401, English Last-4041, First 4041 #{standard_date(today - 14)}",
      "Nurse-401, English Last-4042, First 4042 #{standard_date(today - 15)}",
      "Nurse-401, English Last-4043, First 4043 #{standard_date(today - 16)}",
      "Nurse-401, English Last-4044, First 4044 #{standard_date(today - 17)}",
      "Nurse-401, English Last-4045, First 4045 #{standard_date(today - 18)}",
      "Nurse-401, English Last-4046, First 4046 #{standard_date(today - 19)}",
      "Nurse-403, English Last-4047, First 4047 #{standard_date(today - 20)}",
      "Nurse-403, English Last-4048, First 4048 #{standard_date(today - 21)}",
      "Nurse-403, English Last-4049, First 4049 #{standard_date(today - 22)}",
      "Nurse-403, English Last-4050, First 4050 #{standard_date(today - 23)}",
      "Nurse-403, English Last-4051, First 4051 #{standard_date(today - 24)}",
      "Nurse-403, English Last-4052, First 4052 #{standard_date(today - 25)}"
    ].freeze

    def select_completed_pt
      completed_panel.find('input[type = search]').set('341')
      completed_panel.find('tr', text: 'Last-341').click
    end

    def has_completed_panel_title?
      has_css?('.panel', text: completed_participants_header)
    end

    def has_completed_table_headers?
      array_of_elements_equal?(
        elements: completed_panel.all('th'),
        ids: (0..3),
        expectation: expected_completed_headers
      )
    end

    private

    def completed_panel
      find('.panel', text: completed_participants_header)
    end

    def has_panel_heading?(heading)
      has_css?('.panel-heading', text: heading)
    end
  end
end
