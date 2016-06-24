# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/shared/contact_information_form'
require './lib/pages/translations/pending_participants'

module NewParticipants
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
      actual = (0..22).map { |label_number| labels[label_number].text }
      expect(actual).to eq(expected_form_fields)
    end

    def has_health_unit_options?
      selector[0].click
      selections = all('.select2-result-label')
      actual = (0..9).map { |selector_num| selections[selector_num].text }
      select_response(site)
      expect(actual).to eq(expected_health_unit_options)
    end

    def has_relationship_options?
      navigation.scroll_down
      [1, 2, 6].each do |selector_number|
        check_relationship_options(selector_number)
      end
    end

    def has_gender_options?
      gender_group = find('.form-group', text: gender_label)
                     .all('.radio-inline')
      actual = (0..1).map { |option_number| gender_group[option_number].text }
      expect(actual).to eq(expected_gender_options)
    end

    private

    def navigation
      Navigation.new(locale: @locale)
    end

    def check_relationship_options(selector_number)
      selector[selector_number].click
      actual = (0..number_of_choices).map do |option_number|
        response_selector[option_number].text
      end
      expect(actual).to eq expected_relationship_options
      select_response(choice)
    end

    def number_of_choices
      localize(spanish: 5, portuguese: 4, english: 5)
    end

    def site
      localize(
        spanish: 'Centro de salud 2',
        portuguese: 'Celso Daniel',
        english: 'unit 2'
      )
    end

    def choice
      localize(
        spanish: 'Padre / Madre',
        portuguese: 'Pai / Mãe',
        english: 'parent'
      )
    end
  end
end
