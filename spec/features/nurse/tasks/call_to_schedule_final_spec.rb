# filename: ./spec/features/nurse/tasks/call_to_schedule_final_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/call_to_schedule_final_helper'

feature 'Nurse, Call to schedule final appointment', metadata: :first do
  scenario 'Nurse confirms call to schedule final' do
    english_nurse.sign_in

    # check current tasks
    expect(patient_702).to have_call_to_schedule_final_appt

    # confirm call to schedule final appointment
    pt_702_nurse_tasks.open
    call_to_schedule_final_appointment.confirm

    expect(call_to_schedule_final_appointment).to have_next_contact_date

    call_to_schedule_final_appointment.enter_next_contact_date
    call_to_schedule_final_appointment.select_location
    navigation.submit

    expect(pt_702_nurse_tasks).to have_no_tasks_in_count
    expect(call_to_schedule_final_appointment).to be_complete

    # Check timeline for completeness
    timeline.open

    expect(timeline).to have_call_to_schedule_final_appt

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_702).to_not have_call_to_schedule_final_appt
    expect(patient_702).to have_tasks_completed
  end
end

feature 'Nurse, Call to schedule final appointment', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees # of days since task was due' do
    pt_800_nurse_tasks.open

    expect(pt_800_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_800_nurse_tasks.open

    expect(pt_800_nurse_tasks).to have_overdue_tasks
    expect(call_to_schedule_final_appointment).to be_overdue
  end

  scenario 'Nurse cancels call to schedule final appointment' do
    pt_704_nurse_tasks.open

    expect(pt_704_nurse_tasks).to have_one_task_in_count
    expect(call_to_schedule_final_appointment).to be_active

    call_to_schedule_final_appointment.cancel
    cancel_form.complete

    expect(pt_704_nurse_tasks).to have_no_tasks_in_count
    expect(call_to_schedule_final_appointment).to be_canceled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_1).to have_call_to_schedule_final_canceled
    expect(cancel_form).to have_cancellation_reason
  end

  scenario 'Nurse cancels out of reschedule form' do
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

    call_to_schedule_final_appointment.open_reschedule_form
    reschedule_form.complete

    expect(pt_705_nurse_tasks).to have_no_tasks_in_count
    expect(call_to_schedule_final_appointment).to be_rescheduled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_2).to have_call_to_schedule_final_rescheduled
    expect(reschedule_form).to have_reschedule_reason
  end

  scenario 'Nurse cancels out of confirmation form' do
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

  scenario 'Nurse must select final appointemnt location' do
    pt_701_nurse_tasks.open
    call_to_schedule_final_appointment.confirm
    navigation.submit

    expect(call_to_schedule_final_appointment).to be_visible
  end
end
