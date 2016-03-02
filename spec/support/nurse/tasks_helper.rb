# filename: ./spec/support/nurse/tasks_helper.rb

require './lib/pages/navigation'
require './lib/pages/your_patients/nurse_tasks'
require './lib/pages/your_patients/nurse_tasks/confirmation_call'
require './lib/pages/your_patients/nurse_tasks/initial_in_person_appointment'
require './lib/pages/your_patients/nurse_tasks/contact_information'
require './lib/pages/your_patients/nurse_tasks/clinical_summary'

def navigation
  @navigation ||= Navigation.new
end

def confirmation_call
  @confirmation_call ||= YourPatients::NurseTasks::ConfirmationCall.new
end

def initial_in_person_appt
  @initial_in_person_appt ||=
    YourPatients::NurseTasks::InitialInPersonAppointment.new
end

def contact_information
  @contact_information ||= YourPatients::NurseTasks::ContactInformation.new
end

def clinical_summary
  @clinical_summary ||= YourPatients::NurseTasks::ClinicalSummary.new(id: 1)
end

def pt_306_nurse_tasks
  @pt_306_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 306)
end

def pt_313_nurse_tasks
  @pt_313_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 313)
end

def pt_314_nurse_tasks
  @pt_314_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 314,
    session: 'first_appointment',
    session_length: 'asdf'
  )
end

def pt_315_nurse_tasks
  @pt_315_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 315)
end

def pt_316_nurse_tasks
  @pt_316_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 316,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_317_nurse_tasks
  @pt_317_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 317,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_318_nurse_tasks
  @pt_318_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 318,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_319_nurse_tasks
  @pt_319_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 319,
    session: 'first_appointment',
    session_length: '120'
  )
end
