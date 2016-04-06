require './lib/pages/navigation'

class SupervisorPage
  # page object for Participants section of the Nurse Supervisor page
  class Participants
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(participants)
      @pt_id ||= participants[:pt_id]
      @enrollment_date ||= participants[:enrollment_date]
      @nurse ||= participants[:nurse]
    end

    def activate
      find('.panel', text: 'Pending').find('tr', text: "#{@pt_id}")
        .find('.fa-thumbs-up').click
      find('h1', text: 'Assign nurse to activate participant ' \
                       "First Last-#{@pt_id}")
    end

    def has_nurse_options?
      find('select').click
      actual_options = (0..4).map { |i| all('option')[i].text }
      expect(actual_options).to eq(expected_options)
    end

    def assign_nurse
      find('select').click
      find('option', text: 'Nurse-404, English').double_click
      sleep(1)
      navigation.submit
    end

    def active?
      find('.panel', text: 'Active')
        .has_css?('tr',
                  text: "Edit Information Nurse-#{@nurse}, English Edit " \
                        "Information Last-#{@pt_id}, First #{@pt_id} " \
                        "#{enrollment} #{today} Treatment termination")
    end

    def terminate
      tries ||= 1
      find('.panel', text: 'Active').find('tr', text: "#{@pt_id}")
        .find('.fa-thumbs-down').click
      accept_alert('Are you sure you want to mark this person as ineligible?')
    rescue Capybara::ModalNotFound
      navigation.scroll_up
      tries += 1
      retry unless tries > 5
    end

    def dropped?
      # # enrollment date and nurse not included at the moment
      # find('.panel', text: 'Dropped out')
      #   .has_css?('tr', text: 'Nurse-401, English '
      #                         "Last-#{@pt_id}, First #{@pt_id} " \
      #                         "#{enrollment} #{today}")

      find('.panel', text: 'Dropped out')
        .has_css?('tr', text: "Last-#{@pt_id}, First #{@pt_id} #{today}")
    end

    def reassign
      tries ||= 1
      find('.panel', text: 'Active').find('tr', text: "#{@pt_id}")
        .find('.fa-user-md').click
      sleep(1)
      assign_nurse
    rescue Capybara::ElementNotFound
      navigation.scroll_up
      tries += 1
      retry unless tries > 5
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: 'english')
    end

    def today
      @today ||= Date.today.strftime('%B %d, %Y')
    end

    def enrollment
      @enrollment ||= @enrollment_date.strftime('%B %d, %Y')
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
