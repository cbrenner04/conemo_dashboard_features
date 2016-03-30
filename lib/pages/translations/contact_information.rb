require './lib/pages/translations/nurse_tasks'
path = './lib/pages/translations/contact_information/'
require "#{path}spanish_contact_information"
require "#{path}portuguese_contact_information"
require "#{path}english_contact_information"

module Translations
  # module for Contact Information page
  module ContactInformation
    include Translations::NurseTasksTranslations
    include Translations::ContactInformation::SpanishContactInformation
    include Translations::ContactInformation::PortugueseContactInformation
    include Translations::ContactInformation::EnglishContactInformation

    def contact_information_title
      locale('Información de contacto', 'Informações de Contato',
             'Contact Information')
    end

    def smartphone_information_title
      locale('Smartphone', 'Informações de Smartphone',
             'Smartphone Information')
    end

    def profile_heading
      @profile_heading ||= locale('Información de contacto',
                                  'Informações de Contato',
                                  'Contact Information')
    end

    def expected_headings
      locale(spanish_headings, portuguese_headings, english_headings)
    end

    def expected_timeline_titles
      [confirmation_call_title, initial_appointment_title,
       follow_up_week_one_title, non_adherence_call_title,
       follow_up_week_three_title, lack_of_connectivity_call_title,
       help_request_title, call_to_schedule_final_title,
       final_appointment_title]
    end

    def expected_contact_info_contact_dates
      locale(spanish_contact_info_contact_dates,
             portuguese_contact_info_contact_dates,
             english_contact_info_contact_dates)
    end

    def expected_timeline_headings
      locale(spanish_timeline_headings, portuguese_timeline_headings,
             english_timeline_headings)
    end
  end
end
