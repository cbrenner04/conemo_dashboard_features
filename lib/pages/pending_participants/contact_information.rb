require './lib/pages/navigation'
require './lib/pages/shared/contact_information_form'
require './lib/pages/translations/pending_participants'

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
      @address ||= contact_information[:address]
      @phone ||= contact_information[:phone]
      @contact_person ||= contact_information[:contact_person]
      @gender ||= contact_information[:gender]
      @locale ||= contact_information[:locale]
    end

    def complete_form
      fill_in_first_name
      fill_in_last_name
      fill_in_study_id
      select_health_unit
      fill_in_address
      choose_gender
    end

    def has_form_fields?
      find('.form-group', match: :first)
      actual = (0..23).map { |i| all('.control-label')[i].text }
      expect(actual).to eq(expected_form_fields)
    end

    def has_health_unit_options?
      site = locale('Centro de salud 2', 'Unidade de Saúde 2', 'unit 2')
      selector[3].click
      actual = (0..9).map { |i| all('.select2-result-label')[i].text }
      select_response(site)
      expect(actual).to eq(expected_health_unit_options)
    end

    def has_relationship_options?
      choice = locale('Padre / Madre', 'Pai / Mãe', 'parent')
      num = locale(5, 4, 5)
      navigation.scroll_down
      selector[4].click
      options_1 = (0..num).map { |i| response_selector[i].text }
      select_response(choice)
      selector[5].click
      options_2 = (0..num).map { |i| response_selector[i].text }
      select_response(choice)
      selector[9].click
      options_3 = (0..num).map { |i| response_selector[i].text }
      select_response(choice)
      [options_1, options_2, options_3]
        .all? { |options| options == expected_relationship_options }
    end

    def has_gender_options?
      gender_group = find('.form-group', text: gender_label)
      actual = (0..1).map { |i| gender_group.all('.radio-inline')[i].text }
      expect(actual).to eq(gender_options)
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: 'english')
    end
  end
end
