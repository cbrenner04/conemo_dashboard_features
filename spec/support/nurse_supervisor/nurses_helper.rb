# frozen_string_literal: true
# filename: ./spec/support/nurse_supervisor/nurse_helper.rb

require 'business_time'
require './lib/pages/clinical_summary'
require './lib/pages/contact_information'
require './lib/pages/contact_info/smartphone_information'
require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
require './lib/pages/supervisor_page'
require './lib/pages/supervisor/nurses'
require './lib/pages/tasks/confirmation_call'
require './lib/pages/tasks/help_request'
require './lib/pages/tasks/lack_of_connectivity_call'
require './lib/pages/timeline_page'
require './lib/pages/your_patients'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def nurse_supervisor
  @nurse_supervisor ||= SupervisorPage.new(pt_id: 'fake')
end

def your_patients
  @your_patients ||= YourPatients.new(locale: 'english')
end

def confirmation_call
  @confirmation_call ||= Tasks::ConfirmationCall.new(locale: 'english')
end

def help_request
  @help_request ||= Tasks::HelpRequest.new(locale: 'english')
end

def lack_of_connectivity_call
  @lack_of_connectivity_call ||= Tasks::LackOfConnectivityCall.new(
    locale: 'english'
  )
end

def spanish_supervisor_nurses
  @spanish_supervisor_nurses ||= Supervisor::Nurses.new(locale: 'spanish')
end

def portuguese_supervisor_nurses
  @portuguese_supervisor_nurses ||= Supervisor::Nurses.new(
    locale: 'portuguese'
  )
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= NurseTasks.new(pt_id: 300)
end

def pt_300_clinical_summary_2
  @pt_300_clinical_summary_2 ||= ClinicalSummary.new(
    locale: 'english'
  )
end

def pt_300_contact_info
  @pt_300_contact_info ||= ContactInformation.new(
    pt_id: 300
  )
end

def pt_301_clinical_summary_1
  @pt_301_clinical_summary_1 ||= ClinicalSummary.new(
    locale: 'english'
  )
end

def pt_301_contact_info_1
  @pt_301_contact_info_1 ||= ContactInformation.new(
    pt_id: 301
  )
end

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= NurseTasks.new(pt_id: 301)
end

def pt_342_clinical_summary_1
  @pt_342_clinical_summary_1 ||= ClinicalSummary.new(locale: 'english')
end

def pt_342_notes
  @pt_342_notes ||= Summary::Notes.new(locale: 'english')
end

def pt_342_nurse_tasks_4
  @pt_342_nurse_tasks_4 ||= NurseTasks.new(pt_id: 342)
end

def pt_342_timeline_4
  @pt_342_timeline_4 ||= TimelinePage.new(locale: 'english')
end

def pt_343_nurse_tasks
  @pt_343_nurse_tasks ||= NurseTasks.new(pt_id: 343)
end

def pt_343_clinical_summary_2
  @pt_343_clinical_summary_2 ||= ClinicalSummary.new(
    locale: 'english'
  )
end

def patient_402
  @patient_402 ||= YourPatients.new(pt_id: 402)
end

def pt_403_tasks
  @pt_403_tasks ||= NurseTasks.new(pt_id: 403)
end

def pt_403_supervisor_contact
  @pt_403_supervisor_contact ||= Tasks::SupervisorContact.new(
    time_of_contact: now - (3 * one_hour)
  )
end

def pt_423_supervisor_contact
  @pt_423_supervisor_contact ||= Tasks::SupervisorContact.new(
    time_of_contact: now - (2 * one_hour)
  )
end

def pt_430_nurse_tasks_2
  @pt_430_nurse_tasks_2 ||= NurseTasks.new(pt_id: 430)
end

def pt_430_clinical_summary_2
  @pt_430_clinical_summary_2 ||= ClinicalSummary.new(
    note: 'Crazy supervisor notes'
  )
end

def nurse_400
  @nurse_400 ||= Supervisor::Nurses.new(id: 400)
end

def nurse_401
  @nurse_401 ||= Supervisor::Nurses.new(
    id: 401,
    num_participants: 41,
    num_tasks: 20,
    num_overdue: 10,
    supervision_date: 8.business_days.ago,
    supervision_time: today_at_11_am
  )
end

def nurse_402
  @nurse_402 ||= Supervisor::Nurses.new(
    id: 402,
    supervision_date: 12.business_days.ago,
    supervision_time: today_at_11_am
  )
end

def nurse_403
  @nurse_403 ||= Supervisor::Nurses.new(
    id: 403,
    supervision_date: today,
    supervision_time: now
  )
end

def nurse_404
  @nurse_404 ||= Supervisor::Nurses.new(
    id: 404,
    note: 'Supervision Note'
  )
end

def nurse_500
  @nurse_500 ||= Supervisor::Nurses.new(
    id: 500,
    locale: 'spanish',
    supervision_date: 8.business_days.ago,
    supervision_time: today_at_11_am
  )
end

def nurse_600
  @nurse_600 ||= Supervisor::Nurses.new(
    id: 600,
    locale: 'portuguese',
    supervision_date: 8.business_days.ago,
    supervision_time: today_at_11_am
  )
end

def pt_1000_nurse_tasks
  @pt_1000_nurse_tasks ||= NurseTasks.new(
    pt_id: 1000,
    tasks_count: 3
  )
end

def spanish_supervisor_1
  @spanish_supervisor_1 ||= SupervisorPage.new(locale: 'spanish')
end

def portuguese_supervisor_1
  @portuguese_supervisor_1 ||= SupervisorPage.new(locale: 'portuguese')
end
