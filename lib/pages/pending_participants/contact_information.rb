require './lib/pages/shared/contact_information_form'

class PendingParticipants
  # page_object for the contact information page
  class ContactInformation
    include Capybara::DSL
    include ContactInformationForm

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
    end
  end
end
