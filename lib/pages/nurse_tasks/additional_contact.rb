require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/additional_contact'

class NurseTasks
  # page object for first contact page of active participants
  class AdditionalContact
    include RSpec::Matchers
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTasksTranslations::AdditionalContact

    def initialize(additional_contact)
      @locale = additional_contact[:locale]
    end

    def open
      click_on additional_contact_title
    end

    def create
      open
      sleep(1)
      selector[5].click
      choose_option
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
      has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
        has_time_selectors?(3, 4)
    end
  end
end
