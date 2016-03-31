# filename: ./spec/features/nurse/tasks/non_adherence_call_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/non_adherence_call_helper'

feature 'Nurse, Non-adherence call', metadata: :first do
  background { english_nurse.sign_in }

  scenario 'Contacts supervisor for non-adherence task' do
    pt_421_nurse_tasks.open

    expect(non_adherence_call).to be_active

    non_adherence_call.contact_supervisor

    expect(non_adherence_call).to be_active
    expect(pt_421_nurse_tasks).to have_new_supervisor_contact
  end

  scenario 'Sees when the last supervisor contact sent' do
    pt_424_nurse_tasks.open

    expect(non_adherence_call).to be_active
    expect(pt_424_nurse_tasks).to have_previous_supervisor_contact
  end

  scenario 'Nurse clears supervisor contact' do
    pt_423_nurse_tasks.open

    expect(non_adherence_call).to be_active
    expect(pt_423_nurse_tasks).to have_previous_supervisor_contact

    pt_423_nurse_tasks.clear_supervisor_contact

    expect(pt_423_nurse_tasks).to have_no_previous_supervisor_contact
  end
end

feature 'Nurse, Non-adherence call', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees no task for pt with active connectivity task' do
    pt_427_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active
    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees no task for pt with 1 missed, 1 late session' do
    pt_426_nurse_tasks.open

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees no task for pt with 1 on-time, 1 missed session' do
    pt_320_nurse_tasks.open

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees no task for pt w < 2 lessons released' do
    pt_300_nurse_tasks.open

    expect(non_adherence_call).to_not be_active
  end

  scenario 'Nurse sees number of days since task was due' do
    pt_804_nurse_tasks.open

    expect(pt_804_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_804_nurse_tasks.open

    expect(pt_804_nurse_tasks).to have_overdue_tasks
  end

  scenario 'Nurse cancels out of task resolution form, then resolves task' do
    pt_420_nurse_tasks.open

    expect(pt_420_nurse_tasks).to have_one_task_in_count
    expect(non_adherence_call).to be_active

    # cancel out of form
    non_adherence_call.mark_resolved
    navigation.cancel

    expect(non_adherence_call).to be_active

    # complete form
    non_adherence_call.mark_resolved
    non_adherence_call.complete_resolution_form

    expect(pt_420_nurse_tasks).to have_no_tasks_in_count

    expect(non_adherence_call).to_not be_active

    # check contact information for completeness
    clinical_summary.open
    contact_information.open

    expect(contact_information).to have_non_adherence_call

    expect(non_adherence_call).to have_response

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_420).to_not have_non_adherence_task
    expect(patient_420).to have_tasks_completed
  end
end
