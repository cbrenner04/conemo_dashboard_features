# filename: ./spec/features/nurse/patient_contact_information_spec.rb

require './lib/pages/navigation'
require './lib/pages/your_patients'
require './lib/pages/your_patients/nurse_tasks/contact_information'

def navigation
  @navigation ||= Navigation.new
end

def your_patients
  @your_patients ||= YourPatients.new
end

def contact_information
  @contact_information ||= YourPatients::NurseTasks::ContactInformation.new
end

feature 'Nurse, Participant Contact Information' do
  background do
    english_nurse.sign_in
  end

  scenario 'Nurse views participant profile' do
    contact_information.go_to_profile_of('Last-300, First')
    expect(contact_information).to be_visible_with_id('300')
  end

  scenario 'Nurse cancels out of edit of participant information' do
    contact_information.go_to_profile_of('Last-301, First')
    contact_information.select_edit_contact_information
    navigation.cancel

    expect(contact_information).to be_visible_with_id('301')
  end

  scenario 'Nurse edits participant information from the profile page' do
    contact_information.go_to_profile_of('Last-301, First')
    contact_information.select_edit_contact_information
    contact_information.fill_in_email('participant301@example.com')
    navigation.submit

    expect(page).to have_content 'Email: participant301@example.com'
  end

  scenario 'Nurse cancels out of edit of smartphone information' do
    navigation.scroll_down
    contact_information.go_to_profile_of('Last-310, First')
    contact_information.select_edit_smartphone_information
    navigation.cancel

    expect(your_patients).to be_visible
  end

  scenario 'Nurse enters smartphone information' do
    contact_information.go_to_profile_of('Last-302, First')
    contact_information.select_edit_smartphone_information
    contact_information.enter_smartphone_number
    contact_information.select_all_smartphone_radios
    navigation.submit
    contact_information.go_to_profile_of('Last-302, First')

    expect(page).to have_content 'Smartphone Information: 1234567890'
  end

  scenario 'Nurse edits first contact from profile page' do
    4.times { navigation.scroll_down }
    contact_information.go_to_profile_of('Last-342, First')
    contact_information.edit_session('First Contact')
    first_contact.assert_on_page
    navigation.submit

    expect(your_patients).to be_visible
  end

  scenario 'Nurse edits first appointment from profile page' do
    4.times { navigation.scroll_down }
    contact_information.go_to_profile_of('Last-342, First')
    sleep(1)
    contact_information.edit_session('First Appointment')
    first_appointment.assert_on_page
    navigation.submit

    expect(your_patients).to be_visible
  end

  scenario 'Nurse edits second contact from profile page' do
    4.times { navigation.scroll_down }
    contact_information.go_to_profile_of('Last-342, First')
    contact_information.edit_session('Second Contact')
    second_contact.assert_on_page
    navigation.submit

    expect(your_patients).to be_visible
  end

  scenario 'Nurse edits third contact from profile page' do
    4.times { navigation.scroll_down }
    contact_information.go_to_profile_of('Last-343, First')
    contact_information.edit_session('Third Contact')
    third_contact.assert_on_page
    navigation.submit

    expect(your_patients).to be_visible
  end

  scenario 'Nurse edits final appointment from profile page' do
    4.times { navigation.scroll_down }
    contact_information.go_to_profile_of('Last-342, First')
    contact_information.edit_session('Final Appointment')
    final_appointment.assert_on_page
    navigation.submit

    expect(your_patients).to be_visible
  end
end
