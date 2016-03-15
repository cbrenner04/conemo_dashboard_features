require './lib/pages/shared/contact_information_form'
require './lib/pages/shared/translations/pending_participants'

class PendingParticipants
  # page_object for the contact information page
  class ContactInformation
    include RSpec::Matchers
    include Capybara::DSL
    include ContactInformationForm
    include Translations::PendingParticipants

    def initialize(contact_information)
      @first_name ||= contact_information[:first_name]
      @last_name ||= contact_information[:last_name]
      @id ||= contact_information[:id]
      @unit ||= contact_information[:unit]
      @family_record ||= contact_information[:family_record]
      @phone ||= contact_information[:phone]
      @emergency_contact_name ||= contact_information[:emergency_contact_name]
      @emergency_contact_phone ||= contact_information[:emergency_contact_phone]
      @email ||= contact_information[:email]
      @address ||= contact_information[:address]
      @enrollment_date ||= contact_information[:enrollment_date]
      @gender ||= contact_information[:gender]
      @locale ||= contact_information[:locale]
    end

    def complete_form
      fill_in_first_name
      fill_in_last_name
      fill_in_study_id
      fill_in_health_unit
      fill_in_family_record
      fill_in_phone
      fill_in_emergency_contact_name
      fill_in_emergency_contact_phone
      fill_in_email
      fill_in_address
      select_dob
      choose_gender
      choose_chronic_disorder
    end

    def has_form_fields?
      find('.form-group', match: :first)
      actual = (0..23).map { |i| all('.control-label')[i].text }
      expect(actual).to eq(expected_form_fields)
    end

    def has_health_unit_options?
      site = @locale == 'spanish' ? 'Centro de salud 2' : 'Unidade de Saúde 2'
      all('.select2-container')[3].click
      actual = (0..9).map { |i| all('.select2-result-label')[i].text }
      find('.select2-result-label', text: site).click
      expect(actual).to eq(expected_health_unit_options)
    end

    def has_relationship_options?
      choice = @locale == 'spanish' ? 'Padre / Madre' : 'Pai / Mãe'
      num = @locale == 'portuguese' ? 4 : 5
      execute_script('window.scrollBy(0,500)')
      all('.select2-container')[4].click
      options_1 = (0..num).map { |i| all('.select2-result-label')[i].text }
      find('.select2-result-label', text: choice).click
      all('.select2-container')[5].click
      options_2 = (0..num).map { |i| all('.select2-result-label')[i].text }
      find('.select2-result-label', text: choice).click
      all('.select2-container')[9].click
      options_3 = (0..num).map { |i| all('.select2-result-label')[i].text }
      find('.select2-result-label', text: choice).click
      options_1 == expected_relationship_options &&
        options_2 == expected_relationship_options &&
        options_3 == expected_relationship_options
    end

    def has_gender_options?
      gender_group = find('.form-group', text: gender_label)
      actual = (0..1).map { |i| gender_group.all('.radio-inline')[i].text }
      expect(actual).to eq(gender_options)
    end
  end
end
