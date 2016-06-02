# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/final_appointment_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/your_patients'

def pt_337_nurse_tasks
  @pt_337_nurse_tasks ||= NurseTasks.new(pt_id: 337)
end

def pt_338_nurse_tasks
  @pt_338_nurse_tasks ||= NurseTasks.new(pt_id: 338)
end

def pt_339_nurse_tasks
  @pt_339_nurse_tasks ||= NurseTasks.new(pt_id: 339)
end

def pt_340_nurse_tasks
  @pt_340_nurse_tasks ||= NurseTasks.new(pt_id: 340)
end

def pt_341_nurse_tasks
  @pt_341_nurse_tasks ||= NurseTasks.new(pt_id: 341)
end

def patient_341
  @patient_341 ||= YourPatients.new(pt_id: 341)
end

def pt_345_nurse_tasks
  @pt_345_nurse_tasks ||= NurseTasks.new(pt_id: 345)
end

def pt_801_nurse_tasks
  @pt_801_nurse_tasks ||= NurseTasks.new(
    pt_id: 801,
    contact_type: 'Final in person appointment',
    days_since_due: '4 days',
    tasks_count: 1
  )
end

def nurse_supervisor_5
  @nurse_supervisor_5 ||= SupervisorPage.new(
    pt_id: 337,
    user_id: 400
  )
end

def nurse_supervisor_6
  @nurse_supervisor_6 ||= SupervisorPage.new(
    pt_id: 345,
    user_id: 400
  )
end
