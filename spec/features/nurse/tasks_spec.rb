# filename: ./spec/features/nurse/tasks_spec.rb

require './spec/support/nurse/tasks_helper'

feature 'Nurse, Participant Tasks' do
  background do
    english_nurse.sign_in
  end

  scenario 'Nurse marks help request as resolved' # task should be removed
  scenario 'Nurse contacts supervisor for help request' # should see a confirmation
  scenario 'Nurse sees when the previous supervisor contact was sent' # check against two with different dates
  scenario 'Nurse marks non-connectivity task as resolved'
  scenario 'Nurse contacts supervisor non-connectivity task'
  scenario 'Nurse marks non-adherence task as resolved'
  scenario 'Nurse contacts supervisor for non-adherence task'
  scenario 'Nurse sees empty progress bar' # should be just active confirmation call
  scenario 'Nurse cancels confirmation call'
  scenario 'Nurse cancels out of reschedule confirmation call form'
  scenario 'Nurse reschedules confirmation call'

  scenario 'Nurse cancels out of confirmation call form' do
    navigation.scroll_down
    pt_306_nurse_tasks.open

    expect(pt_306_nurse_tasks).to have_confirmation_call_task_active

    expect(pt_306_nurse_tasks).to_not have_initial_in_person_appt_task_active

    confirmation_call.confirm
    navigation.cancel

    expect(confirmation_call).to_not have_confirmation_call_task_complete

    expect(pt_306_nurse_tasks).to_not have_initial_in_person_appt_task_active
  end

  scenario 'Nurse confirms confirmation call' do
    navigation.scroll_down
    pt_306_nurse_tasks.open

    expect(pt_306_nurse_tasks).to have_confirmation_call_task_active

    expect(pt_306_nurse_tasks).to_not have_initial_in_person_appt_task_active

    confirmation_call.confirm
    confirmation_call.enter_first_appt_location
    navigation.submit

    # expect(pt_306_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_306_nurse_tasks).to have_initial_in_person_appt_task_active

    # # check profile page for completeness
    # profile.go_to_profile_of('Last-306, First')
    # expect(profile).to have_first_contact_information

    # # check Your Patients list for old / new tasks
  end

  scenario 'Nurse cancels initial in-person appointment'
  scenario 'Nurse cancels out of initial in-person appt reschedule form'
  scenario 'Nurse reschedules initial in-person appointment'

  scenario 'Nurse cancels out of a initial in-person appt creation form' do
    navigation.scroll_down
    pt_313_nurse_tasks.open

    expect(pt_313_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_313_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    navigation.cancel

    expect(pt_313_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_313_nurse_tasks).to_not have_initial_in_person_appt_task_complete
  end

  scenario 'Nurse must enter a integer in session length field' do
    navigation.scroll_down
    pt_314_nurse_tasks.open

    expect(pt_314_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_314_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    initial_in_person_appt.enter_location
    pt_314_nurse_tasks.enter_session_length
    initial_in_person_appt.enter_phone_note
    initial_in_person_appt.select_engagement
    initial_in_person_appt.select_chances
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse cannot submit without entering session length' do
    navigation.scroll_down
    pt_315_nurse_tasks.open

    expect(pt_315_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_315_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    initial_in_person_appt.enter_location
    initial_in_person_appt.select_pt_comfort_with_phone
    initial_in_person_appt.enter_phone_note
    initial_in_person_appt.select_engagement
    initial_in_person_appt.select_chances
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse cannot submit without entering comfort' do
    navigation.scroll_down
    pt_316_nurse_tasks.open

    expect(pt_316_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_316_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    initial_in_person_appt.enter_location
    pt_316_nurse_tasks.enter_session_length
    initial_in_person_appt.enter_phone_note
    initial_in_person_appt.select_engagement
    initial_in_person_appt.select_chances
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse cannot submit without selecting engagement' do
    navigation.scroll_down
    pt_317_nurse_tasks.open

    expect(pt_317_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_317_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    initial_in_person_appt.enter_location
    pt_317_nurse_tasks.enter_session_length
    initial_in_person_appt.select_pt_comfort_with_phone
    initial_in_person_appt.enter_phone_note
    initial_in_person_appt.select_chances
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse cannot submit without selecting chances' do
    navigation.scroll_down
    pt_318_nurse_tasks.open

    expect(pt_318_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_318_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    initial_in_person_appt.enter_location
    pt_318_nurse_tasks.enter_session_length
    initial_in_person_appt.select_pt_comfort_with_phone
    initial_in_person_appt.enter_phone_note
    initial_in_person_appt.select_engagement
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse creates an initial in-person appointment' do
    navigation.scroll_down
    pt_319_nurse_tasks.open

    expect(pt_319_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_319_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.open
    initial_in_person_appt.enter_location
    pt_319_nurse_tasks.enter_session_length
    initial_in_person_appt.select_pt_comfort_with_phone
    initial_in_person_appt.enter_phone_note
    initial_in_person_appt.select_engagement
    initial_in_person_appt.select_chances
    initial_in_person_appt.enter_general_notes
    navigation.submit

    contact_information.enter_smartphone_number
    contact_information.select_all_smartphone_radios
    navigation.submit # what happens if I cancel?

    expect(pt_319_nurse_tasks).to have_confirmation_call_task_complete

    # expect(pt_319_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_319_nurse_tasks).to have_new_follow_up_call_week_1_task

    expect(pt_319_nurse_tasks).to have_new_follow_up_call_week_3_task

    expect(pt_319_nurse_tasks).to have_new_call_to_schedule_final_appt_task

    # check reports page for notes
    clinical_summary.open

    expect(clinical_summary).to have_first_appt_notes_visible

    # check profile page for completeness
    # scroll_by('500')
    # profile.go_to_profile_of('Last-319, First')

    # expect(profile).to have_first_appointment_information
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
