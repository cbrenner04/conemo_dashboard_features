# filename: ./spec/features/nurse_supervisor/pending_participants_spec.rb

require './spec/support/nurse_supervisor/participants_helper.rb'

feature 'Nurse Supervisor, Participants', metadata: :first do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor sees all pending participants' do
    # including enrollment date?
    expect(nurse_supervisor).to have_pending_participants
  end

  scenario 'Nurse Supervisor sees information for completed participants' do
    expect(nurse_supervisor).to have_total_completed

    expect(nurse_supervisor).to have_completed_participant_information
  end

  scenario 'Nurse Supervisor sees information for dropped participants' do
    expect(nurse_supervisor).to have_total_dropped_out

    expect(nurse_supervisor).to have_dropped_participant_information
  end

  scenario 'Nurse Supervisor sees all active participants' do
    expect(nurse_supervisor).to have_total_active

    # check for enrollment date and date added
    # may have a dependency issue
    expect(nurse_supervisor).to have_active_patient

    # check that it shows a sample of all of the participants
    expect(nurse_supervisor).to have_active_participant_information
  end

  scenario 'Nurse Supervisor reassigns a participant to a different nurse' do
    expect(patient_413_nurse_400).to be_active

    patient_413_nurse_400.reassign

    expect(patient_413_nurse_404).to be_active

    english_supervisor.sign_out
    english_nurse_404.sign_in

    expect(patient_413).to have_tasks_active

    expect(patient_413).to have_confirmation_call

    expect(patient_413).to have_lack_of_connectivity_task

    pt_413_tasks.open

    expect(pt_413_tasks).to have_previous_supervisor_contact

    expect(pt_413_confirmation_call).to be_active

    expect(pt_413_lack_of_connectivity_call).to be_active
  end
end

feature 'Nurse Supervisor, Participants', metadata: :not_first do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor can only assign to nurse they are supervising' do
    patient_495.activate

    expect(patient_495).to have_nurse_options
  end

  scenario 'Nurse Supervisor activates a participant' do
    patient_496.activate
    patient_496.assign_nurse

    expect(patient_496).to be_active
  end

  scenario 'Nurse Supervisor terminates an active participant' do
    expect(patient_4036).to be_active

    patient_4036.terminate

    expect(patient_4036).to_not be_active

    expect(patient_4036).to be_dropped
  end
end
