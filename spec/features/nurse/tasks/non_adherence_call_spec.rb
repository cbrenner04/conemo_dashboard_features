# frozen_string_literal: true
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
    expect(pt_421_supervisor_contact).to have_new_supervisor_contact
  end

  scenario 'Sees when the last supervisor contact sent' do
    pt_424_nurse_tasks.open

    expect(non_adherence_call).to be_active
    expect(pt_424_supervisor_contact).to have_previous_supervisor_contact
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

  # poltergeist does not see the timestamp
  scenario 'Nurse sees number of days since task was due', :browser do
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

    # check timeline for completeness
    timeline.open

    expect(timeline).to have_non_adherence_call
    expect(non_adherence_call).to have_response

    # check Your Patients list for old / new tasks
    navigation.return_home

    expect(patient_420).to_not have_non_adherence_task
    expect(patient_420).to have_tasks_completed
  end

  # check that a non-adherence task is not triggered for a participant who
  # is not adherent but had a non-adherence task resolved since last session
  scenario 'Nurse does not see non-adherence task for non-adherent pt' do
    # participant should not have task
    expect(patient_1001).to_not have_non_adherence_task

    # tasks page for lack of task
    pt_1001_nurse_tasks.open

    expect(pt_1001_nurse_tasks).to have_no_tasks_in_count
    expect(non_adherence_call).to_not be_active

    # check clinical summary for overdue lessons (meaning a task is needed)
    clinical_summary.open

    expect(clinical_summary).to be_visible

    expect(pt_1001_lessons_table).to have_current_lesson
    expect(pt_1001_lessons_table).to have_unread_lesson
    expect(pt_1001_lessons_table_1).to have_unread_lesson

    # check timeline for resolved non-adherence task in last day
    # (nullifying need for new task)
    timeline.open
    expect(timeline).to have_non_adherence_call
  end

  # check that a non-adherence task is triggered for a participant who is
  # non-adherent and has a resolved but that task was resolved before the most
  # recent session was released
  scenario 'Nurse sees non-adherence task for pt with one already resolved' do
    # participant should have task
    expect(patient_425).to have_non_adherence_task

    # tasks page for task
    pt_425_nurse_tasks.open

    expect(pt_425_nurse_tasks).to have_one_task_in_count
    expect(non_adherence_call).to be_active

    # check clinical summary for overdue lessons (meaning a task is needed)
    clinical_summary.open

    expect(clinical_summary).to be_visible

    expect(pt_425_lessons_table).to have_current_lesson
    expect(pt_425_lessons_table).to have_unread_lesson
    expect(pt_425_lessons_table_1).to have_unread_lesson

    # check timeline for resolved non-adherence task in two days agp
    # (which is before most recent session release creating need for new task)
    timeline.open
    expect(timeline).to have_non_adherence_call_two_days_ago
  end
end

feature 'Nurse, Non-adherence call', metadata: :not_first do
  scenario 'Nurse cancels non-adherence call' do
    english_nurse_401.sign_in
    pt_4026_nurse_tasks.open

    non_adherence_call.mark_resolved
    non_adherence_call.resolve_as_canceled

    expect(non_adherence_call).to_not be_active

    english_nurse_401.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_15).to have_task_canceled 'Non-adherence call'
    expect(non_adherence_call).to have_cancel_reason
  end
end
