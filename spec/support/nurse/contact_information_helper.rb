# filename: ./spec/support/nurse/contact_information_helper.rb

require './lib/pages/navigation'
require './lib/pages/your_patients'
require './lib/pages/nurse_tasks'
Dir['./lib/pages/nurse_tasks/**/*.rb'].each { |file| require file }

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def your_patients
  @your_patients ||= YourPatients.new(locale: 'english')
end

def confirmation_call
  @confirmation_call ||= NurseTasks::ConfirmationCall.new(
    locale: 'english'
  )
end

def initial_appointment
  @initial_appointment ||=
    NurseTasks::InitialInPersonAppointment.new(locale: 'english')
end

def follow_up_week_1
  @follow_up_week_1 ||= NurseTasks::FollowUpCallWeekOne.new(
    locale: 'english'
  )
end

def follow_up_week_3
  @follow_up_week_3 ||= NurseTasks::FollowUpCallWeekThree.new(
    locale: 'english'
  )
end

def call_to_schedule_final_appointment
  @call_to_schedule_final_appointment ||=
    NurseTasks::CallToScheduleFinalAppointment.new(
      locale: 'english'
    )
end

def final_appointment
  @final_appointment ||= NurseTasks::FinalAppointment.new(
    locale: 'english'
  )
end

def pt_300_contact_info
  @pt_300_contact_info ||= NurseTasks::ContactInformation.new(
    id: 300
  )
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= NurseTasks.new(pt_id: 300)
end

def pt_300_clinical_summary_1
  @pt_300_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(id: 300)
end

def pt_301_contact_info
  @pt_301_contact_info ||= NurseTasks::ContactInformation.new(
    id: 301,
    email: 'participant301@example.com'
  )
end

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= NurseTasks.new(pt_id: 301)
end

def pt_301_clinical_summary
  @pt_301_clinical_summary ||= NurseTasks::ClinicalSummary.new(id: 301)
end

def pt_310_contact_info
  @pt_310_contact_info ||= NurseTasks::ContactInformation.new(
    id: 310
  )
end

def pt_310_nurse_tasks
  @pt_310_nurse_tasks ||= NurseTasks.new(pt_id: 310)
end

def pt_310_clinical_summary
  @pt_310_clinical_summary ||= NurseTasks::ClinicalSummary.new(id: 310)
end

def pt_302_contact_info
  @pt_302_contact_info ||= NurseTasks::ContactInformation.new(
    id: 302
  )
end

def pt_302_nurse_tasks
  @pt_302_nurse_tasks ||= NurseTasks.new(pt_id: 302)
end

def pt_302_clinical_summary
  @pt_302_clinical_summary ||= NurseTasks::ClinicalSummary.new(id: 302)
end

def pt_342_contact_info_1
  @pt_342_contact_info_1 ||= NurseTasks::ContactInformation.new(
    id: 342,
    session: 'Initial in person appointment',
    session_length: 60
  )
end

def pt_342_nurse_tasks_1
  @pt_342_nurse_tasks_1 ||= NurseTasks.new(
    pt_id: 342,
    session: 'first_appointment',
    session_length: 60
  )
end

def pt_342_clinical_summary
  @pt_342_clinical_summary ||= NurseTasks::ClinicalSummary.new(id: 342)
end

def pt_342_contact_info_2
  @pt_342_contact_info_2 ||= NurseTasks::ContactInformation.new(
    id: 342,
    session: 'Follow up call week 1',
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

def pt_342_contact_info_3
  @pt_342_contact_info_3 ||= NurseTasks::ContactInformation.new(
    id: 342,
    session: 'Follow up call week 3',
    session_length: 120
  )
end

def pt_342_nurse_tasks_3
  @pt_342_nurse_tasks_3 ||= NurseTasks.new(
    pt_id: 342,
    session: 'third_contact',
    session_length: 120
  )
end

def pt_343_nurse_tasks
  @pt_343_nurse_tasks ||= NurseTasks.new(pt_id: 343)
end

def pt_343_contact_info
  @pt_343_contact_info ||= NurseTasks::ContactInformation.new(
    id: 343,
    session: 'Call to schedule final in person appointment'
  )
end

def pt_343_clinical_summary_1
  @pt_343_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(id: 343)
end

def pt_500_nurse_tasks
  @pt_500_nurse_tasks ||= NurseTasks.new(pt_id: 500)
end

def pt_500_contact_info
  @pt_500_contact_info ||= NurseTasks::ContactInformation.new(
    id: 500,
    locale: 'spanish'
  )
end

def pt_500_clinical_summary_1
  @pt_500_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(
    locale: 'spanish',
    id: 500)
end

def pt_600_nurse_tasks
  @pt_600_nurse_tasks ||= NurseTasks.new(pt_id: 600)
end

def pt_600_contact_info
  @pt_600_contact_info ||= NurseTasks::ContactInformation.new(
    id: 600,
    locale: 'portuguese'
  )
end

def pt_600_clinical_summary_1
  @pt_600_clinical_summary_1 ||= NurseTasks::ClinicalSummary.new(
    locale: 'portuguese',
    id: 600)
end
