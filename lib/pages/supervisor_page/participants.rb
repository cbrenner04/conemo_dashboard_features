require './lib/pages/navigation'
require './lib/pages/translations/supervisor_page/participants'

class SupervisorPage
  # page object for Participants section of the Nurse Supervisor page
  class Participants
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::ParticipantsTranslations

    def initialize(participants)
      @pt_id ||= participants[:pt_id]
      @nurse ||= participants[:nurse]
      @locale ||= participants.fetch(:locale, 'english')
    end

    def activate
      pending_panel
        .find('tr', text: @pt_id)
        .find('.fa-thumbs-up').click
      find('h1', text: 'Assign nurse to activate participant ' \
                       "First Last-#{@pt_id}")
    end

    def has_nurse_options?
      find('select').click
      actual_options = (0..4).map { |i| all('option')[i].text }
      actual_options.should =~ expected_options
    end

    def assign_nurse
      sleep(0.25)
      find('select').click
      find('option', text: 'Nurse-404, English').double_click
      sleep(0.25)
      navigation.submit
    end

    def active?
      active_panel
        .find('input[type = search]')
        .set(@pt_id)
      active_panel
        .has_css?('tr',
                  text: "Edit Information Nurse-#{@nurse}, #{language} Edit " \
                        "Information Last-#{@pt_id}, First #{@pt_id} " \
                        "#{locale_date(Date.today)} Treatment termination")
    end

    def terminate
      tries ||= 1
      active_panel
        .find('tr', text: @pt_id)
        .find('.fa-thumbs-down').click
      sleep(0.25)
      accept_alert(termination_alert)
    rescue Capybara::ModalNotFound
      navigation.scroll_up
      tries += 1
      retry unless tries > 2
    end

    def dropped?
      dropped_panel
        .find('input[type = search]')
        .set(@pt_id)
      dropped_panel
        .has_css?('tr', text: "Nurse-#{@nurse}, #{language} " \
                              "Last-#{@pt_id}, First #{@pt_id} " \
                              "#{locale_date(Date.today)}")
    end

    def reassign
      tries ||= 1
      active_panel
        .find('tr', text: @pt_id)
        .find('.fa-user-md').click
      sleep(0.25)
      assign_nurse
    rescue Capybara::ElementNotFound
      navigation.scroll_up
      tries += 1
      retry unless tries > 2
    end

    def has_pending_panel_title?
      has_css?('.panel', text: pending_participants_header)
    end

    def has_pending_table_headers?
      actual_headers = (0..4).map { |i| pending_panel.all('th')[i].text }
      expect(actual_headers).to eq(pending_headers)
    end

    def has_active_panel_title?
      has_css?('.panel', text: active_participants_header)
    end

    def has_active_table_headers?
      actual = [0, 1, 3, 4, 5, 6].map { |i| active_panel.all('th')[i].text }
      expect(actual).to eq(active_headers)
    end

    def has_completed_panel_title?
      has_css?('.panel', text: completed_participants_header)
    end

    def has_completed_table_headers?
      actual_headers = (0..3).map { |i| completed_panel.all('th')[i].text }
      expect(actual_headers).to eq(completed_headers)
    end

    def has_dropped_panel_title?
      has_css?('.panel', text: dropped_participants_header)
    end

    def has_dropped_table_headers?
      actual_headers = (0..3).map { |i| dropped_panel.all('th')[i].text }
      expect(actual_headers).to eq(dropped_headers)
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end

    def language
      locale('Spanish', 'Portuguese', 'English')
    end

    def pending_panel
      find('.panel', text: pending_participants_header)
    end

    def active_panel
      find('.panel', text: active_participants_header)
    end

    def completed_panel
      find('.panel', text: completed_participants_header)
    end

    def dropped_panel
      find('.panel', text: locale('suspendido', 'Tratamento', 'Dropped'))
    end

    def expected_options
      @expected_options ||= [
        'Nurse-400, English',
        'Nurse-401, English',
        'Nurse-402, English',
        'Nurse-403, English',
        'Nurse-404, English'
      ]
    end
  end
end
