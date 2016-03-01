# filename: ./spec/features/nurse/participant_tasks_spec.rb

feature 'Nurse, Participant Tasks' do
  scenario 'Nurse cancels out of first contact form' do
    active_participants.create_contact_for('307')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse creates first contact' do
    active_participants.create_contact_for('306')
    first_contact.assert_on_page
    first_contact.enter_first_appt_location
    navigation.submit

    within active_participants.pt_row('306') do
      expect(first_contact).to be_visible
    end

    # check profile page for completeness
    profile.go_to_profile_of('Last-306, First')
    expect(profile).to have_first_contact_information
  end

  scenario 'Nurse cancels out of a first appointment reschedule form' do
    scroll_by('500')
    active_participants.reschedule_appt_for('311')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse reschedules a first appointment' do
    scroll_by('500')
    active_participants.reschedule_appt_for('312')
    active_participants.reschedule('first_appointment')

    expect(active_participants).to be_rescheduled_for('312')
  end

  scenario 'Nurse cancels out of a first appointment creation form' do
    scroll_by('500')
    active_participants.create_contact_for('313')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse must enter a integer in session length field' do
    scroll_by('500')
    active_participants.create_contact_for('314')
    first_appointment.enter_location
    active_participants.enter_session_length('first_appointment', 'asdf')
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  scenario 'Nurse cannot submit first appointment form without entering session length' do
    scroll_by('500')
    active_participants.create_contact_for('315')
    first_appointment.enter_location
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  scenario 'Nurse cannot submit first appointment form without entering comfort' do
    scroll_by('500')
    active_participants.create_contact_for('316')
    first_appointment.enter_location
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  scenario 'Nurse cannot submit first appointment form without selecting engagement' do
    scroll_by('500')
    active_participants.create_contact_for('317')
    first_appointment.enter_location
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  scenario 'Nurse cannot submit first appointment form without selecting chances' do
    scroll_by('500')
    active_participants.create_contact_for('318')
    first_appointment.enter_location
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  scenario 'Nurse creates a first appointment' do
    scroll_by('750')
    active_participants.create_contact_for('319')
    first_appointment.enter_location
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    profile.enter_smartphone_number('1234567890')
    profile.select_all_smartphone_radios
    navigation.submit

    expect(first_appointment).to be_created_for_participant('319')

    # check profile page for completeness
    scroll_by('500')
    profile.go_to_profile_of('Last-319, First')

    expect(profile).to have_first_appointment_information

    # check reports page for notes
    active_participants.open
    active_participants.assert_on_page
    scroll_by('500')
    reports.open_for('319')

    expect(reports).to have_first_appt_notes_visible
  end

  scenario 'Nurse cancels out of  second contact creation form' do
    scroll_by('1000')
    active_participants.reschedule_appt_for('320')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse reschedules a second contact' do
    scroll_by('1000')
    active_participants.reschedule_appt_for('321')
    active_participants.reschedule('second_contact')

    expect(active_participants).to be_rescheduled_for('321')
  end

  scenario 'Nurse cancels out of second contact creation form' do
    scroll_by('1000')
    active_participants.create_contact_for('322')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse must enter integer into length of call' do
    scroll_by('1000')
    active_participants.create_contact_for('323')
    active_participants.enter_session_length('second_contact', 'asdf')
    navigation.submit

    expect(active_participants).to_not be be_visible
  end

  scenario 'Nurse cannot submit second contact without selecting ability' do
    scroll_by('1000')
    active_participants.create_contact_for('324')
    second_contact.fill_in_questions
    active_participants.select_motivation
    second_contact.select_chances
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit second contact without selecting motivation' do
    scroll_by('1000')
    active_participants.create_contact_for('325')
    second_contact.fill_in_questions
    active_participants.select_ability
    second_contact.select_chances
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit second contact without selecting chances' do
    scroll_by('1000')
    active_participants.create_contact_for('326')
    second_contact.fill_in_questions
    active_participants.select_ability
    active_participants.select_motivation
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit second contact without entering length of call' do
    scroll_by('1000')
    active_participants.create_contact_for('327')
    second_contact.fill_in_questions
    active_participants.select_ability
    active_participants.select_motivation
    second_contact.select_chances
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse creates a second contact' do
    scroll_by('1250')
    active_participants.create_contact_for('328')
    second_contact.fill_in_questions
    active_participants.select_ability
    active_participants.select_motivation
    second_contact.select_chances
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(second_contact)
      .to be_created_for_participant('328')

    # check profile page for completeness
    scroll_by('1250')
    profile.go_to_profile_of('Last-328, First')
    expect(profile).to have_second_contact_information

    # check reports page for notes
    active_participants.open
    active_participants.assert_on_page
    scroll_by('1250')
    reports.open_for('328')

    expect(reports).to have_second_contact_notes_visible
  end

  scenario 'Nurse reschedules third contact' do
    scroll_by('1500')
    active_participants.reschedule_appt_for('329')
    active_participants.reschedule('third_contact')

    expect(active_participants).to be_rescheduled_for('329')
  end

  scenario 'Nurse cancels third contact creation' do
    scroll_by('1500')
    active_participants.create_contact_for('330')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse must enter an integer for length of call in third contact' do
    scroll_by('1500')
    active_participants.create_contact_for('331')
    third_contact.assert_on_page
    active_participants.enter_session_length('third_contact', 'asdf')
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit third contact form without entering length of call' do
    scroll_by('1500')
    active_participants.create_contact_for('332')
    third_contact.assert_on_page
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit third contact form w/o entering final appt location' do
    scroll_by('1500')
    active_participants.create_contact_for('333')
    third_contact.assert_on_page
    active_participants.enter_session_length('third_contact', '60')
    third_contact.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit third contact form without selecting ability' do
    scroll_by('1500')
    active_participants.create_contact_for('334')
    third_contact.assert_on_page
    active_participants.enter_session_length('third_contact', '60')
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit third contact form without selecting motivation' do
    scroll_by('1500')
    active_participants.create_contact_for('335')
    third_contact.assert_on_page
    active_participants.enter_session_length('third_contact', '60')
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_ability
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse creates a third contact' do
    scroll_by('1500')
    active_participants.create_contact_for('336')
    third_contact.assert_on_page
    active_participants.enter_session_length('third_contact', '60')
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(third_contact).to be_created_for_participant('336')

    # check profile page for completeness
    scroll_by('1500')
    profile.go_to_profile_of('Last-336, First')
    expect(profile).to have_third_contact_information

    # check reports page for notes
    active_participants.open
    active_participants.assert_on_page
    scroll_by('1500')
    reports.open_for('336')

    expect(reports).to have_third_contact_notes_visible
  end

  scenario 'Nurse reschedules final appointment' do
    scroll_by('1500')
    active_participants.reschedule_appt_for('337')
    active_participants.reschedule('final_appointment')

    expect(active_participants).to be_rescheduled_for('337')
  end

  scenario 'Nurse cancels final appointment form' do
    scroll_by('2000')
    active_participants.create_contact_for('338')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  scenario 'Nurse cannot submit final appointment without location' do
    scroll_by('2000')
    active_participants.create_contact_for('339')
    final_appointment.assert_on_page
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse cannot submit final appointment without responding to phone return' do
    scroll_by('2000')
    active_participants.create_contact_for('340')
    final_appointment.assert_on_page
    final_appointment.enter_location
    final_appointment.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  scenario 'Nurse creates a final appointment' do
    scroll_by('2000')
    active_participants.create_contact_for('341')
    final_appointment.assert_on_page
    final_appointment.enter_location
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(final_appointment).to be_created_for_participant('341')

    # check profile page for completeness
    scroll_by('2000')
    profile.go_to_profile_of('Last-341, First')
    expect(profile).to have_final_appointment_information

    # check reports page for notes
    active_participants.open
    active_participants.assert_on_page
    scroll_by('2000')
    reports.open_for('341')

    expect(reports).to have_final_appt_notes_visible
  end
end
