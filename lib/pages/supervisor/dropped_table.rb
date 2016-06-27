# frozen_string_literal: true
require './lib/pages/translations/supervisor_page/participants'

module Supervisor
  # page object for Dropped Participants Table on nurse supervisor page
  class DroppedTable
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::ParticipantsTranslations

    def initialize(dropped_table)
      @nurse ||= dropped_table[:nurse]
      @pt_id ||= dropped_table[:pt_id]
      @locale ||= dropped_table.fetch(:locale, 'english')
    end

    def has_total_dropped_out?
      has_panel_heading?('14 Dropped out')
    end

    def has_dropped_participant_information?
      # updated to use `select...` for Poltergeist
      within(dropped_panel) { select '25', from: 'DataTables_Table_3_length' }
      within(dropped_panel.find('.table')) do
        array_of_elements_match?(
          elements: all('tr'),
          ids: (1..14),
          expectation: DROPPED_PT_EXPECTED_ROWS
        )
      end
    end

    DROPPED_PT_EXPECTED_ROWS = [
      "Nurse-402, English Last-202, First 202 #{standard_date(today - 5)}",
      "Nurse-402, English Last-203, First 203 #{standard_date(today - 6)}",
      "Nurse-402, English Last-204, First 204 #{standard_date(today - 7)}",
      "Nurse-402, English Last-205, First 205 #{standard_date(today - 8)}",
      "Nurse-402, English Last-206, First 206 #{standard_date(today - 10)}",
      "Nurse-402, English Last-207, First 207 #{standard_date(today - 11)}",
      "Nurse-402, English Last-208, First 208 #{standard_date(today - 12)}",
      "Nurse-402, English Last-209, First 209 #{standard_date(today - 13)}",
      "Nurse-402, English Last-210, First 210 #{standard_date(today - 14)}",
      "Nurse-402, English Last-211, First 211 #{standard_date(today - 15)}",
      "Nurse-402, English Last-212, First 212 #{standard_date(today - 16)}",
      "Nurse-402, English Last-213, First 213 #{standard_date(today - 17)}",
      "Nurse-400, English Last-200, First 200 #{standard_date(today)}",
      "Nurse-400, English Last-201, First 201 #{standard_date(today)}"
    ].freeze

    def dropped?
      dropped_panel.find('input[type = search]').set(@pt_id)
      dropped_panel
        .has_css?('tr', text: "Nurse-#{@nurse}, #{language} " \
                              "Last-#{@pt_id}, First #{@pt_id} " \
                              "#{standard_date(today)}")
    end

    def has_dropped_panel_title?
      has_css?('.panel', text: dropped_participants_header)
    end

    def has_dropped_table_headers?
      array_of_elements_equal?(
        elements: dropped_panel.all('th'),
        ids: (0..3),
        expectation: expected_dropped_headers
      )
    end

    private

    def has_panel_heading?(heading)
      has_css?('.panel-heading', text: heading)
    end

    def dropped_panel
      find('.panel',
           text: localize(spanish: 'Suspensión',
                          portuguese: 'Tratamento', english: 'Dropped'))
    end
  end
end
