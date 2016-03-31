# filename: ./spec/support/nurse_supervisor/nurse_helper.rb

require 'business_time'
require './lib/pages/navigation'
require './lib/pages/your_patients'
require './lib/pages/supervisor_page'
require './lib/pages/supervisor_page/nurses'
require './lib/pages/nurse_tasks'
require './lib/pages/nurse_tasks/clinical_summary'

def today_at_11_am
  time = Time.now
  time += ((12 - time.hour) * 60 * 60)
  time -= (time.min * 60)
  time -= time.sec
  @today_at_11_am ||= time - (1 * 60 * 60)
end

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def your_patients
  @your_patients ||= YourPatients.new(locale: 'english')
end

def nurse_supervisor
  @nurse_supervisor ||= SupervisorPage.new(pt_id: 'fake')
end

def nurse_400
  @nurse_400 ||= SupervisorPage::Nurses.new(id: 400)
end

def nurse_401
  @nurse_401 ||= SupervisorPage::Nurses.new(
    id: 401,
    num_participants: 41,
    num_tasks: 20,
    num_overdue: 10,
    supervision_date: 8.business_days.ago,
    supervision_time: today_at_11_am
  )
end

def nurse_402
  @nurse_402 ||= SupervisorPage::Nurses.new(
    id: 402,
    supervision_date: 12.business_days.ago,
    supervision_time: today_at_11_am
  )
end

def nurse_403
  @nurse_403 ||= SupervisorPage::Nurses.new(
    id: 403,
    supervision_date: Date.today,
    supervision_time: Time.now
  )
end

def nurse_404
  @nurse_404 ||= SupervisorPage::Nurses.new(id: 404)
end

def pt_343_nurse_tasks
  @pt_343_nurse_tasks ||= NurseTasks.new(pt_id: 343)
end

def pt_343_clinical_summary
  @pt_343_clinical_summary ||= NurseTasks::ClinicalSummary.new(
    locale: 'english'
  )
end

def pt_342_nurse_tasks
  @pt_342_nurse_tasks ||= NurseTasks.new(pt_id: 342)
end

def pt_342_clinical_summary
  @pt_342_clinical_summary ||= NurseTasks::ClinicalSummary.new(
    locale: 'english'
  )
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= NurseTasks.new(pt_id: 300)
end

def pt_300_clinical_summary
  @pt_300_clinical_summary ||= NurseTasks::ClinicalSummary.new(
    locale: 'english'
  )
end

def pt_300_contact_info
  @pt_300_contact_info ||= NurseTasks::ContactInformation.new(
    id: 300
  )
end

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= NurseTasks.new(pt_id: 301)
end

def pt_301_clinical_summary
  @pt_301_clinical_summary ||= NurseTasks::ClinicalSummary.new(
    locale: 'english'
  )
end

def pt_301_contact_info
  @pt_301_contact_info ||= NurseTasks::ContactInformation.new(
    id: 301
  )
end
