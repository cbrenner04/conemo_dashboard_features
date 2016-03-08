# filename: ./spec/features/nurse/tasks_spec.rb

require './spec/support/nurse/tasks_helper'

feature 'Nurse, Participant Tasks' do
  background { english_nurse.sign_in }

  scenario 'Nurse cancels creation of additional contact form'
  scenario 'Nurse creates additional contact'
  scenario 'Nurse sees correct task count with multiple tasks due'

  scenario 'Nurse sees number of days since help request was due' do
    navigation.scroll_down
    pt_802_nurse_tasks.open

    expect(pt_802_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees help request overdue' do
    navigation.scroll_down
    pt_802_nurse_tasks.open

    expect(pt_802_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  # scenario 'Nurse cancels out of help request resolution form' do
  #   2.times { navigation.scroll_down }
  #   pt_400_nurse_tasks.open

  #   expect(pt_400_nurse_tasks).to have_help_request_active

  #   pt_400_nurse_tasks.mark_help_request_resolved
  #   navigation.cancel

  #   expect(pt_400_nurse_tasks).to have_help_request_active
  # end

  scenario 'Nurse marks help request as resolved' do
    2.times { navigation.scroll_down }
    pt_400_nurse_tasks.open

    expect(pt_400_nurse_tasks).to have_one_task_in_count

    expect(pt_400_nurse_tasks).to have_help_request_active

    pt_400_nurse_tasks.mark_help_request_resolved
    # fill out form

    expect(pt_400_nurse_tasks).to_not have_help_request_active

    expect(pt_400_nurse_tasks).to have_no_tasks_in_count
  end

  scenario 'Nurse contacts supervisor for help request' do
    2.times { navigation.scroll_down }
    pt_401_nurse_tasks.open

    expect(pt_401_nurse_tasks).to have_help_request_active

    pt_401_nurse_tasks.contact_supervisor_for_help_request

    expect(pt_401_nurse_tasks).to have_help_request_active

    expect(pt_401_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Nurse sees when the previous supervisor contact was sent' do
    2.times { navigation.scroll_down }
    pt_402_nurse_tasks.open

    expect(pt_402_nurse_tasks).to have_help_request_active

    expect(pt_402_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    2.times { navigation.scroll_down }
    pt_403_nurse_tasks.open

    expect(pt_403_nurse_tasks).to have_help_request_active

    expect(pt_403_nurse_tasks).to have_previous_supervisor_contact

    pt_403_nurse_tasks.clear_supervisor_contact

    expect(pt_403_nurse_tasks).to_not have_previous_supervisor_contact
  end

  scenario 'Nurse sees number days since non-connectivity task was due' do
    navigaiton.scroll_down
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees non-connectivity task overdue' do
    navigation.scroll_down
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_overdue_task
    # check css in progress-bar
  end

  # scenario 'Nurse cancels out of non-connectivity task resolution form' do
  #   2.times { navigation.scroll_down }
  #   pt_410_nurse_tasks.open

  #   expect(pt_410_nurse_tasks).to have_lack_of_connectivity_active

  #   pt_410_nurse_tasks.mark_lack_of_connectivity_resolved
  #   navigation.cancel

  #   expect(pt_410_nurse_tasks).to have_lack_of_connectivity_active
  # end

  scenario 'Nurse marks non-connectivity task as resolved' do
    2.times { navigation.scroll_down }
    pt_410_nurse_tasks.open

    expect(pt_410_nurse_tasks).to have_one_task_in_count

    expect(pt_410_nurse_tasks).to have_lack_of_connectivity_active

    pt_410_nurse_tasks.mark_lack_of_connectivity_resolved
    # complete form

    expect(pt_410_nurse_tasks).to have_no_tasks_in_count

    expect(pt_410_nurse_tasks).to_not have_lack_of_connectivity_active
  end

  scenario 'Nurse contacts supervisor non-connectivity task' do
    2.times { navigation.scroll_down }
    pt_411_nurse_tasks.open

    expect(pt_411_nurse_tasks).to have_lack_of_connectivity_active

    pt_411_nurse_tasks.contact_supervisor_for_lack_of_connectivity

    expect(pt_411_nurse_tasks).to have_lack_of_connectivity_active

    expect(pt_411_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Nurse sees when the previous supervisor contact was sent' do
    2.times { navigation.scroll_down }
    pt_412_nurse_tasks.open

    expect(pt_412_nurse_tasks).to have_lack_of_connectivity_active

    expect(pt_412_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    2.times { navigation.scroll_down }
    pt_413_nurse_tasks.open

    expect(pt_413_nurse_tasks).to have_lack_of_connectivity_active

    expect(pt_413_nurse_tasks).to have_previous_supervisor_contact

    pt_413_nurse_tasks.clear_supervisor_contact

    expect(pt_413_nurse_tasks).to_not have_previous_supervisor_contact
  end

  scenario 'Nurse sees no adherence task for pt w active connectivity task' do
    2.times { navigation.scroll_down }
    pt_426_nurse_tasks.open

    expect(pt_426_nurse_tasks).to have_lack_of_connectivity_active

    expect(pt_426_nurse_tasks).to_not have_non_adherence_active
  end

  scenario 'Nurse sees no adherence task for pt w 1 missed, 1 late session' do
    2.times { navigation.scroll_down }
    pt_427_nurse_tasks.open

    expect(pt_427_nurse_tasks).to_not have_non_adherence_active
  end

  scenario 'Nurse sees no adherence task for 1 on-time, 1 missed session' do
    navigation.scroll_down
    pt_320_nurse_tasks.open

    expect(pt_320_nurse_tasks).to_not have_non_adherence_active
  end

  scenario 'Nurse sees no adherence task for pt w < 2 lessons released' do
    2.times { navigation.scroll_down }
    pt_300_nurse_tasks.open

    expect(page).to_not have_non_adherence_active
  end

  scenario 'Nurse sees number of days since non-adherence task was due' do
    navigation.scroll_down
    pt_804_nurse_tasks.open

    expect(pt_804_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees non-adherence task overdue' do
    navigation.scroll_down
    pt_804_nurse_tasks.open

    expect(pt_804_nurse_tasks).to have_overdue_task
    # check css
  end

  # scenario 'Nurse cancels out of non-adherence task resolution form' do
  #   2.times { navigation.scroll_down }
  #   pt_420_nurse_tasks.open

  #   expect(pt_420_nurse_tasks).to have_one_task_in_count

  #   expect(pt_420_nurse_tasks).to have_non_adherence_active

  #   pt_420_nurse_tasks.mark_non_adherence_resolved
  #   navigation.cancel

  #   expect(pt_420_nurse_tasks).to have_non_adherence_active
  # end

  scenario 'Nurse marks non-adherence task as resolved' do
    2.times { navigation.scroll_down }
    pt_420_nurse_tasks.open

    expect(pt_420_nurse_tasks).to have_one_task_in_count

    expect(pt_420_nurse_tasks).to have_non_adherence_active

    pt_420_nurse_tasks.mark_non_adherence_resolved
    # complete form

    expect(pt_420_nurse_tasks).to have_no_tasks_in_count

    expect(pt_420_nurse_tasks).to_not have_non_adherence_active
  end

  scenario 'Nurse contacts supervisor for non-adherence task' do
    2.times { navigation.scroll_down }
    pt_421_nurse_tasks.open

    expect(pt_421_nurse_tasks).to have_non_adherence_active

    pt_421_nurse_tasks.contact_supervisor_for_non_adherence

    expect(pt_421_nurse_tasks).to have_non_adherence_active

    expect(pt_421_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Nurse sees when the previous supervisor contact was sent' do
    2.times { navigation.scroll_down }
    pt_422_nurse_tasks.open

    expect(pt_422_nurse_tasks).to have_non_adherence_active

    expect(pt_422_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    2.times { navigation.scroll_down }
    pt_423_nurse_tasks.open

    expect(pt_423_nurse_tasks).to have_non_adherence_active

    expect(pt_423_nurse_tasks).to have_previous_supervisor_contact

    pt_423_nurse_tasks.clear_supervisor_contact

    expect(pt_423_nurse_tasks).to_not have_previous_supervisor_contact
  end

  scenario 'Nurse sees empty progress bar'

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
    2.times { navigation.scroll_down }
    pt_301_nurse_tasks.open

    expect(pt_301_nurse_tasks).to have_one_task_in_count

    expect(pt_301_nurse_tasks).to have_confirmation_call_task_active

    confirmation_call.cancel

    expect(pt_301_nurse_tasks).to_not have_confirmation_call_task_active

    expect(pt_301_nurse_tasks).to have_no_tasks_in_count
  end

  scenario 'Nurse cancels out of reschedule confirmation call form'
  scenario 'Nurse reschedules confirmation call' # check task count

  scenario 'Nurse cancels out of confirmation call form' do
    2.times { navigation.scroll_down }
    pt_306_nurse_tasks.open

    expect(pt_306_nurse_tasks).to have_one_task_in_count

    expect(pt_306_nurse_tasks).to have_confirmation_call_task_active

    expect(pt_306_nurse_tasks).to_not have_initial_in_person_appt_task_active

    confirmation_call.confirm
    navigation.cancel

    expect(pt_306_nurse_tasks).to_not have_confirmation_call_task_complete

    expect(pt_306_nurse_tasks).to_not have_initial_in_person_appt_task_active
  end

  scenario 'Nurse confirms confirmation call' do
    2.times { navigation.scroll_down }
    pt_306_nurse_tasks.open
    confirmation_call.confirm
    confirmation_call.enter_first_appt_location
    navigation.submit

    expect(pt_306_nurse_tasks).to have_no_tasks_in_count

    # expect(pt_306_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_306_nurse_tasks).to have_initial_in_person_appt_task_active

    # check contact information page for completeness
    contact_information.open

    expect(contact_information).to have_confirmation_call

    # # check Your Patients list for old / new tasks
  end

  scenario 'Nurse sees initial in-person appointment not yet due'

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
    navigation.scroll_down
    pt_311_nurse_tasks.open

    expect(pt_311_nurse_tasks).to have_one_task_in_count

    expect(pt_311_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_311_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.cancel

    expect(pt_311_nurse_tasks).to have_no_tasks_in_count

    expect(pt_311_nurse_tasks).to_not have_initial_in_person_appt_task_active
  end

  scenario 'Nurse cancels out of initial in-person appt reschedule form'
  scenario 'Nurse reschedules initial in-person appointment'

  scenario 'Nurse cancels out of a initial in-person appt creation form' do
    navigation.scroll_down
    pt_313_nurse_tasks.open

    expect(pt_313_nurse_tasks).to have_one_task_in_count

    expect(pt_313_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_313_nurse_tasks).to have_initial_in_person_appt_task_active

    initial_in_person_appt.confirm

    expect(initial_in_person_appt).to be_visible

    navigation.scroll_down
    navigation.cancel

    expect(pt_313_nurse_tasks).to_not have_initial_in_person_appt_task_complete
  end

  scenario 'Nurse must enter a integer in session length field' do
    navigation.scroll_down
    pt_314_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    pt_314_nurse_tasks.enter_session_length
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse cannot submit without entering session length' do
    navigation.scroll_down
    pt_315_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible # still on form?
  end

  scenario 'Nurse cannot submit without entering session location' do
    navigation.scroll_down
    pt_316_nurse_tasks.open
    initial_in_person_appt.confirm
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

    # check for next contact date to be pre-populated for a week from now

    initial_in_person_appt.enter_general_notes
    navigation.submit

    contact_information.enter_smartphone_number
    navigation.submit # what happens if I cancel?

    expect(pt_400_nurse_tasks).to have_no_tasks_in_count

    # expect(pt_319_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_319_nurse_tasks).to have_new_follow_up_week_1_task

    expect(pt_319_nurse_tasks).to have_new_follow_up_week_3_task

    expect(pt_319_nurse_tasks).to have_new_call_to_schedule_final_appt_task

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_first_appt_notes_visible

    # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_initial_appointment

    # # check Your Patients list for old / new tasks
  end

  scenario 'Nurse sees follow up call week 1 not yet due'

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
    navigation.scroll_down
    pt_320_nurse_tasks.open

    expect(pt_320_nurse_tasks).to have_one_task_in_count

    expect(pt_320_nurse_tasks).to have_follow_up_week_1_task_active

    follow_up_week_1.cancel

    expect(pt_320_nurse_tasks).to have_no_tasks_in_count

    expect(pt_320_nurse_tasks).to_not have_follow_up_week_1_task_active
  end

  scenario 'Nurse cancels out of reschedule follow up week one'
  scenario 'Nurse reschedules follow up call week one'

  scenario 'Nurse cancels out of follow up call week 1 creation form' do
    navigation.scroll_down
    pt_322_nurse_tasks.open

    expect(pt_322_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_322_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_322_nurse_tasks).to have_one_task_in_count

    expect(pt_322_nurse_tasks).to have_follow_up_week_1_task_active

    follow_up_week_1.confirm
    navigation.cancel

    expect(pt_326_nurse_tasks).to_not have_follow_up_week_1_task_complete
  end

  scenario 'Nurse must enter integer into length of call' do
    navigation.scroll_down
    pt_323_nurse_tasks.open
    follow_up_week_1.confirm
    pt_323_nurse_tasks.enter_session_length
    navigation.submit

    expect(follow_up_week_1).to be_visible
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

    expect(pt_328_nurse_tasks).to have_no_tasks_in_count

    # expect(pt_328_nurse_tasks).to have_follow_up_week_1_task_complete

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_follow_up_week_1_notes_visible

    # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_follow_up_week_1

    # # check Your Patients list for old / new tasks
  end

  scenario 'Nurse sees follow up call week 3 not yet due'

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

    expect(pt_329_nurse_tasks).to have_follow_up_week_3_task_active

    follow_up_week_3.cancel

    expect(pt_329_nurse_tasks).to have_no_tasks_in_count

    expect(pt_329_nurse_tasks).to_not have_follow_up_week_3_task_active
  end

  scenario 'Nurse cancels out of reschedule follow up call week 3'
  scenario 'Nurse reschedules follow up call week 3'

  scenario 'Nurse cancels third contact creation' do
    pt_330_nurse_tasks.open

    expect(pt_330_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_330_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_330_nurse_tasks).to have_follow_up_week_1_task_complete

    expect(pt_330_nurse_tasks).to have_one_task_in_count

    expect(pt_330_nurse_tasks).to have_follow_up_week_3_task_active

    follow_up_week_3.confirm
    navigation.cancel

    expect(pt_330_nurse_tasks).to_not have_follow_up_week_3_task_complete
  end

  scenario 'Nurse must enter an integer for length of call in third contact' do
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

  scenario 'Nurse creates a third contact' do
    pt_336_nurse_tasks.open
    follow_up_week_3.confirm
    pt_336_nurse_tasks.enter_session_length
    follow_up_week_3.respond_to_questions
    pt_336_nurse_tasks.select_ability
    pt_336_nurse_tasks.select_motivation
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(pt_336_nurse_tasks).to have_no_tasks_in_count

    # expect(pt_336_nurse_tasks).to have_follow_up_week_3_task_complete

    expect(pt_336_nurse_tasks).to have_call_to_schedule_final_appt_task_active

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_follow_up_week_3_notes_visible

    # # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_follow_up_week_3

    # # check Your Patients list for old / new tasks
  end

  scenario 'Nurse sees call to schedule final appointment not yet due'

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

    expect(pt_704_nurse_tasks).to have_call_to_schedule_final_appt_task_active

    call_to_schedule_final_appointment.cancel

    expect(pt_704_nurse_tasks).to have_no_tasks_in_count

    expect(pt_704_nurse_tasks)
      .to_not have_call_to_schedule_final_appt_task_active
  end

  scenario 'Nurse cancels out of reschedule call to schedule final appointment'
  scenario 'Nurse reschedules call to schedule final appointment'

  scenario 'Nurse cancels out of call to schedule final appointment' do
    pt_700_nurse_tasks.open

    expect(pt_700_nurse_tasks).to have_confirmation_call_task_complete

    expect(pt_700_nurse_tasks).to have_initial_in_person_appt_task_complete

    expect(pt_700_nurse_tasks).to have_follow_up_week_1_task_complete

    expect(pt_700_nurse_tasks).to have_follow_up_week_3_task_complete

    expect(pt_700_nurse_tasks).to have_one_task_in_count

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

    expect(pt_702_nurse_tasks).to have_no_tasks_in_count

    # expect(pt_702_nurse_tasks)
    #   .to have_call_to_schedule_final_appt_task_complete

    expect(pt_702_nurse_tasks).to have_final_appt_task_active

    # # Check contact information for completeness

    # # check Your Patients list for old / new tasks
  end

  scenario 'Nurse sees final appointment not yet due'

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

    expect(pt_337_nurse_tasks).to have_final_appt_task_active

    final_appointment.cancel

    expect(pt_337_nurse_tasks).to have_no_tasks_in_count

    expect(pt_337_nurse_tasks).to_not have_final_appt_task_active
  end

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

    expect(pt_338_nurse_tasks).to have_one_task_in_count

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

    expect(pt_341_nurse_tasks).to have_no_tasks_in_count

    # expect(pt_341_nurse_tasks).to have_final_appt_task_complete

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_final_appt_notes_visible

    # # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_final_appointment

    # # check Your Patients list for old / new tasks
  end
end
