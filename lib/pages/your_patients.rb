# page object for active participants
class YourPatients
  include Capybara::DSL

  # def visible?
  #   has_css?('h1', text: 'Your Patients')
  # end

  # def reschedule(contact)
  #   find('h1', text: 'Reschedule')
  #   contact_replacements = { 'first_appointment' => 'first_contact',
  #                            'second_contact' => 'first_appointment',
  #                            'third_contact' => 'second_contact',
  #                            'final_appointment' => 'third_contact' }
  #   reason = ["Patient didn't come", 'Patient asked to reschedule',
  #             'NA asked to reschedule', 'Other (specify below)'].sample
  #   select reason, from: "#{contact_replacements[contact]}" \
  #                        '[patient_contacts_attributes][0][contact_reason]'
  #   fill_in "#{contact_replacements[contact]}" \
  #           '[patient_contacts_attributes][0][note]', with: 'Reasoning'
  #   click_on 'Save'
  # end
end
