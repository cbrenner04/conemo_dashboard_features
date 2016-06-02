# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/follow_up_week_one_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/your_patients'

def pt_321_nurse_tasks
  @pt_321_nurse_tasks ||= NurseTasks.new(pt_id: 321)
end

def pt_322_nurse_tasks
  @pt_322_nurse_tasks ||= NurseTasks.new(pt_id: 322)
end

def pt_323_nurse_tasks
  @pt_323_nurse_tasks ||= NurseTasks.new(
    pt_id: 323,
    session: 'second_contact',
    session_length: 'asdf'
  )
end

def pt_324_nurse_tasks
  @pt_324_nurse_tasks ||= NurseTasks.new(
    pt_id: 324,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_325_nurse_tasks
  @pt_325_nurse_tasks ||= NurseTasks.new(
    pt_id: 325,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_326_nurse_tasks
  @pt_326_nurse_tasks ||= NurseTasks.new(
    pt_id: 326,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_327_nurse_tasks
  @pt_327_nurse_tasks ||= NurseTasks.new(
    pt_id: 327,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_328_nurse_tasks
  @pt_328_nurse_tasks ||= NurseTasks.new(
    pt_id: 328,
    session: 'second_contact',
    session_length: '120'
  )
end

def patient_328
  @patient_328 ||= YourPatients.new(pt_id: 328)
end

def pt_708_nurse_tasks
  @pt_708_nurse_tasks ||= NurseTasks.new(
    pt_id: 708,
    contact_type: 'Follow up call week 1',
    days_since_due: 'about 1 month',
    tasks_count: 1
  )
end

def nurse_supervisor_7
  @nurse_supervisor_7 ||= SupervisorPage.new(
    pt_id: 320,
    user_id: 400
  )
end

def nurse_supervisor_8
  @nurse_supervisor_8 ||= SupervisorPage.new(
    pt_id: 321,
    user_id: 400
  )
end
