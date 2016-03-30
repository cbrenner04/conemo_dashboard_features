# filename: ./spec/features/nurse_supervisor/pending_participants_spec.rb

require './spec/support/nurse_supervisor/participants_helper.rb'

feature 'Nurse Supervisor, Pending Participants' do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor sees table at the top of summary page'
  # above should include count
  scenario 'Can only assign a participant to a nurse they are supervising'
  scenario 'Nurse supervisor should see the enrollment date and date added'
  scenario 'Nurse Supervisor activates a participant'
  scenario 'Nurse Supervisor disqualifies a participant'
  scenario 'Nurse Supervisor sees count of all active participants'

  scenario 'Nurse Supervisor sees information for completed participants' do
    expect(nurse_supervisor).to have_total_completed

    expect(nurse_supervisor).to have_completed_participant_information
  end

  scenario 'Nurse Supervisor sees information for dropped participants' do
    expect(nurse_supervisor).to have_total_dropped_out

    expect(nurse_supervisor).to have_dropped_participant_information
  end
end
