# filename: ./spec/features/nurse/tasks/non_connectivity_call_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/non_connectivity_call_helper'

feature 'Nurse, Non-connectivity call', metadata: :first do
  background { english_nurse.sign_in }

  scenario 'Contacts supervisor for non-connectivity task' do
    pt_411_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    lack_of_connectivity_call.contact_supervisor

    expect(lack_of_connectivity_call).to be_active
    expect(pt_411_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Sees when the last supervisor contact sent' do
    pt_412_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active
    expect(pt_412_nurse_tasks).to have_previous_supervisor_contact
  end
end

feature 'Nurse, Non-connectivity call', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees number days since task was due' do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_overdue_tasks
  end

  scenario 'Nurse cancels out of resolution form' do
    pt_410_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active

    lack_of_connectivity_call.mark_resolved
    navigation.cancel

    expect(lack_of_connectivity_call).to be_active
  end

  scenario 'Nurse cancels non-connectivity task'

  scenario 'Nurse marks non-connectivity task as resolved' do
    pt_410_nurse_tasks.open

    expect(pt_410_nurse_tasks).to have_one_task_in_count
    expect(lack_of_connectivity_call).to be_active

    lack_of_connectivity_call.mark_resolved
    lack_of_connectivity_call.complete_resolution_form

    expect(pt_410_nurse_tasks).to have_no_tasks_in_count
    expect(lack_of_connectivity_call).to_not be_active

    # check timeline for completeness
    timeline.open

    expect(timeline).to have_non_connectivity_call
    expect(lack_of_connectivity_call).to have_response

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_410).to_not have_lack_of_connectivity_task
    expect(patient_410).to have_tasks_completed
  end
end

feature 'Nurse, Non-connectivity call', metadata: :not_first do
  scenario 'Nurse cancels non-connectivity call' do
    english_nurse_401.sign_in
    pt_4025_nurse_tasks.open

    lack_of_connectivity_call.mark_resolved
    lack_of_connectivity_call.resolve_as_canceled

    expect(lack_of_connectivity_call).to_not be_active

    english_nurse_401.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_16).to have_non_connectivity_call_canceled
    expect(lack_of_connectivity_call).to have_cancel_reason
  end
end
