# frozen_string_literal: true
# filename: ./spec/features/nurse/tasks/final_appointment_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/final_appointment_helper'

feature 'Nurse, Participant Tasks, Final appointment', metadata: :first do
  background { english_nurse.sign_in }

  scenario 'Nurse cancels out of reschedule form' do
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

    final_appointment.open_reschedule_form
    reschedule_form.complete

    expect(pt_345_nurse_tasks).to have_no_tasks_in_count
    expect(final_appointment).to be_rescheduled_with_time_stamp

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_6)
      .to have_task_rescheduled 'Final in person appointment'
    expect(reschedule_form).to have_reschedule_reason
  end
end

feature 'Nurse, Participant Tasks, Final appointment', metadata: :not_first do
  background { english_nurse.sign_in }

  # poltergeist does not see the timestamp
  scenario 'Nurse sees number of days since task was due', :browser do
    pt_801_nurse_tasks.open

    expect(pt_801_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_801_nurse_tasks.open

    expect(pt_801_nurse_tasks).to have_overdue_tasks
    expect(final_appointment).to be_overdue
  end

  scenario 'Nurse cancels final appointment' do
    pt_337_nurse_tasks.open

    expect(pt_337_nurse_tasks).to have_one_task_in_count
    expect(final_appointment).to be_active

    final_appointment.cancel
    cancel_form.complete

    expect(pt_337_nurse_tasks).to have_no_tasks_in_count
    expect(final_appointment).to be_canceled

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_5)
      .to have_task_canceled 'Final in person appointment'
    expect(cancel_form).to have_cancellation_reason
  end

  scenario 'Nurse cancels confirmation form' do
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

  scenario 'Nurse must select location' do
    pt_339_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(final_appointment).to be_visible
  end

  scenario 'Nurse must select whether phone return was returned' do
    pt_340_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_location
    final_appointment.enter_notes
    navigation.submit

    expect(final_appointment).to be_visible
  end

  scenario 'Nurse confirms a final appointment' do
    pt_341_nurse_tasks.open
    final_appointment.confirm
    final_appointment.enter_location
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(your_patients).to be_visible
    expect(patient_341).to_not be_in_table

    english_nurse.sign_out
    english_supervisor.sign_in

    expect(completed_participant_table).to have_updated_completed
    expect(completed_participant_table)
      .to have_new_completed_participant_information

    # confirm that supervisor can still access timeline and clinical summary
    navigation.scroll_down
    completed_participant_table.select_completed_pt

    expect(timeline).to be_on_page

    clinical_summary.open

    expect(clinical_summary).to be_visible
  end
end
