# frozen_string_literal: true
require './lib/pages/translations/contact_information'

module ContactInfo
  # page object for smartphone information portion of contact information
  class SmartphoneInformation
    include Capybara::DSL
    include Translations::ContactInformation

    def initialize(smartphone_information)
      @pt_id ||= smartphone_information[:pt_id]
      @locale ||= smartphone_information.fetch(:locale, 'english')
    end

    def visible?
      has_css?('h1', text: 'Input Smartphone Information')
    end

    def select_edit
      find('.col-sm-5', text: contact_information_title)
        .all('.fa-edit')[1].click
    end

    def enter_smartphone_number
      fill_in 'smartphone[number]', with: '12345678901'
    end

    def enter_phone_id
      fill_in 'smartphone[phone_identifier]', with: "123#{@pt_id}"
    end

    def has_smartphone_information?
      has_text? "#{phone_number_header} 12345678901 " \
                "#{serial_number_header} 123#{@pt_id}"
    end

    def has_successful_smartphone_creation_alert?
      has_css?('.alert', text: smartphone_creation_alert)
    end
  end
end
