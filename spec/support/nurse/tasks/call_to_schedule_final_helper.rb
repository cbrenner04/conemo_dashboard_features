# filename: ./spec/support/nurse/tasks/call_to_schedule_final_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/your_patients'

def nurse_supervisor_1
  @nurse_supervisor_1 ||= SupervisorPage.new(
    pt_id: 704,
    user_id: 400
  )
end

def nurse_supervisor_2
  @nurse_supervisor_2 ||= SupervisorPage.new(
    pt_id: 705,
    user_id: 400
  )
end

def pt_337_nurse_tasks
  @pt_337_nurse_tasks ||= NurseTasks.new(pt_id: 337)
end

def pt_700_nurse_tasks
  @pt_700_nurse_tasks ||= NurseTasks.new(pt_id: 700)
end

def pt_701_nurse_tasks
  @pt_701_nurse_tasks ||= NurseTasks.new(pt_id: 701)
end

def pt_702_nurse_tasks
  @pt_702_nurse_tasks ||= NurseTasks.new(pt_id: 702)
end

def patient_702
  @patient_702 ||= YourPatients.new(pt_id: 702)
end

def pt_704_nurse_tasks
  @pt_704_nurse_tasks ||= NurseTasks.new(pt_id: 704)
end

def pt_705_nurse_tasks
  @pt_705_nurse_tasks ||= NurseTasks.new(pt_id: 705)
end

def pt_800_nurse_tasks
  @pt_800_nurse_tasks ||= NurseTasks.new(
    pt_id: 800,
    contact_type: 'Call to schedule final in person appointment',
    days_since_due: '4 days',
    tasks_count: 1
  )
end
