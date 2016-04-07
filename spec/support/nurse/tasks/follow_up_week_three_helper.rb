# filename: ./spec/support/nurse/tasks/follow_up_week_three_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/your_patients'

def pt_329_nurse_tasks
  @pt_329_nurse_tasks ||= NurseTasks.new(pt_id: 329)
end

def pt_333_nurse_tasks
  @pt_333_nurse_tasks ||= NurseTasks.new(pt_id: 333)
end

def pt_330_nurse_tasks
  @pt_330_nurse_tasks ||= NurseTasks.new(pt_id: 330)
end

def pt_331_nurse_tasks
  @pt_331_nurse_tasks ||= NurseTasks.new(
    pt_id: 331,
    session: 'third_contact',
    session_length: 'asdf'
  )
end

def pt_332_nurse_tasks
  @pt_332_nurse_tasks ||= NurseTasks.new(pt_id: 332)
end

def pt_333_nurse_tasks
  @pt_333_nurse_tasks ||= NurseTasks.new(
    pt_id: 333,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_334_nurse_tasks
  @pt_334_nurse_tasks ||= NurseTasks.new(
    pt_id: 334,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_335_nurse_tasks
  @pt_335_nurse_tasks ||= NurseTasks.new(
    pt_id: 335,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_336_nurse_tasks
  @pt_336_nurse_tasks ||= NurseTasks.new(
    pt_id: 336,
    session: 'third_contact',
    session_length: '120'
  )
end

def patient_336
  @patient_336 ||= YourPatients.new(pt_id: 336)
end

def pt_709_nurse_tasks
  @pt_709_nurse_tasks ||= NurseTasks.new(
    pt_id: 709,
    contact_type: 'Follow up call week 3',
    days_since_due: '14 days',
    tasks_count: 1
  )
end

def nurse_supervisor_9
  @nurse_supervisor_9 ||= SupervisorPage.new(pt_id: 329)
end

def nurse_supervisor_10
  @nurse_supervisor_10 ||= SupervisorPage.new(pt_id: 333)
end
