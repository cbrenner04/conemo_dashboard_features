# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/translations/supervisor_page/participants'
require './lib/pages/your_patients'

module Supervisor
  # page object for active participants table on supervisor page
  class ActiveTable
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::ParticipantsTranslations

    def initialize(active_table)
      @pt_id ||= active_table[:pt_id]
      @nurse ||= active_table[:nurse]
      @locale ||= active_table.fetch(:locale, 'english')
    end

    def has_active_patient?
      active_panel.find('input[type = search]').set('300')
      active_panel.has_text? "Last-300, First 300 #{standard_date(today)}"
    end

    def has_total_active?
      has_panel_heading?('157 Active')
    end

    def has_active_participant_information?
      your_patients.english_nurse_patients.all? do |patient|
        active_panel.find('input[type = search]').set(patient)
        has_css?('tr',
                 text: 'Edit Information Nurse-400, English Edit Information ' \
                       "Last-#{patient}, First #{patient}")
      end
    end

    def active?
      active_panel.find('input[type = search]').set(@pt_id)
      active_panel
        .has_css?('tr',
                  text: "Edit Information Nurse-#{@nurse}, #{language} Edit " \
                        "Information Last-#{@pt_id}, First #{@pt_id} " \
                        "#{standard_date(today)} Treatment termination")
    end

    def terminate
      retry_action_with_scroll_up do
        active_panel.find('tr', text: @pt_id).find('.fa-thumbs-down').click
        sleep(0.25)
        accept_alert(termination_alert)
      end
    end

    def has_active_panel_title?
      has_css?('.panel', text: active_participants_header)
    end

    def has_active_table_headers?
      array_of_elements_equal?(
        elements: active_panel.all('th'),
        ids: [0, 1, 3, 4, 5, 6],
        expectation: expected_active_headers
      )
    end

    private

    def navigation
      Navigation.new(locale: @locale)
    end

    def your_patients
      YourPatients.new(locale: @locale)
    end

    def active_panel
      find('.panel', text: active_participants_header)
    end

    def has_panel_heading?(heading)
      has_css?('.panel-heading', text: heading)
    end
  end
end
