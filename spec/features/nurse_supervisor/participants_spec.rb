# frozen_string_literal: true
# filename: ./spec/features/nurse_supervisor/pending_participants_spec.rb

require './spec/support/nurse_supervisor/participants_helper.rb'

feature 'Nurse Supervisor, Participants', metadata: :first do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor sees all pending participants' do
    # including enrollment date?
    expect(pending_participants_table).to have_pending_participants
  end

  scenario 'Nurse Supervisor sees information for completed participants' do
    expect(completed_participant_table).to have_total_completed
    2.times { navigation.scroll_down }
    expect(completed_participant_table)
      .to have_completed_participant_information
  end

  scenario 'Nurse Supervisor sees information for dropped participants' do
    expect(dropped_participant_table).to have_total_dropped_out
    3.times { navigation.scroll_down }
    expect(dropped_participant_table).to have_dropped_participant_information
  end

  scenario 'Nurse Supervisor sees all active participants' do
    expect(active_participant_table).to have_total_active
    # check for enrollment date and date added
    # may have a dependency issue
    expect(active_participant_table).to have_active_patient
    # check that it shows a sample of all of the participants
    expect(active_participant_table).to have_active_participant_information
  end

  scenario 'Nurse Supervisor reassigns a participant to a different nurse' do
    expect(active_patient_413_nurse_400).to be_active

    participant_413.reassign

    expect(active_patient_413_nurse_404).to be_active

    english_supervisor.sign_out
    english_nurse_404.sign_in

    expect(patient_413).to have_tasks_active
    expect(patient_413).to have_confirmation_call
    expect(patient_413).to have_lack_of_connectivity_task

    pt_413_tasks.open

    expect(pt_413_supervisor_contact).to have_previous_supervisor_contact
    expect(pt_413_confirmation_call).to be_active
    expect(pt_413_lack_of_connectivity_call).to be_active
  end
end

feature 'Nurse Supervisor, Participants', metadata: :not_first do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor can only assign to nurse they are supervising' do
    pending_patient_495.activate

    expect(pending_patient_495).to have_nurse_options
  end

  scenario 'Nurse Supervisor activates a participant' do
    pending_patient_496.activate
    patient_496.assign_nurse

    expect(active_patient_496).to be_active
  end

  scenario 'Nurse Supervisor terminates an active participant' do
    expect(active_patient_4036).to be_active

    active_patient_4036.terminate

    expect(active_patient_4036).to_not be_active
    expect(dropped_patient_4036).to be_dropped
  end
end

feature 'Spanish Nurse Supervisor, Participants', metadata: :not_first do
  background { spanish_supervisor.sign_in }

  scenario 'Sees correct translations' do
    expect(spanish_supervisor_participants).to have_participants_title
    expect(spanish_pending_participants).to have_pending_panel_title
    expect(spanish_pending_participants).to have_pending_table_headers
    expect(spanish_active_participants).to have_active_panel_title
    expect(spanish_active_participants).to have_active_table_headers
    expect(spanish_completed_participants).to have_completed_panel_title
    expect(spanish_completed_participants).to have_completed_table_headers
    expect(spanish_dropped_participants).to have_dropped_panel_title
    expect(spanish_dropped_participants).to have_dropped_table_headers
  end

  scenario 'Sees correct translation for activating a participant' do
    pending_patient_506.activate

    expect(pending_patient_506).to have_nurse_assignment_form_visible
  end

  scenario 'Sees correct translations for editing participant information' do
    patient_507.edit_information

    expect(spanish_contact_information).to have_form_fields

    spanish_navigation.cancel
    spanish_navigation.scroll_down
    patient_501.edit_information

    expect(spanish_contact_information).to have_form_fields
  end

  scenario 'Sees correct translations for reassigning nurse' do
    patient_502.reassign

    expect(pending_patient_502).to have_nurse_assignment_form_visible
  end

  scenario 'Sees correct translation for terminating participants' do
    active_patient_503.terminate

    expect(dropped_patient_503).to be_dropped
  end
end

feature 'Portuguese Nurse Supervisor, Participants', metadata: :not_first do
  background { portuguese_supervisor.sign_in }

  scenario 'Sees correct translations' do
    expect(portuguese_supervisor_participants).to have_participants_title
    expect(portuguese_pending_participants).to have_pending_panel_title
    expect(portuguese_pending_participants).to have_pending_table_headers
    expect(portuguese_active_participants).to have_active_panel_title
    expect(portuguese_active_participants).to have_active_table_headers
    expect(portuguese_completed_participants).to have_completed_panel_title
    expect(portuguese_completed_participants).to have_completed_table_headers
    expect(portuguese_dropped_participants).to have_dropped_panel_title
    expect(portuguese_dropped_participants).to have_dropped_table_headers
  end

  scenario 'Sees correct translation for activating a participant' do
    pending_patient_606.activate

    expect(pending_patient_606).to have_nurse_assignment_form_visible
  end

  scenario 'Sees correct translations for editing participant information' do
    patient_607.edit_information

    expect(portuguese_contact_information).to have_form_fields

    portuguese_navigation.cancel
    portuguese_navigation.scroll_down
    patient_601.edit_information

    expect(portuguese_contact_information).to have_form_fields
  end

  scenario 'Sees correct translations for reassigning nurse' do
    patient_602.reassign

    expect(patient_602).to have_nurse_assignment_form_visible
  end

  scenario 'Sees correct translation for terminating participants' do
    navigation.scroll_down
    active_patient_603.terminate

    expect(dropped_patient_603).to be_dropped
  end
end
