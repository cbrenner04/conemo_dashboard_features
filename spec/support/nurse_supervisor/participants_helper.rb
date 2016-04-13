# filename: ./spec/support/nurse_supervisor/participant_helper.rb

require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
require './lib/pages/nurse_tasks/confirmation_call'
require './lib/pages/nurse_tasks/lack_of_connectivity_call'
require './lib/pages/supervisor_page'
require './lib/pages/supervisor_page/participants'
require './lib/pages/your_patients'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def nurse_supervisor
  @nurse_supervisor ||= SupervisorPage.new(pt_id: 'fake')
end

def patient_413_nurse_400
  @patient_413_nurse_400 ||= SupervisorPage::Participants.new(
    pt_id: 413,
    enrollment_date: Date.today - 3,
    nurse: 400
  )
end

def patient_413_nurse_404
  @patient_413_nurse_404 ||= SupervisorPage::Participants.new(
    pt_id: 413,
    enrollment_date: Date.today - 3,
    nurse: 404
  )
end

def patient_413
  @patient_413 ||= YourPatients.new(
    pt_id: 413,
    locale: 'english'
  )
end

def pt_413_tasks
  @pt_413_tasks ||= NurseTasks.new(
    pt_id: 413,
    time_of_contact: Time.now - (2 * 60 * 60)
  )
end

def pt_413_confirmation_call
  @pt_413_confirmation_call ||= NurseTasks::ConfirmationCall.new(
    locale: 'english'
  )
end

def pt_413_lack_of_connectivity_call
  @pt_413_lack_of_connectivity_call ||= NurseTasks::LackOfConnectivityCall.new(
    locale: 'english'
  )
end

def patient_495
  @patient_495 ||= SupervisorPage::Participants.new(pt_id: 495)
end

def patient_496
  @patient_496 ||= SupervisorPage::Participants.new(
    pt_id: 496,
    enrollment_date: Date.today - 12,
    nurse: 404
  )
end

def patient_4036
  @patient_4036 ||= SupervisorPage::Participants.new(
    pt_id: 4036,
    nurse: 401,
    enrollment_date: Date.today - 10
  )
end

def patient_503
  @patient_503 ||= SupervisorPage::Participants.new(
    pt_id: 503,
    nurse: 500,
    enrollment_date: Date.today - 12,
    locale: 'spanish'
  )
end

def patient_603
  @patient_603 ||= SupervisorPage::Participants.new(
    pt_id: 603,
    nurse: 600,
    enrollment_date: Date.today - 12,
    locale: 'portuguese'
  )
end
