# frozen_string_literal: true
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
    expect(pt_411_supervisor_contact).to have_new_supervisor_contact
  end

  scenario 'Sees when the last supervisor contact sent' do
    pt_412_nurse_tasks.open

    expect(lack_of_connectivity_call).to be_active
    expect(pt_412_supervisor_contact).to have_previous_supervisor_contact
  end

  # check that a non-connectivity task is not triggered for a participant who
  # is does not have connectivity but had a non-connectivity task resolved in
  # last 12 hours
  scenario 'Nurse does not see connectivity task for pt w no connectivity' do
    # participant should not have task
    expect(patient_415).to_not have_lack_of_connectivity_task

    # check tasks page for lack of task
    pt_415_nurse_tasks.open

    expect(pt_415_nurse_tasks).to have_no_tasks_in_count
    expect(lack_of_connectivity_call).to_not be_active

    # check clinical summary for two days of non-connectivity
    # meaning a task is needed
    pt_415_clinical_summary.open

    if now.strftime('%H').to_i < 12
      expect(pt_415_clinical_summary).to have_three_non_connectivity_icons
    else
      expect(pt_415_clinical_summary).to have_two_non_connectivity_icons
    end

    # check timeline for resolved non-connectivity task in last 12 hours
    # meaning a task should not be triggered
    timeline.open

    expect(timeline).to have_non_connectivity_call_in_last_12_hours
  end

  # check that a non-connectivity task is not triggered for a participant who
  # is does not have connectivity but had a non-connectivity task resolved in
  # last 12 hours
  scenario 'Nurse sees connectivity task for pt w resolved connectivity task' do
    # participant should have task
    expect(patient_414).to have_lack_of_connectivity_task

    # check tasks page for task
    pt_414_nurse_tasks.open

    expect(pt_414_nurse_tasks).to have_one_task_in_count
    expect(lack_of_connectivity_call).to be_active

    # check clinical summary for two days of non-connectivity
    # meaning a task is needed
    pt_414_clinical_summary.open

    if now.strftime('%H').to_i < 12
      expect(pt_415_clinical_summary).to have_three_non_connectivity_icons
    else
      expect(pt_415_clinical_summary).to have_two_non_connectivity_icons
    end

    # check timeline for resolved non-connectivity task more than 12 hours ago
    # meaning a task should be triggered
    timeline.open

    expect(timeline).to have_non_connectivity_call_longer_than_12_hours_ago
  end
end

feature 'Nurse, Non-connectivity call', metadata: :not_first do
  background { english_nurse.sign_in }

  # poltergeist does not see the timestamp
  scenario 'Nurse sees number days since task was due', :browser do
    pt_803_nurse_tasks.open

    expect(pt_803_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees non-connectivity notification on clinical summary' do
    pt_1000_nurse_tasks.open
    pt_1000_clinical_summary_1.open

    expect(pt_1000_clinical_summary_1).to have_three_non_connectivity_icons
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
    navigation.return_home

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

    expect(nurse_supervisor_16)
      .to have_task_canceled 'Call due to no connectivity'
    expect(lack_of_connectivity_call).to have_cancel_reason
  end
end
