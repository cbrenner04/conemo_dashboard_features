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

    initial_in_person_appt.confirm
    navigation.cancel

    expect(pt_313_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_313_nurse_tasks).to_not have_initial_in_person_appt_task_complete
  end

  scenario 'Nurse must enter a integer in session length field' do
    navigation.scroll_down
    pt_314_nurse_tasks.open
    initial_in_person_appt.confirm
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
    initial_in_person_appt.confirm
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
    initial_in_person_appt.confirm
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
    initial_in_person_appt.confirm
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
    initial_in_person_appt.confirm
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
    initial_in_person_appt.confirm
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

  scenario 'Nurse cancels follow up call week one'
  scenario 'Nurse cancels out of reschedule follow up week one'
  scenario 'Nurse reschedules follow up call week one'

  scenario 'Nurse cancels out of follow up call week 1 creation form' do
    navigation.scroll_down
    pt_322_nurse_tasks.open

    expect(pt_322_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_322_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_322_nurse_tasks).to have_follow_up_call_week_1_task_active

    follow_up_week_1.confirm
    navigation.cancel

    expect(pt_326_nurse_tasks).to_not have_follow_up_call_week_1_task_complete
  end

  scenario 'Nurse must enter integer into length of call' do
    navigation.scroll_down
    pt_323_nurse_tasks.open
    follow_up_week_1.confirm
    pt_323_nurse_tasks.enter_session_length
    navigation.submit

    expect(follow_up_week_1).to be be_visible
  end

  scenario 'Nurse cannot submit follow up call week 1 wo selecting ability' do
    navigation.scroll_down
    pt_324_nurse_tasks.open
    follow_up_week_1.confirm
    follow_up_week_1.fill_in_questions
    pt_324_nurse_tasks.select_motivation
    follow_up_week_1.select_chances
    pt_324_nurse_tasks.enter_session_length
    follow_up_week_1.enter_notes
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse cannot submit follow up call wk 1 wo selecting motivation' do
    navigation.scroll_down
    pt_325_nurse_tasks.open

    expect(pt_325_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_325_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_325_nurse_tasks).to have_follow_up_call_week_1_task_active

    follow_up_week_1.confirm
    follow_up_week_1.fill_in_questions
    pt_325_nurse_tasks.select_ability
    follow_up_week_1.select_chances
    pt_325_nurse_tasks.enter_session_length
    follow_up_week_1.enter_notes
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse cannot submit follow up call week 1 wo selecting chances' do
    navigation.scroll_down
    pt_326_nurse_tasks.open
    follow_up_week_1.confirm
    follow_up_week_1.fill_in_questions
    pt_326_nurse_tasks.select_ability
    pt_326_nurse_tasks.select_motivation
    pt_326_nurse_tasks.enter_session_length
    follow_up_week_1.enter_notes
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse cannot submit follow up call wk 1 wo entering call length' do
    navigation.scroll_down
    pt_327_nurse_tasks.open
    follow_up_week_1.confirm
    follow_up_week_1.fill_in_questions
    pt_327_nurse_tasks.select_ability
    pt_327_nurse_tasks.select_motivation
    follow_up_week_1.select_chances
    follow_up_week_1.enter_notes
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse creates a follow up call week 1' do
    navigation.scroll_down
    pt_328_nurse_tasks.open
    follow_up_week_1.confirm
    follow_up_week_1.fill_in_questions
    pt_328_nurse_tasks.select_ability
    pt_328_nurse_tasks.select_motivation
    follow_up_week_1.select_chances
    pt_328_nurse_tasks.enter_session_length
    follow_up_week_1.enter_notes
    navigation.submit

    # expect(pt_328_nurse_tasks).to have_follow_up_call_week_1_task_complete

    # check reports page for notes
    clinical_summary.open

    expect(reports).to have_second_contact_notes_visible

    # check profile page for completeness
    # scroll_by('1250')
    # profile.go_to_profile_of('Last-328, First')
    # expect(profile).to have_second_contact_information
  end

  scenario 'Nurse cancels follow up call week 3'
  scenario 'Nurse cancels out of reschedule follow up call week 3'
  scenario 'Nurse reschedules follow up call week 3'

  scenario 'Nurse cancels third contact creation' do
    pt_330_nurse_tasks.open

    expect(pt_330_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_330_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_330_nurse_tasks).to have_follow_up_week_1_task_complete

    expect(pt_330_nurse_tasks).to have_follow_up_week_3_task_active

    follow_up_week_3.confirm
    navigation.cancel

    expect(pt_330_nurse_tasks).to have_follow_up_week_3_task_complete
  end

  scenario 'Nurse must enter an integer for length of call in third contact' do
    pt_331_nurse_tasks.open
    follow_up_week_3.confirm
    pt_331_nurse_tasks.enter_session_length
    navigation.submit

    expect(follow_up_week_3).to_not be_visible
  end

  scenario 'Nurse cannot submit without entering length of call' do
    pt_332_nurse_tasks.open
    follow_up_week_3.confirm
    follow_up_week_3.enter_final_appt_location
    follow_up_week_3.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to_not be_visible
  end

  scenario 'Nurse cannot submit without entering final appt location' do
    pt_333_nurse_tasks.open
    follow_up_week_3.confirm
    pt_333_nurse_tasks.enter_session_length
    follow_up_week_3.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to_not be_visible
  end

  scenario 'Nurse cannot submit form without selecting ability' do
    pt_334_nurse_tasks.open
    follow_up_week_3.confirm
    pt_334_nurse_tasks.enter_session_length
    follow_up_week_3.enter_final_appt_location
    follow_up_week_3.respond_to_questions
    active_participants.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to_not be_visible
  end

  scenario 'Nurse cannot submitform without selecting motivation' do
    pt_335_nurse_tasks.open
    follow_up_week_3.confirm
    pt_335_nurse_tasks.enter_session_length
    follow_up_week_3.enter_final_appt_location
    follow_up_week_3.respond_to_questions
    active_participants.select_ability
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to_not be_visible
  end

  scenario 'Nurse creates a third contact' do
    pt_336_nurse_tasks.open
    follow_up_week_3.confirm
    pt_336_nurse_tasks.enter_session_length
    follow_up_week_3.enter_final_appt_location
    follow_up_week_3.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    # expect(pt_336_nurse_tasks).to have_follow_up_week_3_task_complete

    expect(pt_336_nurse_tasks).to have_call_to_schedule_final_appt_task_active

    # check reports page for notes
    clinical_summary.open

    expect(clinical_summary).to have_third_contact_notes_visible

    # # check profile page for completeness
    # scroll_by('1500')
    # profile.go_to_profile_of('Last-336, First')
    # expect(profile).to have_third_contact_information
  end

  scenario 'Nurse cancels call to schedule final appointment'
  scenario 'Nurse cancels out of reschedule call to schedule final appointment'
  scenario 'Nurse reschedules call to schedule final appointment'

  scenario 'Nurse cancels out of call to schedule final appointment' do
    pt_700_nurse_tasks.open

    expect(pt_700_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_700_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_700_nurse_tasks).to have_follow_up_week_1_task_complete

    expect(pt_700_nurse_tasks).to have_follow_up_week_3_task_complete

    expect(pt_700_nurse_tasks).to have_call_to_schedule_final_appt_task_active

    call_to_schedule_final_appointment.confirm
    navigation.cancel

    expect(pt_700_nurse_tasks)
      .to_not have_call_to_schedule_final_appt_task_complete
  end

  scenario 'Nurse cannot submit without selecting final appt location' do
    pt_701_nurse_tasks.open
    call_to_schedule_final_appointment.confirm
    navigation.submit

    expect(call_to_schedule_final_appointment).to be_visible
  end

  scenario 'Nurse creates call to schedule final appointment' do
    pt_702_nurse_tasks.open
    call_to_schedule_final_appointment.confirm
    call_to_schedule_final_appointment.select_location
    navigation.submit

    # expect(pt_702_nurse_tasks)
    #   .to have_call_to_schedule_final_appt_task_complete

    expect(pt_702_nurse_tasks).to have_final_appt_task_active
  end

  scenario 'Nurse cancels final appointment'
  scenario 'Nurse cancels out of reschedule final appointment'
  scenario 'Nurse reschedules final appointment'

  scenario 'Nurse cancels final appointment form' do
    pt_338_nurse_tasks.open

    expect(pt_338_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_338_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_338_nurse_tasks).to have_follow_up_week_1_task_complete

    expect(pt_338_nurse_tasks).to have_follow_up_week_3_task_complete

    expect(pt_338_nurse_tasks)
      .to have_call_to_schedule_final_appt_task_complete

    expect(pt_338_nurse_tasks).to have_final_appt_task_active

    final_appointment.confirm
    navigation.cancel

    expect(pt_338_nurse_tasks).to_not have_final_appt_task_complete
  end

  scenario 'Nurse cannot submit final appointment without location' do
    pt_339_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(final_appointment).tot be_visible
  end

  scenario 'Nurse cannot submit final appt wo responding to phone return' do
    pt_340_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_location
    final_appointment.enter_notes
    navigation.submit

    expect(final_appointment).to be_visible
  end

  scenario 'Nurse creates a final appointment' do
    pt_341_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_location
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    # expect(pt_341_nurse_tasks).to have_final_appt_task_complete

    # check reports page for notes
    clinical_summary.open

    expect(clinical_summary).to have_final_appt_notes_visible

    # # check profile page for completeness
    # profile.go_to_profile_of('Last-341, First')
    # expect(profile).to have_final_appointment_information
  end
end
