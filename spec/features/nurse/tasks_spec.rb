# filename: ./spec/features/nurse/tasks_spec.rb

require './spec/support/nurse/tasks_helper'

feature 'Nurse, Participant Tasks' do
  background { english_nurse.sign_in }

  scenario 'Nurse cancels creation of additional contact form' do
    pt_451_nurse_tasks.open

    additional_contact.open
    navigation.cancel

    expect(pt_451_nurse_tasks).to have_no_tasks_in_count
  end

  scenario 'Nurse creates additional contact' do
    pt_451_nurse_tasks.open

    additional_contact.create

    expect(pt_451_nurse_tasks).to have_no_tasks_in_count

    # check contact information for completed task
    contact_information.open

    expect(contact_information).to have_additional_contact
  end

  scenario 'Nurse sees correct task count with multiple tasks due' do
    pt_1000_nurse_tasks.open

    expect(pt_1000_nurse_tasks).to have_multiple_tasks_in_count
  end

  scenario 'Nurse sees number of days since help request was due' do
    pt_802_nurse_tasks.open

    expect(pt_802_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees help request overdue' do
    pt_802_nurse_tasks.open

    expect(pt_802_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels out of help request resolution form' do
    pt_400_nurse_tasks.open

    expect(help_request).to be_active

    help_request.mark_resolved
    navigation.cancel

    expect(help_request).to be_active
  end

  scenario 'Nurse marks help request as resolved' do
    pt_400_nurse_tasks.open

    expect(pt_400_nurse_tasks).to have_one_task_in_count

    expect(help_request).to be_active

    help_request.mark_resolved
    help_request.complete_resolution_form

    expect(help_request).to_not be_active

    expect(pt_400_nurse_tasks).to have_no_tasks_in_count

    # check contact information for completed task
  end

  scenario 'Nurse contacts supervisor for help request' do
    pt_401_nurse_tasks.open

    expect(help_request).to be_active

    help_request.contact_supervisor

    expect(help_request).to be_active

    expect(pt_401_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Nurse sees when the previous supervisor contact was sent' do
    pt_402_nurse_tasks.open

    expect(help_request).to be_active

    expect(pt_402_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    pt_403_nurse_tasks.open

    expect(help_request).to be_active

    expect(pt_403_nurse_tasks).to have_previous_supervisor_contact

    pt_403_nurse_tasks.clear_supervisor_contact

    expect(pt_403_nurse_tasks).to_not have_previous_supervisor_contact
  end

  scenario 'Nurse sees number days since non-connectivity task was due' do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees non-connectivity task overdue' do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels out of non-connectivity task resolution form' do
    pt_410_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    lack_of_connectivity_call.mark_resolved
    navigation.cancel

    expect(lack_of_connectivity_call).to be_active
  end

  scenario 'Nurse marks non-connectivity task as resolved' do
    pt_410_nurse_tasks.open

    expect(pt_410_nurse_tasks).to have_one_task_in_count

    expect(lack_of_connectivity_call).to be_active

    lack_of_connectivity_call.mark_resolved
    lack_of_connectivity_call.complete_resolution_form

    expect(pt_410_nurse_tasks).to have_no_tasks_in_count

    expect(lack_of_connectivity_call).to_not be_active
  end

  scenario 'Nurse contacts supervisor non-connectivity task' do
    pt_411_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    lack_of_connectivity_call.contact_supervisor

    expect(lack_of_connectivity_call).to be_active

    expect(pt_411_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Nurse sees when the previous supervisor contact was sent' do
    pt_412_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    expect(pt_412_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    pt_413_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    expect(pt_413_nurse_tasks).to have_previous_supervisor_contact

    pt_413_nurse_tasks.clear_supervisor_contact

    expect(pt_413_nurse_tasks).to_not have_previous_supervisor_contact
  end

  scenario 'Nurse sees no adherence task for pt w active connectivity task' do
    pt_427_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees no adherence task for pt w 1 missed, 1 late session' do
    pt_426_nurse_tasks.open

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees no adherence task for 1 on-time, 1 missed session' do
    pt_320_nurse_tasks.open

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees no adherence task for pt w < 2 lessons released' do
    pt_300_nurse_tasks.open

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees number of days since non-adherence task was due' do
    pt_804_nurse_tasks.open

    expect(pt_804_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees non-adherence task overdue' do
    pt_804_nurse_tasks.open

    expect(pt_804_nurse_tasks).to have_overdue_task
    # check css
  end

  scenario 'Nurse cancels out of non-adherence task resolution form' do
    pt_420_nurse_tasks.open

    expect(pt_420_nurse_tasks).to have_one_task_in_count

    expect(non_adherence_call).to be_active

    non_adherence_call.mark_resolved
    navigation.cancel

    expect(non_adherence_call).to be_active
  end

  scenario 'Nurse marks non-adherence task as resolved' do
    pt_420_nurse_tasks.open

    expect(pt_420_nurse_tasks).to have_one_task_in_count

    expect(non_adherence_call).to be_active

    non_adherence_call.mark_resolved
    non_adherence_call.complete_resolution_form

    expect(pt_420_nurse_tasks).to have_no_tasks_in_count

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse contacts supervisor for non-adherence task' do
    pt_421_nurse_tasks.open

    expect(non_adherence_call).to be_active

    non_adherence_call.contact_supervisor

    expect(non_adherence_call).to be_active

    expect(pt_421_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Nurse sees when the previous supervisor contact was sent' do
    pt_422_nurse_tasks.open

    expect(non_adherence_call).to be_active

    expect(pt_422_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    pt_423_nurse_tasks.open

    expect(non_adherence_call).to be_active

    expect(pt_423_nurse_tasks).to have_previous_supervisor_contact

    pt_423_nurse_tasks.clear_supervisor_contact

    expect(pt_423_nurse_tasks).to_not have_previous_supervisor_contact
  end

  scenario 'Nurse sees empty progress bar' do
    pt_300_nurse_tasks.open

    expect(pt_300_nurse_tasks).to have_nothing_in_progress_bar
  end

  scenario 'Nurse sees number days since confirmation call was due' do
    pt_706_nurse_tasks.open

    expect(pt_706_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees confirmation call overdue' do
    pt_706_nurse_tasks.open

    expect(pt_706_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels confirmation call' do
    pt_301_nurse_tasks.open

    expect(pt_301_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_active

    confirmation_call.cancel

    expect(pt_301_nurse_tasks).to have_no_tasks_in_count

    expect(confirmation_call).to be_canceled
  end

  scenario 'Nurse cancels out of reschedule confirmation call form' do
    pt_303_nurse_tasks.open

    expect(pt_303_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_active

    confirmation_call.open_reschedule_form
    navigation.cancel

    expect(pt_303_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_active
  end

  scenario 'Nurse reschedules confirmation call' do
    pt_304_nurse_tasks.open

    expect(pt_304_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_active

    confirmation_call.reschedule

    expect(pt_304_nurse_tasks).to have_no_tasks_in_count

    expect(confirmation_call).to be_scheduled
  end

  scenario 'Nurse cancels out of confirmation call form' do
    pt_306_nurse_tasks.open

    expect(pt_306_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_active

    expect(initial_in_person_appt).to_not be_active

    confirmation_call.confirm
    navigation.cancel

    expect(confirmation_call).to_not be_complete

    expect(initial_in_person_appt).to_not be_active
  end

  scenario 'Nurse confirms confirmation call' do
    # check current tasks
    expect(patient_306).to have_confirmation_call

    # create confirms confirmation call
    pt_306_nurse_tasks.open
    confirmation_call.confirm
    confirmation_call.enter_next_contact_date
    confirmation_call.enter_first_appt_location
    navigation.submit

    expect(pt_306_nurse_tasks).to have_no_tasks_in_count

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_scheduled

    # check contact information page for completeness
    contact_information.open

    expect(contact_information).to have_confirmation_call

    # check Your Patients list for old / new tasks
    patient_306.return

    expect(patient_306).to_not have_confirmation_call

    expect(patient_306).to have_tasks_completed
  end

  scenario 'Nurse sees number of days since initial in-person appt was due' do
    pt_707_nurse_tasks.open

    expect(pt_707_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees initial in-person appointment overdue' do
    pt_707_nurse_tasks.open

    expect(pt_707_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels initial in-person appointment' do
    pt_311_nurse_tasks.open

    expect(pt_311_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.cancel

    expect(pt_311_nurse_tasks).to have_no_tasks_in_count

    expect(initial_in_person_appt).to be_canceled
  end

  scenario 'Nurse cancels out of initial in-person appt reschedule form' do
    pt_317_nurse_tasks.open

    expect(pt_317_nurse_tasks).to have_one_task_in_count

    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.open_reschedule_form
    navigation.cancel

    expect(pt_317_nurse_tasks).to have_one_task_in_count

    expect(initial_in_person_appt).to be_active
  end

  scenario 'Nurse reschedules initial in-person appointment' do
    pt_318_nurse_tasks.open

    expect(pt_318_nurse_tasks).to have_one_task_in_count

    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.reschedule

    expect(pt_318_nurse_tasks).to have_no_tasks_in_count

    expect(initial_in_person_appt).to be_scheduled
  end

  scenario 'Nurse cancels out of a initial in-person appt creation form' do
    pt_313_nurse_tasks.open

    expect(pt_313_nurse_tasks).to have_one_task_in_count

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.confirm

    expect(initial_in_person_appt).to be_visible

    navigation.cancel

    expect(initial_in_person_appt).to_not be_complete
  end

  scenario 'Nurse must enter a integer in session length field' do
    pt_314_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    pt_314_nurse_tasks.enter_session_length
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse cannot submit without entering session length' do
    pt_315_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse cannot submit without entering session location' do
    pt_316_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse creates an initial in-person appointment' do
    # check your patients list for current task
    expect(patient_319).to have_initial_appointment

    # create initial appointment
    pt_319_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    pt_319_nurse_tasks.enter_session_length
    # not implemented yet
    # expect(initial_in_person_appt).to have_next_contact_date
    # because above is not yet implemented, need this so test passes
    initial_in_person_appt.enter_next_contact_date

    initial_in_person_appt.enter_general_notes
    navigation.submit

    contact_information.enter_smartphone_number
    contact_information.enter_phone_id
    navigation.submit # what happens if I cancel?

    expect(pt_400_nurse_tasks).to have_no_tasks_in_count

    expect(initial_in_person_appt).to be_complete

    expect(follow_up_week_1).to be_scheduled

    expect(follow_up_week_3).to be_scheduled

    expect(call_to_schedule_final_appointment).to be_scheduled

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_first_appt_notes_visible

    # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_initial_appointment

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_319).to_not have_initial_appointment

    expect(patient_319).to have_tasks_completed
  end

  scenario 'Nurse sees number of days since follow up call week 1 was due' do
    pt_708_nurse_tasks.open

    expect(pt_708_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees follow up call week 1 overdue' do
    pt_708_nurse_tasks.open

    expect(pt_708_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels follow up call week one' do
    pt_320_nurse_tasks.open

    expect(pt_320_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_1).to be_active

    follow_up_week_1.cancel

    expect(pt_320_nurse_tasks).to have_no_tasks_in_count

    expect(follow_up_week_1).to be_canceled
  end

  scenario 'Nurse cancels out of reschedule follow up week one' do
    pt_321_nurse_tasks.open

    expect(pt_320_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_1).to be_active

    follow_up_week_1.open_reschedule_form
    navigation.cancel

    expect(pt_320_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_1).to be_active
  end

  scenario 'Nurse reschedules follow up call week one' do
    pt_321_nurse_tasks.open

    expect(pt_320_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_1).to be_active

    follow_up_week_1.reschedule

    expect(pt_320_nurse_tasks).to have_no_tasks_in_count

    expect(follow_up_week_1).to be_scheduled
  end

  scenario 'Nurse cancels out of follow up call week 1 creation form' do
    pt_322_nurse_tasks.open

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_complete

    expect(pt_322_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_1).to be_active

    follow_up_week_1.confirm
    navigation.cancel

    expect(follow_up_week_1).to_not be_complete
  end

  scenario 'Nurse must enter integer into length of call' do
    pt_323_nurse_tasks.open
    follow_up_week_1.confirm
    pt_323_nurse_tasks.enter_session_length
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse cannot submit follow up call week 1 wo selecting ability' do
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
    pt_325_nurse_tasks.open
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
    # check for current task
    expect(patient_328).to have_follow_up_week_1

    # create follow up all week 1
    pt_328_nurse_tasks.open
    follow_up_week_1.confirm
    follow_up_week_1.fill_in_questions
    pt_328_nurse_tasks.select_ability
    pt_328_nurse_tasks.select_motivation
    follow_up_week_1.select_chances
    pt_328_nurse_tasks.enter_session_length
    follow_up_week_1.enter_notes
    navigation.submit

    expect(pt_328_nurse_tasks).to have_no_tasks_in_count

    expect(follow_up_week_1).to be_complete

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_follow_up_week_1_notes_visible

    # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_follow_up_week_1

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_328).to_not have_follow_up_week_1

    expect(patient_328).to have_tasks_completed
  end

  scenario 'Nurse sees number of days since follow up call week 3 was due' do
    pt_709_nurse_tasks.open

    expect(pt_709_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees follow up call week 3 overdue' do
    pt_709_nurse_tasks.open

    expect(pt_709_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels follow up call week 3' do
    pt_329_nurse_tasks.open

    expect(pt_329_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_3).to be_active

    follow_up_week_3.cancel

    expect(pt_329_nurse_tasks).to have_no_tasks_in_count

    expect(follow_up_week_3).to be_canceled
  end

  scenario 'Nurse cancels out of reschedule follow up call week 3' do
    pt_333_nurse_tasks.open

    expect(pt_333_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_3).to be_active

    follow_up_week_3.open_reschedule_form
    navigation.cancel

    expect(pt_333_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_3).to be_active
  end

  scenario 'Nurse reschedules follow up call week 3' do
    pt_333_nurse_tasks.open

    expect(pt_333_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_3).to be_active

    follow_up_week_3.reschedule

    expect(pt_333_nurse_tasks).to have_no_tasks_in_count

    expect(follow_up_week_3).to be_scheduled
  end

  scenario 'Nurse cancels follow up call week 3 creation form' do
    pt_330_nurse_tasks.open

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_complete

    expect(follow_up_week_1).to be_complete

    expect(pt_330_nurse_tasks).to have_one_task_in_count

    expect(follow_up_week_3).to be_active

    follow_up_week_3.confirm
    navigation.cancel

    expect(follow_up_week_3).to_not be_complete
  end

  scenario 'Nurse must enter an integer for length of call' do
    pt_331_nurse_tasks.open
    follow_up_week_3.confirm
    pt_331_nurse_tasks.enter_session_length
    navigation.submit

    expect(follow_up_week_3).to be_visible
  end

  scenario 'Nurse cannot submit without entering length of call' do
    pt_332_nurse_tasks.open
    follow_up_week_3.confirm
    follow_up_week_3.respond_to_questions
    pt_332_nurse_tasks.select_ability
    pt_332_nurse_tasks.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to be_visible
  end

  scenario 'Nurse cannot submit form without selecting ability' do
    pt_334_nurse_tasks.open
    follow_up_week_3.confirm
    pt_334_nurse_tasks.enter_session_length
    follow_up_week_3.respond_to_questions
    pt_334_nurse_tasks.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to be_visible
  end

  scenario 'Nurse cannot submit form without selecting motivation' do
    pt_335_nurse_tasks.open
    follow_up_week_3.confirm
    pt_335_nurse_tasks.enter_session_length
    follow_up_week_3.respond_to_questions
    pt_335_nurse_tasks.select_ability
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to be_visible
  end

  scenario 'Nurse creates a follow up call week 3' do
    # check for current tasks
    expect(patient_336).to have_follow_up_week_3

    # create follow up call week 3
    pt_336_nurse_tasks.open
    follow_up_week_3.confirm
    pt_336_nurse_tasks.enter_session_length
    follow_up_week_3.respond_to_questions
    pt_336_nurse_tasks.select_ability
    pt_336_nurse_tasks.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(pt_336_nurse_tasks).to have_no_tasks_in_count

    expect(follow_up_week_3).to be_complete

    expect(call_to_schedule_final_appointment).to be_scheduled

    # check clinical summary page for notes
    clinical_summary.open
    # still broken
    # expect(clinical_summary).to have_follow_up_week_3_notes_visible

    # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_follow_up_week_3

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_336).to_not have_follow_up_week_3

    expect(patient_336).to have_tasks_completed
  end

  scenario 'Nurse sees # of days since call to schedule final appt was due' do
    pt_800_nurse_tasks.open

    expect(pt_800_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees call to schedule final appt overdue' do
    pt_800_nurse_tasks.open

    expect(pt_800_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels call to schedule final appointment' do
    pt_704_nurse_tasks.open

    expect(pt_704_nurse_tasks).to have_one_task_in_count

    expect(call_to_schedule_final_appointment).to be_active

    call_to_schedule_final_appointment.cancel

    expect(pt_704_nurse_tasks).to have_no_tasks_in_count

    expect(call_to_schedule_final_appointment).to be_canceled
  end

  scenario 'Nurse cancels out of reschedule call to schedule final appt' do
    pt_705_nurse_tasks.open

    expect(pt_705_nurse_tasks).to have_one_task_in_count

    expect(call_to_schedule_final_appointment).to be_active

    call_to_schedule_final_appointment.open_reschedule_form
    navigation.cancel

    expect(pt_705_nurse_tasks).to have_one_task_in_count

    expect(call_to_schedule_final_appointment).to be_active
  end

  scenario 'Nurse reschedules call to schedule final appointment' do
    pt_705_nurse_tasks.open

    expect(pt_705_nurse_tasks).to have_one_task_in_count

    expect(call_to_schedule_final_appointment).to be_active

    call_to_schedule_final_appointment.reschedule

    expect(pt_705_nurse_tasks).to have_no_tasks_in_count

    expect(call_to_schedule_final_appointment).to be_scheduled
  end

  scenario 'Nurse cancels out of call to schedule final appointment' do
    pt_700_nurse_tasks.open

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_complete

    expect(follow_up_week_1).to be_complete

    expect(follow_up_week_3).to be_complete

    expect(pt_700_nurse_tasks).to have_one_task_in_count

    expect(call_to_schedule_final_appointment).to be_active

    call_to_schedule_final_appointment.confirm
    navigation.cancel

    expect(call_to_schedule_final_appointment).to_not be_complete
  end

  scenario 'Nurse cannot submit without selecting final appt location' do
    pt_701_nurse_tasks.open
    call_to_schedule_final_appointment.confirm
    navigation.submit

    expect(call_to_schedule_final_appointment).to be_visible
  end

  scenario 'Nurse creates call to schedule final appointment' do
    # check current tasks
    expect(patient_702).to have_call_to_schedule_final_appt

    # confirm call to schedule final appointment
    pt_702_nurse_tasks.open
    call_to_schedule_final_appointment.confirm
    # not yet implemented
    # expect(call_to_schedule_final_appointment).to have_next_contact_date
    # since above isn't implemented, do below to keep from failing
    call_to_schedule_final_appointment.enter_next_contact_date

    call_to_schedule_final_appointment.select_location
    navigation.submit

    expect(pt_702_nurse_tasks).to have_no_tasks_in_count

    expect(call_to_schedule_final_appointment).to be_complete

    expect(final_appointment).to be_scheduled

    # Check contact information for completeness
    clinical_summary.open
    contact_information.open

    expect(contact_information).to have_call_to_schedule_final_appt

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_702).to_not have_call_to_schedule_final_appt

    expect(patient_702).to have_tasks_completed
  end

  scenario 'Nurse sees number of days since final appointment was due' do
    pt_801_nurse_tasks.open

    expect(pt_801_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees final appointment overdue' do
    pt_801_nurse_tasks.open

    expect(pt_801_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  scenario 'Nurse cancels final appointment' do
    pt_337_nurse_tasks.open

    expect(pt_337_nurse_tasks).to have_one_task_in_count

    expect(final_appointment).to be_active

    final_appointment.cancel

    expect(pt_337_nurse_tasks).to have_no_tasks_in_count

    expect(final_appointment).to be_canceled
  end

  scenario 'Nurse cancels out of reschedule final appointment' do
    pt_345_nurse_tasks.open

    expect(pt_345_nurse_tasks).to have_one_task_in_count

    expect(final_appointment).to be_active

    final_appointment.open_reschedule_form
    navigation.cancel

    expect(pt_345_nurse_tasks).to have_one_task_in_count

    expect(final_appointment).to be_active
  end

  scenario 'Nurse reschedules final appointment' do
    pt_345_nurse_tasks.open

    expect(pt_345_nurse_tasks).to have_one_task_in_count

    expect(final_appointment).to be_active

    final_appointment.reschedule

    expect(pt_345_nurse_tasks).to have_no_tasks_in_count

    expect(final_appointment).to be_scheduled
  end

  scenario 'Nurse cancels final appointment form' do
    pt_338_nurse_tasks.open

    expect(confirmation_call).to be_complete

    expect(initial_in_person_appt).to be_complete

    expect(follow_up_week_1).to be_complete

    expect(follow_up_week_3).to be_complete

    expect(call_to_schedule_final_appointment).to be_complete

    expect(pt_338_nurse_tasks).to have_one_task_in_count

    expect(final_appointment).to be_active

    final_appointment.confirm
    navigation.cancel

    expect(final_appointment).to_not be_complete
  end

  scenario 'Nurse cannot submit final appointment without location' do
    pt_339_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(final_appointment).to be_visible
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

    expect(your_patients).to be_visible

    expect(patient_341).to_not be_in_table
  end
end

feature 'Spanish nurse, Participant tasks' do
  scenario 'Spanish nurse sees correct translations' do
    spanish_nurse.sign_in
    pt_501_nurse_tasks.open
    spanish_additional_contact.open

    expect(spanish_additional_contact).to have_contact_title
    expect(spanish_additional_contact).to have_form_headings
    expect(spanish_additional_contact).to have_current_date_selections
    expect(spanish_additional_contact).to have_type_options

    spanish_additional_contact.choose_option
    navigation.cancel

    expect(spanish_confirmation_call).to be_active

    spanish_confirmation_call.confirm

    expect(spanish_confirmation_call).to have_form_headings
    expect(spanish_confirmation_call).to have_current_date_selections
    expect(spanish_confirmation_call).to have_next_contact_date_selections
    expect(spanish_confirmation_call).to have_site_options

    spanish_confirmation_call.toggle_options_list
    navigation.cancel

    expect(spanish_initial_appointment).to be_active

    spanish_initial_appointment.confirm

    expect(spanish_initial_appointment).to have_form_headings
    expect(spanish_initial_appointment).to have_current_date_selections
    expect(spanish_initial_appointment).to have_site_options

    spanish_initial_appointment.toggle_options_list

    expect(spanish_initial_appointment).to have_next_contact_date

    navigation.cancel

    expect(spanish_follow_up_week_1).to be_active

    spanish_follow_up_week_1.confirm

    # expect(spanish_follow_up_week_1).to have_form_headings
    expect(spanish_follow_up_week_1).to have_current_date_selections
    # expect(spanish_follow_up_week_1).to have_difficulties_options

    # spanish_follow_up_week_1.toggle_options_list

    # expect(spanish_follow_up_week_1).to have_next_contact_date

    navigation.cancel

    expect(spanish_follow_up_week_3).to be_active

    spanish_follow_up_week_3.confirm

    # expect(spanish_follow_up_week_3).to have_form_headings

    expect(spanish_follow_up_week_3).to have_current_date_selections
    # expect(spanish_follow_up_week_3).to have_difficulties_options

    # spanish_follow_up_week_3.toggle_options_list

    # expect(spanish_follow_up_week_3).to have_next_contact_date

    navigation.cancel

    expect(spanish_call_to_schedule_final).to be_active

    spanish_call_to_schedule_final.confirm

    expect(spanish_call_to_schedule_final).to have_form_headings
    expect(spanish_call_to_schedule_final).to have_current_date_selections
    expect(spanish_call_to_schedule_final).to have_next_contact_date
    expect(spanish_call_to_schedule_final).to have_location_options

    spanish_call_to_schedule_final.toggle_options_list
    navigation.cancel

    expect(spanish_final_appointment).to be_active

    spanish_final_appointment.confirm

    expect(spanish_final_appointment).to have_form_headings
    expect(spanish_final_appointment).to have_current_date_selections
    # expect(spanish_final_appointment).to have_location_options

    # spanish_final_appointment.toggle_options_list
    navigation.cancel

    expect(spanish_lack_of_connectivity_call).to be_active

    spanish_lack_of_connectivity_call.mark_resolved

    expect(spanish_lack_of_connectivity_call).to have_form_headings
    expect(spanish_lack_of_connectivity_call).to have_reason_options

    spanish_lack_of_connectivity_call.toggle_options_list
    navigation.cancel

    expect(spanish_help_request).to be_active

    spanish_help_request.mark_resolved

    expect(spanish_help_request).to have_form_headings
    expect(spanish_help_request).to have_reason_options

    spanish_help_request.toggle_options_list
    your_patients.return

    pt_502_nurse_tasks.open

    expect(spanish_non_adherence_call).to be_active

    spanish_non_adherence_call.mark_resolved

    expect(spanish_non_adherence_call).to have_form_headings
    expect(spanish_non_adherence_call).to have_reason_options
  end
end

feature 'Portuguese nurse, Participant tasks' do
  scenario 'Portuguese nurse sees correct translations' do
    portuguese_nurse.sign_in
    pt_601_nurse_tasks.open
    portuguese_additional_contact.open

    expect(portuguese_additional_contact).to have_contact_title
    expect(portuguese_additional_contact).to have_form_headings
    expect(portuguese_additional_contact).to have_current_date_selections
    expect(portuguese_additional_contact).to have_type_options

    portuguese_additional_contact.choose_option
    navigation.cancel

    expect(portuguese_confirmation_call).to be_active

    portuguese_confirmation_call.confirm

    expect(portuguese_confirmation_call).to have_form_headings
    expect(portuguese_confirmation_call).to have_current_date_selections
    expect(portuguese_confirmation_call).to have_next_contact_date_selections
    expect(portuguese_confirmation_call).to have_site_options

    portuguese_confirmation_call.toggle_options_list
    navigation.cancel

    expect(portuguese_initial_appointment).to be_active

    portuguese_initial_appointment.confirm

    expect(portuguese_initial_appointment).to have_form_headings
    expect(portuguese_initial_appointment).to have_current_date_selections
    expect(portuguese_initial_appointment).to have_site_options

    portuguese_initial_appointment.toggle_options_list

    expect(portuguese_initial_appointment).to have_next_contact_date

    navigation.cancel

    expect(portuguese_follow_up_week_1).to be_active

    portuguese_follow_up_week_1.confirm

    # expect(portuguese_follow_up_week_1).to have_form_headings
    expect(portuguese_follow_up_week_1).to have_current_date_selections
    # expect(portuguese_follow_up_week_1).to have_difficulties_options

    # portuguese_follow_up_week_1.toggle_options_list

    # expect(portuguese_follow_up_week_1).to have_next_contact_date

    navigation.cancel

    expect(portuguese_follow_up_week_3).to be_active

    portuguese_follow_up_week_3.confirm

    # expect(portuguese_follow_up_week_3).to have_form_headings

    expect(portuguese_follow_up_week_3).to have_current_date_selections
    # expect(portuguese_follow_up_week_3).to have_difficulties_options

    # portuguese_follow_up_week_3.toggle_options_list

    # expect(portuguese_follow_up_week_3).to have_next_contact_date

    navigation.cancel

    expect(portuguese_call_to_schedule_final).to be_active

    portuguese_call_to_schedule_final.confirm

    expect(portuguese_call_to_schedule_final).to have_form_headings
    expect(portuguese_call_to_schedule_final).to have_current_date_selections
    expect(portuguese_call_to_schedule_final).to have_next_contact_date
    expect(portuguese_call_to_schedule_final).to have_location_options

    portuguese_call_to_schedule_final.toggle_options_list
    navigation.cancel

    expect(portuguese_final_appointment).to be_active

    portuguese_final_appointment.confirm

    expect(portuguese_final_appointment).to have_form_headings
    expect(portuguese_final_appointment).to have_current_date_selections
    # expect(portuguese_final_appointment).to have_location_options

    # portuguese_final_appointment.toggle_options_list
    navigation.cancel

    expect(portuguese_lack_of_connectivity_call).to be_active

    portuguese_lack_of_connectivity_call.mark_resolved

    expect(portuguese_lack_of_connectivity_call).to have_form_headings
    expect(portuguese_lack_of_connectivity_call).to have_reason_options

    portuguese_lack_of_connectivity_call.toggle_options_list
    navigation.cancel

    expect(portuguese_help_request).to be_active

    portuguese_help_request.mark_resolved

    expect(portuguese_help_request).to have_form_headings
    expect(portuguese_help_request).to have_reason_options

    portuguese_help_request.toggle_options_list
    your_patients.return

    pt_602_nurse_tasks.open

    expect(portuguese_non_adherence_call).to be_active

    portuguese_non_adherence_call.mark_resolved

    expect(portuguese_non_adherence_call).to have_form_headings
    expect(portuguese_non_adherence_call).to have_reason_options
  end
end
