require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations/nurse_tasks'
require './lib/pages/shared/translations/nurse_tasks/additional_contact'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class AdditionalContact
      include RSpec::Matchers
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks
      include Translations::NurseTasks::AdditionalContact

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
        select_list_item(options.sample)
        navigation.submit
      end

      def has_contact_title?
        actual = find('h1').text
        expect(actual).to eq(additional_contact_title)
      end

      def has_form_headings?
        actual_headings = (0..1).map { |i| all('.control-label')[i].text }
        expect(actual_headings).to eq(expected_headings)
      end

      def has_type_options?
        selector[5].click
        actual_option = (0..1).map { |i| all('.select2-result-label')[i].text }
        expect(actual_option).to eq(options)
      end
    end
  end
end
