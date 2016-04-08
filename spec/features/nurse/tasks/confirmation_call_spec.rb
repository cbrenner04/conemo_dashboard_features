# filename: ./spec/features/nurse/tasks/confirmation_call_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/confirmation_call_helper'

feature 'Nurse, Participant Tasks, Confirmation Call', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees number days since task was due' do
    pt_706_nurse_tasks.open

    expect(pt_706_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_706_nurse_tasks.open

    expect(pt_706_nurse_tasks).to have_overdue_tasks
    expect(confirmation_call).to be_overdue
  end

  scenario 'Nurse cancels confirmation call' do
    pt_301_nurse_tasks.open

    expect(pt_301_nurse_tasks).to have_one_task_in_count
    expect(confirmation_call).to be_active

    confirmation_call.cancel
    cancel_form.complete

    expect(pt_301_nurse_tasks).to have_no_tasks_in_count
    expect(confirmation_call).to be_canceled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_3).to have_confirmation_call_canceled
    expect(cancel_form).to have_cancellation_reason
  end

  scenario 'Nurse cancels out of reschedule form' do
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

    confirmation_call.open_reschedule_form
    reschedule_form.complete

    expect(pt_304_nurse_tasks).to have_no_tasks_in_count

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_4).to have_confirmation_call_rescheduled
    expect(reschedule_form).to have_reschedule_reason
  end

  scenario 'Nurse cancels out of confirmation form' do
    pt_306_nurse_tasks.open

    expect(pt_306_nurse_tasks).to have_one_task_in_count
    expect(confirmation_call).to be_active

    confirmation_call.confirm
    navigation.cancel

    expect(confirmation_call).to_not be_complete
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

    # check timeline page for completeness
    clinical_summary.open
    timeline.open

    expect(timeline).to have_confirmation_call

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_306).to_not have_confirmation_call
    expect(patient_306).to have_tasks_completed
  end
end
