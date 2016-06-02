# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/confirmation_call_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/your_patients'

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= NurseTasks.new(pt_id: 301)
end

def pt_303_nurse_tasks
  @pt_303_nurse_tasks ||= NurseTasks.new(pt_id: 303)
end

def pt_304_nurse_tasks
  @pt_304_nurse_tasks ||= NurseTasks.new(pt_id: 304)
end

def pt_306_nurse_tasks
  @pt_306_nurse_tasks ||= NurseTasks.new(pt_id: 306)
end

def patient_306
  @patient_306 ||= YourPatients.new(pt_id: 306)
end

def pt_706_nurse_tasks
  @pt_706_nurse_tasks ||= NurseTasks.new(
    pt_id: 706,
    contact_type: 'Confirmation call',
    days_since_due: 'about 2 months',
    tasks_count: 2
  )
end

def nurse_supervisor_3
  @nurse_supervisor_3 ||= SupervisorPage.new(
    pt_id: 301,
    user_id: 400
  )
end

def nurse_supervisor_4
  @nurse_supervisor_4 ||= SupervisorPage.new(
    pt_id: 304,
    user_id: 400
  )
end
