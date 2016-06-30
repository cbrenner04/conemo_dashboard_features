# frozen_string_literal: true
# filename: ./spec/support/nurse_supervisor/participant_helper.rb

require './lib/pages/navigation'
require './lib/pages/new_participants/contact_information'
require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/supervisor/participants'
require './lib/pages/supervisor/active_table'
require './lib/pages/supervisor/completed_table'
require './lib/pages/supervisor/dropped_table'
require './lib/pages/supervisor/pending_table'
require './lib/pages/tasks/confirmation_call'
require './lib/pages/tasks/lack_of_connectivity_call'
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

def pending_participant_table
  @pending_participant_table ||= Supervisor::PendingTable.new(pt_id: 1)
end

def active_participant_table
  @active_participant_table ||= Supervisor::ActiveTable.new(pt_id: 1)
end

def completed_participant_table
  @completed_participant_table ||= Supervisor::CompletedTable.new(
    locale: 'english'
  )
end

def dropped_participant_table
  @dropped_participant_table ||= Supervisor::DroppedTable.new(
    locale: 'english'
  )
end

def spanish_supervisor_participants
  @spanish_supervisor_participants ||= Supervisor::Participants.new(
    locale: 'spanish'
  )
end

def portuguese_supervisor_participants
  @portuguese_supervisor_participants ||= Supervisor::Participants.new(
    locale: 'portuguese'
  )
end

def spanish_pending_participants_table
  @spanish_pending_participants_table ||= Supervisor::PendingTable.new(
    locale: 'spanish'
  )
end

def portuguese_pending_participants_table
  @portuguese_pending_participants_table ||= Supervisor::PendingTable.new(
    locale: 'portuguese'
  )
end

def spanish_active_participants
  @spanish_active_participants ||= Supervisor::ActiveTable.new(
    locale: 'spanish'
  )
end

def portuguese_active_participants
  @portuguese_active_participants ||= Supervisor::ActiveTable.new(
    locale: 'portuguese'
  )
end

def spanish_completed_participants
  @spanish_completed_participants ||= Supervisor::CompletedTable.new(
    locale: 'spanish'
  )
end

def portuguese_completed_participants
  @portuguese_completed_participants ||= Supervisor::CompletedTable.new(
    locale: 'portuguese'
  )
end

def spanish_dropped_participants
  @spanish_dropped_participants ||= Supervisor::DroppedTable.new(
    locale: 'spanish'
  )
end

def portuguese_dropped_participants
  @portuguese_dropped_participants ||= Supervisor::DroppedTable.new(
    locale: 'portuguese'
  )
end

def spanish_contact_information
  @spanish_contact_information ||= NewParticipants::ContactInformation.new(
    locale: 'spanish'
  )
end

def portuguese_contact_information
  @portuguese_contact_information ||=
    NewParticipants::ContactInformation.new(locale: 'portuguese')
end

def participant_413
  @participant_413 ||= Supervisor::Participants.new(pt_id: 413)
end

def active_patient_413_nurse_400
  @active_patient_413_nurse_400 ||= Supervisor::ActiveTable.new(
    pt_id: 413,
    nurse: 400
  )
end

def active_patient_413_nurse_404
  @active_patient_413_nurse_404 ||= Supervisor::ActiveTable.new(
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
  @pt_413_tasks ||= NurseTasks.new(pt_id: 413)
end

def pt_413_supervisor_contact
  @pt_413_supervisor_contact ||= Tasks::SupervisorContacts.new(
    time_of_contact: now - (2 * one_hour)
  )
end

def pt_413_confirmation_call
  @pt_413_confirmation_call ||= Tasks::ConfirmationCall.new(
    locale: 'english'
  )
end

def pt_413_lack_of_connectivity_call
  @pt_413_lack_of_connectivity_call ||= Tasks::LackOfConnectivityCall.new(
    locale: 'english'
  )
end

def pending_patient_495
  @pending_patient_495 ||= Supervisor::PendingTable.new(pt_id: 495)
end

def pending_patient_496
  @pending_patient_496 ||= Supervisor::PendingTable.new(pt_id: 496)
end

def patient_496
  @patient_496 ||= Supervisor::Participants.new(pt_id: 496)
end

def active_patient_496
  @active_patient_496 ||= Supervisor::ActiveTable.new(
    pt_id: 496,
    nurse: 404
  )
end

def active_patient_4036
  @active_patient_4036 ||= Supervisor::ActiveTable.new(
    pt_id: 4036,
    nurse: 401
  )
end

def dropped_patient_4036
  @dropped_patient_4036 ||= Supervisor::DroppedTable.new(
    pt_id: 4036,
    nurse: 401
  )
end

def patient_501
  @patient_501 ||= Supervisor::Participants.new(
    pt_id: 501,
    locale: 'spanish'
  )
end

def patient_502
  @patient_502 ||= Supervisor::Participants.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def pending_patient_502
  @pending_patient_502 ||= Supervisor::PendingTable.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def active_patient_503
  @active_patient_503 ||= Supervisor::ActiveTable.new(
    pt_id: 503,
    nurse: 500,
    locale: 'spanish'
  )
end

def dropped_patient_503
  @dropped_patient_503 ||= Supervisor::DroppedTable.new(
    pt_id: 503,
    nurse: 500,
    locale: 'spanish'
  )
end

def pending_patient_506
  @pending_patient_506 ||= Supervisor::PendingTable.new(
    pt_id: 506,
    locale: 'spanish'
  )
end

def patient_507
  @patient_507 ||= Supervisor::Participants.new(
    pt_id: 507,
    locale: 'spanish'
  )
end

def patient_601
  @patient_601 ||= Supervisor::Participants.new(
    pt_id: 601,
    locale: 'portuguese'
  )
end

def patient_602
  @patient_602 ||= Supervisor::Participants.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def pending_patient_602
  @pending_patient_602 ||= Supervisor::PendingTable.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def active_patient_603
  @active_patient_603 ||= Supervisor::ActiveTable.new(
    pt_id: 603,
    nurse: 600,
    locale: 'portuguese'
  )
end

def dropped_patient_603
  @dropped_patient_603 ||= Supervisor::DroppedTable.new(
    pt_id: 603,
    nurse: 600,
    locale: 'portuguese'
  )
end

def pending_patient_606
  @pending_patient_606 ||= Supervisor::PendingTable.new(
    pt_id: 606,
    locale: 'portuguese'
  )
end

def patient_607
  @patient_607 ||= Supervisor::Participants.new(
    pt_id: 607,
    locale: 'portuguese'
  )
end
