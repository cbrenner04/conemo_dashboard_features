# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/translations/supervisor_page/participants'

module Supervisor
  # page object for Participants section of the Nurse Supervisor page
  class Participants
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::ParticipantsTranslations

    def initialize(participants)
      @pt_id ||= participants[:pt_id]
      @locale ||= participants.fetch(:locale, 'english')
    end

    def has_participants_title?
      has_css?('h3', text: participants_title)
    end

    def assign_nurse
      find('h1', text: "#{nurse_assignment_heading} First Last-#{@pt_id}")
      select_nurse
      sleep(1)
      # updated to `find('input..` from `navigation.submit` for Poltergeist
      find('input[value = "Save"]').click
    end

    def edit_information
      retry_action_with_scroll_down do
        find('tr', text: @pt_id).find('.fa-edit').click
        find('.form-group', match: :first)
      end
    end

    def reassign
      retry_action_with_scroll_up do
        navigation.scroll_down
        active_panel.find('tr', text: @pt_id).find('.fa-user-md').click
        assign_nurse
      end
    end

    private

    def navigation
      Navigation.new(locale: @locale)
    end

    def select_nurse
      if ENV['driver'] == 'poltergeist'
        select 'Nurse-404, English', from: 'participant[nurse_id]'
      else
        find('select').click
        find('option', text: 'Nurse-404, English').double_click
      end
    end
  end
end
