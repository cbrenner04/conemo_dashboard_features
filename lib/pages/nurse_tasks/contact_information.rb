require './lib/pages/shared/contact_information_form'
require './lib/pages/translations/contact_information'

class NurseTasks
  # page object for profile page of active participants
  class ContactInformation
    include RSpec::Matchers
    include Capybara::DSL
    include ContactInformationForm
    include Translations::ContactInformation

    def initialize(contact_information)
      @id ||= contact_information[:id]
      @locale ||= contact_information[:locale]
    end

    def updated?
      has_text? 'Successfully updated participant'
    end

    def visible?
      date_1 = Date.today - ((30 * 365) + @id.to_i)
      has_css?('#contact-info',
               text: 'Contact Information Family ' \
                     'Health Unit Name: unit 1 Phone: ' \
                     "13333333#{@id} Emergency Contact Name: Emergency " \
                     'Contact Phone: Date Of Birth: ' \
                     "#{date_1.strftime('%B %d, %Y')} Address: 123 Main " \
                     'Street Enrollment Date: ' \
                     "#{Date.today.strftime('%B %d, %Y')} Gender: female")
    end

    def select_edit_contact_information
      find('#contact-info').find('.fa-edit').click
    end

    def select_edit_smartphone_information
      find('#smartphone-info').find('.fa-edit').click
    end

    def enter_smartphone_number
      fill_in 'smartphone[number]', with: '12345678901'
    end

    def enter_phone_id
      fill_in 'smartphone[phone_identifier]', with: "123#{@id}"
    end

    def has_smartphone_information?
      has_text? "#{phone_number_header}: 12345678901\n" \
                "#{serial_number_header}: 123#{@id}"
    end

    def has_contact_information_title?
      has_css?('h2', text: contact_information_title)
    end

    def has_smartphone_information_title?
      has_css?('h2', text: smartphone_information_title)
    end

    def has_contact_information_table_headings?
      table = find('#contact-info')
      actual_headings = (0..8).map { |i| table.all('strong')[i].text }
      expect(actual_headings).to eq(expected_headings)
    end
  end
end
