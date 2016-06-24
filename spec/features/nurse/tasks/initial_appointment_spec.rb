# frozen_string_literal: true
# filename: ./spec/features/nurse/tasks/initial_appointment_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/initial_appointment_helper'

feature 'Nurse, Initial in person appointment', metadata: :first do
  background { english_nurse.sign_in }

  scenario 'Nurse confirms an initial in-person' do
    # check your patients list for current task
    expect(patient_319).to have_initial_appointment

    # create initial appointment
    pt_319_nurse_tasks.open

    expect(initial_in_person_appt).to be_active_today

    initial_in_person_appt.confirm

    # update today to yesterday to confirm follow up appointment schedule
    initial_in_person_appt.enter_yesterday_as_contact_date
    initial_in_person_appt.enter_location
    pt_319_nurse_tasks.enter_session_length
    initial_in_person_appt.enter_general_notes
    navigation.submit

    smartphone_information.enter_smartphone_number
    smartphone_information.enter_phone_id
    navigation.submit

    expect(pt_319_nurse_tasks).to have_no_tasks_in_count
    expect(initial_in_person_appt).to be_completed_yesterday

    # confirm follow up appointment schedule
    expect(follow_up_week_1).to be_scheduled_a_week_from_yesterday
    expect(follow_up_week_3).to be_scheduled_3_weeks_from_yesterday
    expect(call_to_schedule_final_appointment)
      .to be_scheduled_6_weeks_from_yesterday

    # check clinical summary page for notes
    clinical_summary.open

    expect(notes).to have_first_appt_notes_visible

    # check timeline page for completeness
    timeline.open

    expect(timeline).to have_initial_appointment

    # check Your Patients list for old / new tasks
    navigation.return_home

    expect(patient_319).to_not have_initial_appointment
    expect(patient_319).to have_tasks_completed
  end

  scenario 'Nurse reschedules initial in-person appointment' do
    pt_318_nurse_tasks.open

    expect(pt_318_nurse_tasks).to have_one_task_in_count
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.open_reschedule_form
    reschedule_form.complete

    expect(pt_318_nurse_tasks).to have_no_tasks_in_count
    expect(initial_in_person_appt).to be_rescheduled_with_time_stamp

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_12).to have_initial_appointment_rescheduled
    expect(reschedule_form).to have_reschedule_reason
  end
end

feature 'Nurse, Initial in person appointment', metadata: :not_first do
  background { english_nurse.sign_in }

  # poltergeist does not see the timestamp
  scenario 'Nurse sees number of days since task was due', :browser do
    pt_707_nurse_tasks.open

    expect(pt_707_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_707_nurse_tasks.open

    expect(pt_707_nurse_tasks).to have_overdue_tasks
    expect(initial_in_person_appt).to be_overdue
  end

  scenario 'Nurse cancels initial in-person appointment' do
    pt_311_nurse_tasks.open

    expect(pt_311_nurse_tasks).to have_one_task_in_count
    expect(confirmation_call).to be_complete
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.cancel
    cancel_form.complete

    expect(pt_311_nurse_tasks).to have_no_tasks_in_count
    expect(initial_in_person_appt).to be_canceled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_11).to have_initial_appointment_canceled
    expect(cancel_form).to have_cancellation_reason
  end

  scenario 'Nurse cancels out of reschedule form' do
    pt_317_nurse_tasks.open

    expect(pt_317_nurse_tasks).to have_one_task_in_count
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.open_reschedule_form
    navigation.cancel

    expect(pt_317_nurse_tasks).to have_one_task_in_count
    expect(initial_in_person_appt).to be_active
  end

  scenario 'Nurse cancels out of confirmation form' do
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

  scenario 'Nurse must enter session length' do
    pt_315_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse must enter session location' do
    pt_316_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end
end
