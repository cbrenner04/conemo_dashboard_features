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
      @locale ||= contact_information.fetch(:locale, 'english')
    end

    def updated?
      has_text? 'Saved information successfully'
    end

    def visible?
      has_css?('.col-sm-5',
               text: 'Contact information Family health unit: unit 1 ' \
                     "Telephone: 13333333#{@id} Cell phone: Telephone: " \
                     'Alternate phone 1: Contact person: ' \
                     'Home address: 123 Main Street Gender: female')
    end

    def view_all
      click_on view_all_button
    end

    def has_extra_information_visible?
      birth_date = Date.today - ((30 * 365) + @id.to_i)
      has_css?('.col-sm-5',
               text: 'Emergency contact (name): ' \
                     "Birth date: #{birth_date.strftime('%B %d, %Y')} " \
                     'Alternate phone 2: Relationship: Relationship: ' \
                     'Contact person: Relationship: Relationship: ' \
                     'Relationship: Relationship: Address: Cell phone:')
    end

    def select_edit_contact_information
      contact_information_div.first('.fa-edit').click
    end

    def has_smartphone_form_visible?
      has_css?('h1', text: 'Input Smartphone Information')
    end

    def select_edit_smartphone_information
      contact_information_div.all('.fa-edit')[1].click
    end

    def enter_smartphone_number
      fill_in 'smartphone[number]', with: '12345678901'
    end

    def enter_phone_id
      fill_in 'smartphone[phone_identifier]', with: "123#{@id}"
    end

    def has_smartphone_information?
      has_text? "#{phone_number_header} 12345678901 " \
                "#{serial_number_header} 123#{@id}"
    end

    def has_contact_information_title?
      has_css?('h3', text: contact_information_title)
    end

    def has_smartphone_information_title?
      has_css?('h3', text: smartphone_information_title)
    end

    def has_contact_information_table_headings?
      headings = contact_information_div.all('strong')
      actual_headings = (0..9).map { |i| headings[i].text }
      expect(actual_headings).to eq(expected_headings)
    end

    def has_extra_contact_information_table_headings?
      headings = contact_information_div.all('strong')
      actual_headings = (8..19).map { |i| headings[i].text }
      expect(actual_headings).to eq(expected_extra_headings)
    end

    def has_saved_contact_information_alert?
      has_css?('.alert', text: saved_contact_information_alert)
    end

    def has_successful_smartphone_creation_alert?
      has_css?('.alert', text: smartphone_creation_alert)
    end

    def has_id_disabled?
      find('#participant_study_identifier')[:disabled].should eq 'true'
    end

    def has_health_unit_disabled?
      find('#participant_family_health_unit_name')[:disabled].should eq 'true'
    end

    private

    def contact_information_div
      find('.col-sm-5', text: contact_information_title)
    end
  end
end
