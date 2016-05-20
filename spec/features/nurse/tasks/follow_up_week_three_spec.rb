# filename: ./spec/features/nurse/tasks/follow_up_week_three_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/follow_up_week_three_helper'

feature 'Nurse, Participant Tasks, Follow up week 3', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees number of days since task was due' do
    pt_709_nurse_tasks.open

    expect(pt_709_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_709_nurse_tasks.open

    expect(pt_709_nurse_tasks).to have_overdue_tasks
    expect(follow_up_week_3).to be_overdue
  end

  scenario 'Nurse cancels follow up call week 3' do
    pt_329_nurse_tasks.open

    expect(pt_329_nurse_tasks).to have_one_task_in_count
    expect(follow_up_week_3).to be_active

    follow_up_week_3.cancel
    cancel_form.complete

    expect(pt_329_nurse_tasks).to have_no_tasks_in_count
    expect(follow_up_week_3).to be_canceled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_9).to have_follow_up_week_3_canceled
    expect(cancel_form).to have_cancellation_reason
  end

  scenario 'Nurse cancels out of reschedule task' do
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

    follow_up_week_3.open_reschedule_form
    reschedule_form.complete

    expect(pt_333_nurse_tasks).to have_no_tasks_in_count
    expect(follow_up_week_3).to be_rescheduled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_10).to have_follow_up_week_3_rescheduled
    expect(reschedule_form).to have_reschedule_reason
  end

  scenario 'Nurse cancels confirmation form' do
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

  scenario 'Nurse must enter length of call' do
    pt_332_nurse_tasks.open
    follow_up_week_3.confirm
    follow_up_week_3.enter_difficulties
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to be_visible
  end

  scenario 'Nurse must select difficulties' do
    # this may no longer be required
    pt_334_nurse_tasks.open
    follow_up_week_3.confirm
    pt_334_nurse_tasks.enter_session_length
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(follow_up_week_3).to be_visible
  end

  scenario 'Nurse confirms a follow up call week 3' do
    # check for current tasks
    expect(patient_336).to have_follow_up_week_3

    # create follow up call week 3
    pt_336_nurse_tasks.open
    follow_up_week_3.confirm
    pt_336_nurse_tasks.enter_session_length
    follow_up_week_3.enter_difficulties
    follow_up_week_3.enter_general_notes
    navigation.submit

    expect(pt_336_nurse_tasks).to have_no_tasks_in_count
    expect(follow_up_week_3).to be_complete

    # check clinical summary page for notes
    clinical_summary.open
    expect(clinical_summary).to have_follow_up_week_3_notes_visible

    # check timeline page for completeness
    timeline.open

    expect(timeline).to have_follow_up_week_3
    expect(follow_up_week_3).to have_difficulties_responses

    # check Your Patients list for old / new tasks
    navigation.return_home

    expect(patient_336).to_not have_follow_up_week_3
    expect(patient_336).to have_tasks_completed
  end
end
