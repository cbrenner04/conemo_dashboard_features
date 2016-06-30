# frozen_string_literal: true
# filename: ./spec/features/nurse/tasks/help_request_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/help_request_helper'

feature 'Nurse, Participant Tasks, Help Request', metadata: :first do
  background { english_nurse.sign_in }

  scenario 'Nurse contacts supervisor for help request' do
    pt_401_nurse_tasks.open

    expect(help_request).to be_active

    help_request.contact_supervisor

    expect(help_request).to be_active
    expect(pt_401_supervisor_contacts).to have_new_supervisor_contact
  end

  scenario 'Sees when the last supervisor contact sent' do
    pt_402_nurse_tasks.open

    expect(help_request).to be_active
    expect(pt_402_supervisor_contact).to have_previous_supervisor_contact
  end
end

feature 'Nurse, Participant Tasks, Help request', metadata: :not_first do
  background { english_nurse.sign_in }

  # poltergeist does not see the timestamp
  scenario 'Nurse sees number of days since due', :browser do
    pt_802_nurse_tasks.open

    expect(pt_802_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees help request overdue' do
    pt_802_nurse_tasks.open

    expect(pt_802_nurse_tasks).to have_overdue_tasks
  end

  scenario 'Nurse cancels out of resolution form' do
    pt_400_nurse_tasks.open

    expect(help_request).to be_active

    help_request.mark_resolved
    navigation.cancel

    expect(help_request).to be_active
  end

  scenario 'Nurse marks help request as resolved' do
    pt_400_nurse_tasks.open

    expect(pt_400_nurse_tasks).to have_one_task_in_count
    expect(help_request).to be_active

    help_request.mark_resolved
    help_request.complete_resolution_form

    expect(help_request).to_not be_active
    expect(pt_400_nurse_tasks).to have_no_tasks_in_count

    # check timeline for completed task
    timeline.open

    expect(timeline).to have_help_request
    expect(help_request).to have_response

    # check Your Patients list for old / new tasks
    navigation.return_home

    expect(patient_400).to_not have_help_request
    expect(patient_400).to have_tasks_completed
  end
end

feature 'Nurse, Participant Tasks, Help request', metadata: :not_first do
  scenario 'Nurse cancels help request' do
    english_nurse_401.sign_in
    pt_4024_nurse_tasks.open

    help_request.mark_resolved
    help_request.resolve_as_canceled

    expect(help_request).to_not be_active

    english_nurse_401.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_14).to have_task_canceled 'Help request'
    expect(help_request).to have_cancel_reason
  end
end
