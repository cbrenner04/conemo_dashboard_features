# filename: ./spec/features/nurse/tasks/non_connectivity_call_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/non_connectivity_call_helper'

feature 'Nurse, Participant Tasks, Non-connectivity call' do
  background { english_nurse.sign_in }

  scenario 'Nurse sees number days since task was due' do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_overdue_tasks
    # check css in progress-bar
  end

  scenario 'Nurse cancels out of resolution form' do
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

  scenario 'Nurse contacts supervisor for non-connectivity task' do
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
end
