# filename: ./spec/features/nurse/patient_contact_information_spec.rb

feature 'Nurse, Participant Contact Information' do
  scenario 'Nurse views participant profile' do
    profile.go_to_profile_of('Last-300, First')
    expect(profile).to be_visible_with_id('300')
  end

  scenario 'Nurse cancels out of edit of participant information' do
    profile.go_to_profile_of('Last-301, First')
    profile.select_edit_contact_information
    navigation.cancel

    expect(profile).to be_visible_with_id('301')
  end

  scenario 'Nurse edits participant information from the profile page' do
    profile.go_to_profile_of('Last-301, First')
    profile.select_edit_contact_information
    contact_information.fill_in_email('participant301@example.com')
    navigation.submit

    expect(page).to have_content 'Email: participant301@example.com'
  end

  scenario 'Nurse cancels out of edit of smartphone information' do
    scroll_by('500')
    profile.go_to_profile_of('Last-310, First')
    profile.select_edit_smartphone_information
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse enters smartphone information' do
    profile.go_to_profile_of('Last-302, First')
    profile.select_edit_smartphone_information
    profile.enter_smartphone_number('1234567890')
    profile.select_all_smartphone_radios
    navigation.submit
    profile.go_to_profile_of('Last-302, First')

    expect(page).to have_content 'Smartphone Information: 1234567890'
  end

  scenario 'Nurse edits first contact from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    profile.edit_session('First Contact')
    first_contact.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  scenario 'Nurse edits first appointment from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    sleep(1)
    scroll_by('100')
    profile.edit_session('First Appointment')
    first_appointment.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  scenario 'Nurse edits second contact from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    profile.edit_session('Second Contact')
    second_contact.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  scenario 'Nurse edits third contact from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-343, First')
    profile.edit_session('Third Contact')
    third_contact.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  scenario 'Nurse edits final appointment from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    profile.edit_session('Final Appointment')
    final_appointment.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end
end
