require './lib/pages/shared/translations'
path = './lib/pages/shared/translations/contact_information/'
require "#{path}spanish_contact_information"
require "#{path}portuguese_contact_information"
require "#{path}english_contact_information"

module Translations
  # module for Contact Information page
  module ContactInformation
    include Translations
    include Translations::ContactInformation::SpanishContactInformation
    include Translations::ContactInformation::PortugueseContactInformation
    include Translations::ContactInformation::EnglishContactInformation

    def profile_heading
      heading = locale('Perfil de', 'Perfil de', 'Profile for')
      "#{heading} First Last-#{@id}"
    end

    def expected_headings
      locale(spanish_headings, portuguese_headings, english_headings)
    end

    def expected_timeline_titles
      locale(spanish_timeline_titles, portuguese_timeline_titles,
             english_timeline_titles)
    end

    def expected_contact_dates
      locale(spanish_contact_dates, portuguese_contact_dates,
             english_contact_dates)
    end

    def expected_timeline_headings
      locale(spanish_timeline_headings, portuguese_timeline_headings,
             english_timeline_headings)
    end
  end
end
