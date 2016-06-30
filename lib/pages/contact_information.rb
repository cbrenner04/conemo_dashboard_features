# frozen_string_literal: true
require './lib/pages/shared/contact_information_form'
require './lib/pages/translations/contact_information'

# page object for profile page of active participants
class ContactInformation
  include RSpec::Matchers
  include Capybara::DSL
  include ContactInformationForm
  include Translations::ContactInformation

  def initialize(contact_information)
    @pt_id ||= contact_information[:pt_id]
    @locale ||= contact_information.fetch(:locale, 'english')
  end

  def updated?
    has_text? 'Saved information successfully'
  end

  def visible?
    has_css?('.col-sm-5',
             text: 'Contact information Family health unit: unit 1 ' \
                   "Telephone: 13333333#{@pt_id} Cell phone: Telephone: " \
                   'Alternate phone 1: Contact person: ' \
                   'Home address: 123 Main Street Gender: female')
  end

  def view_all
    click_on view_all_button
  end

  def has_extra_information_visible?
    sleep(1)
    birth_date = today - ((30 * 365) + @pt_id.to_i)
    has_css?('.col-sm-5',
             text: 'Emergency contact (name): ' \
                   "Birth date: #{standard_date(birth_date)} " \
                   'Alternate phone 2: Relationship: If other, specify here: ' \
                   'Contact person: Relationship: If other, specify here: ' \
                   'Relationship: If other, specify here: Address: Cell phone:')
  end

  def select_edit_contact_information
    contact_information_div.first('.fa-edit').click
  end

  def has_contact_information_title?
    has_css?('h3', text: contact_information_title)
  end

  def has_contact_information_table_headings?
    array_of_elements_equal?(
      elements: contact_information_div.all('strong'),
      ids: (0..9),
      expectation: expected_headings
    )
  end

  def has_extra_contact_information_table_headings?
    sleep(0.25) # misses the last heading otheriwse
    array_of_elements_equal?(
      elements: contact_information_div.all('strong'),
      ids: (8..19),
      expectation: expected_extra_headings
    )
  end

  def has_saved_contact_information_alert?
    has_css?('.alert', text: saved_contact_information_alert)
  end

  def has_id_disabled?
    find('#participant_study_identifier')[:disabled].to_s.should eq 'true'
  end

  def has_health_unit_disabled?
    find('#participant_family_health_unit_name')[:disabled].to_s
                                                           .should eq 'true'
  end

  private

  def contact_information_div
    find('.col-sm-5', text: contact_information_title)
  end
end
