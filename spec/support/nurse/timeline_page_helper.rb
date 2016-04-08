# filename: ./spec/support/nurse/timeline_page_helper.rb

require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
Dir['./lib/pages/nurse_tasks/**/*.rb'].each { |file| require file }

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def confirmation_call
  @confirmation_call ||= NurseTasks::ConfirmationCall.new(locale: 'english')
end

def initial_appointment
  @initial_appointment ||=
    NurseTasks::InitialInPersonAppointment.new(locale: 'english')
end

def follow_up_week_1
  @follow_up_week_1 ||= NurseTasks::FollowUpCallWeekOne.new(locale: 'english')
end

def follow_up_week_3
  @follow_up_week_3 ||= NurseTasks::FollowUpCallWeekThree.new(
    locale: 'english'
  )
end

def call_to_schedule_final_appointment
  @call_to_schedule_final_appointment ||=
    NurseTasks::CallToScheduleFinalAppointment.new(locale: 'english')
end

def final_appointment
  @final_appointment ||= NurseTasks::FinalAppointment.new(locale: 'english')
end

def pt_300_timeline
  @pt_300_timeline ||= NurseTasks::TimelinePage.new(id: 300)
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= NurseTasks.new(pt_id: 300)
end

def pt_300_clinical_summary_1
  @pt_300_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(id: 300)
end

def pt_342_clinical_summary
  @pt_342_clinical_summary ||= NurseTasks::ClinicalSummary.new(id: 342)
end

def pt_342_timeline_1
  @pt_342_timeline_1 ||= NurseTasks::TimelinePage.new(
    id: 342,
    session: 'Initial in person appointment',
    session_length: 60
  )
end

def pt_342_timeline_2
  @pt_342_timeline_2 ||= NurseTasks::TimelinePage.new(
    id: 342,
    session: 'Follow up call week 1',
    session_length: 60
  )
end

def pt_342_timeline_3
  @pt_342_timeline_3 ||= NurseTasks::TimelinePage.new(
    id: 342,
    session: 'Follow up call week 3',
    session_length: 120
  )
end

def pt_342_nurse_tasks_1
  @pt_342_nurse_tasks_1 ||= NurseTasks.new(
    pt_id: 342,
    session: 'first_appointment',
    session_length: 60
  )
end

def pt_342_nurse_tasks_2
  @pt_342_nurse_tasks_2 ||= NurseTasks.new(
    pt_id: 342,
    session: 'second_contact',
    session_length: 60
  )
end

def pt_342_nurse_tasks_3
  @pt_342_nurse_tasks_3 ||= NurseTasks.new(
    pt_id: 342,
    session: 'third_contact',
    session_length: 120
  )
end

def pt_343_clinical_summary_1
  @pt_343_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(id: 343)
end

def pt_343_timeline
  @pt_343_timeline ||= NurseTasks::TimelinePage.new(
    id: 343,
    session: 'Call to schedule final in person appointment'
  )
end

def pt_343_nurse_tasks
  @pt_343_nurse_tasks ||= NurseTasks.new(pt_id: 343)
end

def pt_500_clinical_summary_1
  @pt_500_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(
    locale: 'spanish',
    id: 500)
end

def pt_500_timeline
  @pt_500_timeline ||= NurseTasks::TimelinePage.new(
    id: 500,
    locale: 'spanish'
  )
end

def pt_500_nurse_tasks
  @pt_500_nurse_tasks ||= NurseTasks.new(pt_id: 500)
end

def pt_600_clinical_summary_1
  @pt_600_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(
    locale: 'portuguese',
    id: 600)
end

def pt_600_timeline
  @pt_600_timeline ||= NurseTasks::TimelinePage.new(
    id: 600,
    locale: 'portuguese'
  )
end

def pt_600_nurse_tasks
  @pt_600_nurse_tasks ||= NurseTasks.new(pt_id: 600)
end
