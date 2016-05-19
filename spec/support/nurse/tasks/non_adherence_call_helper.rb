# filename: ./spec/support/nurse/tasks/non_adherence_call_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/tasks/non_adherence_call'
require './lib/pages/tasks/lack_of_connectivity_call'
require './lib/pages/your_patients'

def non_adherence_call
  @non_adherence_call ||= Tasks::NonAdherenceCall.new(locale: 'english')
end

def lack_of_connectivity_call
  @lack_of_connectivity_call ||= Tasks::LackOfConnectivityCall.new(
    locale: 'english'
  )
end

def pt_420_nurse_tasks
  @pt_420_nurse_tasks ||= NurseTasks.new(pt_id: 420)
end

def patient_420
  @patient_420 ||= YourPatients.new(pt_id: 420)
end

def pt_421_nurse_tasks
  @pt_421_nurse_tasks ||= NurseTasks.new(pt_id: 421)
end

def pt_424_nurse_tasks
  @pt_424_nurse_tasks ||= NurseTasks.new(
    pt_id: 424,
    time_of_contact: Time.now - (2 * 60 * 60)
  )
end

def pt_426_nurse_tasks
  @pt_426_nurse_tasks ||= NurseTasks.new(pt_id: 426)
end

def pt_427_nurse_tasks
  @pt_427_nurse_tasks ||= NurseTasks.new(pt_id: 427)
end

def pt_804_nurse_tasks
  @pt_804_nurse_tasks ||= NurseTasks.new(
    pt_id: 804,
    contact_type: 'Non-adherence call',
    days_since_due: '3 days',
    tasks_count: 1
  )
end

def pt_4026_nurse_tasks
  @pt_4026_nurse_tasks ||= NurseTasks.new(pt_id: 4026)
end

def nurse_supervisor_15
  @nurse_supervisor_15 ||= SupervisorPage.new(
    pt_id: 4026,
    user_id: 401
  )
end
