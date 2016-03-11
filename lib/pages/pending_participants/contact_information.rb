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
  end
end
