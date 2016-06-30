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
      array_of_elements_equal?(
        elements: all('.control-label'),
        ids: (0..22),
        expectation: expected_form_fields
      )
    end

    def has_health_unit_options?
      selector[0].click
      array_of_elements_equal?(
        elements: all('.select2-result-label'),
        ids: (0..9),
        expectation: expected_health_unit_options
      )
      select_response(site)
    end

    def has_relationship_options?
      navigation.scroll_down
      [1, 2, 6].each do |selector_id|
        selector[selector_id].click
        array_of_elements_equal?(
          elements: all('.select2-result-label'),
          ids: (0..number_of_choices),
          expectation: expected_relationship_options
        )
        select_response(choice)
      end
    end

    def has_gender_options?
      array_of_elements_equal?(
        elements: find('.form-group', text: gender_label).all('.radio-inline'),
        ids: (0..1),
        expectation: expected_gender_options
      )
    end

    private

    def navigation
      Navigation.new(locale: @locale)
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
