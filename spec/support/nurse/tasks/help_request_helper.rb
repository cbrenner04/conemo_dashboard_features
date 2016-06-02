# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/help_request_helper.rb

require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/tasks/help_request'
require './lib/pages/your_patients'

def help_request
  @help_request ||= Tasks::HelpRequest.new(
    locale: 'english'
  )
end

def pt_400_nurse_tasks
  @pt_400_nurse_tasks ||= NurseTasks.new(pt_id: 400)
end

def patient_400
  @patient_400 ||= YourPatients.new(pt_id: 400)
end

def pt_401_nurse_tasks
  @pt_401_nurse_tasks ||= NurseTasks.new(pt_id: 401)
end

def pt_402_nurse_tasks
  @pt_402_nurse_tasks ||= NurseTasks.new(
    pt_id: 402,
    time_of_contact: Time.now - (3 * 60 * 60)
  )
end

def pt_403_nurse_tasks
  @pt_403_nurse_tasks ||= NurseTasks.new(
    pt_id: 403,
    time_of_contact: Time.now - (3 * 60 * 60)
  )
end

def pt_802_nurse_tasks
  @pt_802_nurse_tasks ||= NurseTasks.new(
    pt_id: 802,
    days_since_due: '3 days',
    contact_type: 'Help request',
    tasks_count: 1
  )
end

def pt_4024_nurse_tasks
  @pt_4024_nurse_tasks ||= NurseTasks.new(pt_id: 4024)
end

def nurse_supervisor_14
  @nurse_supervisor_14 ||= SupervisorPage.new(
    pt_id: 4024,
    user_id: 401
  )
end
