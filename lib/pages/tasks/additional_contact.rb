require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/additional_contact'

module Tasks
  # page object for first contact page of active participants
  class AdditionalContact
    include RSpec::Matchers
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::AdditionalContact

    def initialize(additional_contact)
      @locale = additional_contact.fetch(:locale, 'english')
    end

    def open
      find('#participant-menu').click
      find('a', text: "#{register} #{additional_contact_title.downcase}").click
    end

    def create_for_call
      open
      find('.select2-container', match: :first)
      selector[5].click
      select_list_item(options[1])
      navigation.submit
    end

    def create_for_in_person
      open
      find('.select2-container', match: :first)
      selector[5].click
      select_list_item(options[0])
      navigation.submit
    end

    def choose_option
      select_list_item(options.sample)
    end

    def has_contact_title?
      actual = find('h1').text
      expect(actual).to eq(additional_contact_title)
    end

    def has_form_headings?
      has_task_form_headings?(1)
    end

    def has_type_options?
      has_task_options?(5, 1)
    end

    def has_current_date_selections?
      has_date_selectors?(today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_time_selectors?(3, 4)
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
