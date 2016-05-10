# filename: ./spec/support/nurse_supervisor/participant_helper.rb

require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
require './lib/pages/nurse_tasks/confirmation_call'
require './lib/pages/nurse_tasks/lack_of_connectivity_call'
require './lib/pages/pending_participants/contact_information'
require './lib/pages/supervisor_page'
require './lib/pages/supervisor_page/participants'
require './lib/pages/your_patients'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def spanish_navigation
  @spanish_navigation ||= Navigation.new(locale: 'spanish')
end

def portuguese_navigation
  @portuguese_navigation ||= Navigation.new(locale: 'portuguese')
end

def nurse_supervisor
  @nurse_supervisor ||= SupervisorPage.new(locale: 'english')
end

def spanish_supervisor_participants
  @spanish_supervisor_participants ||= SupervisorPage::Participants.new(
    locale: 'spanish'
  )
end

def portuguese_supervisor_participants
  @portuguese_supervisor_participants ||= SupervisorPage::Participants.new(
    locale: 'portuguese'
  )
end

def spanish_contact_information
  @spanish_contact_information ||= PendingParticipants::ContactInformation.new(
    locale: 'spanish'
  )
end

def portuguese_contact_information
  @portuguese_contact_information ||=
    PendingParticipants::ContactInformation.new(locale: 'portuguese')
end

def patient_413_nurse_400
  @patient_413_nurse_400 ||= SupervisorPage::Participants.new(
    pt_id: 413,
    nurse: 400
  )
end

def patient_413_nurse_404
  @patient_413_nurse_404 ||= SupervisorPage::Participants.new(
    pt_id: 413,
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
    nurse: 404
  )
end

def patient_4036
  @patient_4036 ||= SupervisorPage::Participants.new(
    pt_id: 4036,
    nurse: 401
  )
end

def patient_501
  @patient_501 ||= SupervisorPage::Participants.new(
    pt_id: 501,
    locale: 'spanish'
  )
end

def patient_502
  @patient_502 ||= SupervisorPage::Participants.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def patient_503
  @patient_503 ||= SupervisorPage::Participants.new(
    pt_id: 503,
    nurse: 500,
    locale: 'spanish'
  )
end

def patient_506
  @patient_506 ||= SupervisorPage::Participants.new(
    pt_id: 506,
    locale: 'spanish'
  )
end

def patient_507
  @patient_507 ||= SupervisorPage::Participants.new(
    pt_id: 507,
    locale: 'spanish'
  )
end

def patient_601
  @patient_601 ||= SupervisorPage::Participants.new(
    pt_id: 601,
    locale: 'portuguese'
  )
end

def patient_602
  @patient_602 ||= SupervisorPage::Participants.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def patient_603
  @patient_603 ||= SupervisorPage::Participants.new(
    pt_id: 603,
    nurse: 600,
    locale: 'portuguese'
  )
end

def patient_606
  @patient_606 ||= SupervisorPage::Participants.new(
    pt_id: 606,
    locale: 'portuguese'
  )
end

def patient_607
  @patient_607 ||= SupervisorPage::Participants.new(
    pt_id: 607,
    locale: 'portuguese'
  )
end
