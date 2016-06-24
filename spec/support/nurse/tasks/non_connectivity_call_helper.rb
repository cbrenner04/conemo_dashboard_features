# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/non_connectivity_call_helper.rb

require './lib/pages/clinical_summary'
require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/tasks/lack_of_connectivity_call'
require './lib/pages/your_patients'

def lack_of_connectivity_call
  @lack_of_connectivity_call ||=
    Tasks::LackOfConnectivityCall.new(locale: 'english')
end

def pt_410_nurse_tasks
  @pt_410_nurse_tasks ||= NurseTasks.new(pt_id: 410)
end

def patient_410
  @patient_410 ||= YourPatients.new(pt_id: 410)
end

def pt_411_nurse_tasks
  @pt_411_nurse_tasks ||= NurseTasks.new(pt_id: 411)
end

def pt_412_nurse_tasks
  @pt_412_nurse_tasks ||= NurseTasks.new(
    pt_id: 412,
    time_of_contact: now - (2 * one_hour)
  )
end

def patient_414
  @patient_414 ||= YourPatients.new(pt_id: 414)
end

def pt_414_nurse_tasks
  @pt_414_nurse_tasks ||= NurseTasks.new(pt_id: 414)
end

def pt_414_clinical_summary
  @pt_414_clinical_summary ||= ClinicalSummary.new(id: 414)
end

def patient_415
  @patient_415 ||= YourPatients.new(pt_id: 415)
end

def pt_415_nurse_tasks
  @pt_415_nurse_tasks ||= NurseTasks.new(pt_id: 415)
end

def pt_415_clinical_summary
  @pt_415_clinical_summary ||= ClinicalSummary.new(id: 415)
end

def pt_803_nurse_tasks
  @pt_803_nurse_tasks ||= NurseTasks.new(
    pt_id: 803,
    contact_type: 'Call due to no connectivity',
    days_since_due: '3 days',
    tasks_count: 1
  )
end

def pt_1000_nurse_tasks
  @pt_1000_nurse_tasks ||= NurseTasks.new(pt_id: 1000)
end

def pt_1000_clinical_summary_1
  @pt_1000_clinical_summary_1 ||= ClinicalSummary.new(id: 1000)
end

def pt_4025_nurse_tasks
  @pt_4025_nurse_tasks ||= NurseTasks.new(pt_id: 4025)
end

def nurse_supervisor_16
  @nurse_supervisor_16 ||= SupervisorPage.new(
    pt_id: 4025,
    user_id: 401
  )
end
