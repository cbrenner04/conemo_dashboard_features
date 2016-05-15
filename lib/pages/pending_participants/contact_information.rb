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
      @locale ||= contact_information.fetch(:locale, 'english')
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
      labels = all('.control-label')
      actual = (0..22).map { |i| labels[i].text }
      expect(actual).to eq(expected_form_fields)
    end

    def has_health_unit_options?
      site = localize(
        spanish: 'Centro de salud 2',
        portuguese: 'Celso Daniel',
        english: 'unit 2'
      )
      selector[0].click
      selections = all('.select2-result-label')
      actual = (0..9).map { |i| selections[i].text }
      select_response(site)
      expect(actual).to eq(expected_health_unit_options)
    end

    def has_relationship_options?
      choice = localize(
        spanish: 'Padre / Madre',
        portuguese: 'Pai / Mãe',
        english: 'parent'
      )
      num = localize(spanish: 5, portuguese: 4, english: 5)
      navigation.scroll_down
      # first Relationship drop down
      selector[1].click
      options_1 = (0..num).map { |i| response_selector[i].text }
      select_response(choice)
      # second Relationship drop down
      selector[2].click
      options_2 = (0..num).map { |i| response_selector[i].text }
      select_response(choice)
      # third Relationship drop down
      selector[6].click
      options_3 = (0..num).map { |i| response_selector[i].text }
      select_response(choice)
      [options_1, options_2, options_3]
        .all? { |options| options == expected_relationship_options }
    end

    def has_gender_options?
      gender_group = find('.form-group', text: gender_label)
                     .all('.radio-inline')
      actual = (0..1).map { |i| gender_group[i].text }
      expect(actual).to eq(expected_gender_options)
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
