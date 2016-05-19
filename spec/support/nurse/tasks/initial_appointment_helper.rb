# filename: ./spec/support/nurse/tasks/initial_appointment_helper.rb

require './lib/pages/contact_information'
require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/your_patients'

def contact_information
  @contact_information ||= ContactInformation.new(locale: 'english')
end

def pt_311_nurse_tasks
  @pt_311_nurse_tasks ||= NurseTasks.new(pt_id: 311)
end

def pt_317_nurse_tasks
  @pt_317_nurse_tasks ||= NurseTasks.new(pt_id: 317)
end

def pt_318_nurse_tasks
  @pt_318_nurse_tasks ||= NurseTasks.new(pt_id: 318)
end

def pt_313_nurse_tasks
  @pt_313_nurse_tasks ||= NurseTasks.new(pt_id: 313)
end

def pt_314_nurse_tasks
  @pt_314_nurse_tasks ||= NurseTasks.new(
    pt_id: 314,
    session: 'first_appointment',
    session_length: 'asdf'
  )
end

def pt_315_nurse_tasks
  @pt_315_nurse_tasks ||= NurseTasks.new(pt_id: 315)
end

def pt_316_nurse_tasks
  @pt_316_nurse_tasks ||= NurseTasks.new(
    pt_id: 316,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_319_nurse_tasks
  @pt_319_nurse_tasks ||= NurseTasks.new(
    pt_id: 319,
    session: 'first_appointment',
    session_length: '120'
  )
end

def patient_319
  @patient_319 ||= YourPatients.new(pt_id: 319)
end

def pt_707_nurse_tasks
  @pt_707_nurse_tasks ||= NurseTasks.new(
    pt_id: 707,
    contact_type: 'Initial in person appointment',
    days_since_due: 'about 1 month',
    tasks_count: 1
  )
end

def nurse_supervisor_11
  @nurse_supervisor_11 ||= SupervisorPage.new(
    pt_id: 311,
    user_id: 400
  )
end

def nurse_supervisor_12
  @nurse_supervisor_12 ||= SupervisorPage.new(
    pt_id: 318,
    user_id: 400
  )
end
