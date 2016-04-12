# filename: ./spec/features/nurse/tasks/follow_call_week_one_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/follow_up_week_one_helper.rb'

feature 'Nurse, Participant Tasks, Follow up week one', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees number of days since task was due' do
    pt_708_nurse_tasks.open

    expect(pt_708_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_708_nurse_tasks.open

    expect(pt_708_nurse_tasks).to have_overdue_tasks
    expect(follow_up_week_1).to be_overdue
  end

  scenario 'Nurse cancels follow up call week one' do
    pt_320_nurse_tasks.open

    expect(pt_320_nurse_tasks).to have_one_task_in_count
    expect(follow_up_week_1).to be_active

    follow_up_week_1.cancel
    cancel_form.complete

    expect(pt_320_nurse_tasks).to have_no_tasks_in_count
    expect(follow_up_week_1).to be_canceled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_7).to have_follow_up_week_1_canceled
    expect(cancel_form).to have_cancellation_reason
  end

  scenario 'Nurse cancels out of reschedule form' do
    pt_321_nurse_tasks.open

    expect(pt_321_nurse_tasks).to have_one_task_in_count
    expect(follow_up_week_1).to be_active

    follow_up_week_1.open_reschedule_form
    navigation.cancel

    expect(pt_321_nurse_tasks).to have_one_task_in_count
    expect(follow_up_week_1).to be_active
  end

  scenario 'Nurse reschedules follow up call week one' do
    pt_321_nurse_tasks.open

    expect(pt_321_nurse_tasks).to have_one_task_in_count
    expect(follow_up_week_1).to be_active

    follow_up_week_1.open_reschedule_form
    reschedule_form.complete

    expect(pt_321_nurse_tasks).to have_no_tasks_in_count

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_8).to have_follow_up_week_1_rescheduled
    expect(reschedule_form).to have_reschedule_reason
  end

  scenario 'Nurse cancels out of confirmation form' do
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

  scenario 'Nurse must enter call length' do
    pt_327_nurse_tasks.open
    follow_up_week_1.confirm
    follow_up_week_1.enter_difficulties
    follow_up_week_1.enter_notes
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse must select difficulty' do
    # this may not be required any longer
    pt_326_nurse_tasks.open
    follow_up_week_1.confirm
    pt_326_nurse_tasks.enter_session_length
    follow_up_week_1.enter_notes
    navigation.submit

    expect(follow_up_week_1).to be_visible
  end

  scenario 'Nurse confirms a follow up call week 1' do
    # check for current task
    expect(patient_328).to have_follow_up_week_1

    # create follow up all week 1
    pt_328_nurse_tasks.open
    follow_up_week_1.confirm
    pt_328_nurse_tasks.enter_session_length
    follow_up_week_1.enter_difficulties
    follow_up_week_1.enter_notes
    navigation.submit

    expect(pt_328_nurse_tasks).to have_no_tasks_in_count
    expect(follow_up_week_1).to be_complete

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_follow_up_week_1_notes_visible

    # check timeline page for completeness
    timeline.open

    expect(timeline).to have_follow_up_week_1

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_328).to_not have_follow_up_week_1
    expect(patient_328).to have_tasks_completed
  end
end
