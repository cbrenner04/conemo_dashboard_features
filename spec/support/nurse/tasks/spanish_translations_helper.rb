# filename: ./spec/support/nurse/tasks/spanish_translations_helper.rb

require './lib/pages/nurse_tasks'
Dir['./lib/pages/nurse_tasks/*.rb'].each { |file| require file }
require './lib/pages/supervisor_page/nurses'

def pt_501_nurse_tasks
  @pt_501_nurse_tasks ||= NurseTasks.new(
    pt_id: 501,
    locale: 'spanish'
  )
end

def pt_502_nurse_tasks
  @pt_502_nurse_tasks ||= NurseTasks.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def nurse_500
  @nurse_500 ||= SupervisorPage::Nurses.new(
    id: 500,
    locale: 'spanish'
  )
end

def spanish_additional_contact
  @spanish_additional_contact ||=
    NurseTasks::AdditionalContact.new(
      locale: 'spanish'
    )
end

def spanish_confirmation_call
  @spanish_confirmation_call ||= NurseTasks::ConfirmationCall.new(
    locale: 'spanish'
  )
end

def spanish_initial_appointment
  @spanish_initial_appointment ||=
    NurseTasks::InitialInPersonAppointment.new(locale: 'spanish')
end

def spanish_follow_up_week_1
  @spanish_follow_up_week_1 ||=
    NurseTasks::FollowUpCallWeekOne.new(locale: 'spanish')
end

def spanish_follow_up_week_3
  @spanish_follow_up_week_3 ||=
    NurseTasks::FollowUpCallWeekThree.new(locale: 'spanish')
end

def spanish_call_to_schedule_final
  @spanish_call_to_schedule_final ||=
    NurseTasks::CallToScheduleFinalAppointment.new(locale: 'spanish')
end

def spanish_final_appointment
  @spanish_final_appointment ||= NurseTasks::FinalAppointment.new(
    locale: 'spanish'
  )
end

def spanish_lack_of_connectivity_call
  @spanish_lack_of_connectivity_call ||=
    NurseTasks::LackOfConnectivityCall.new(locale: 'spanish')
end

def spanish_help_request
  @spanish_help_request ||= NurseTasks::HelpRequest.new(locale: 'spanish')
end

def spanish_non_adherence_call
  @spanish_non_adherence_call ||=
    NurseTasks::NonAdherenceCall.new(locale: 'spanish')
end

def spanish_cancel_form
  @spanish_cancel_form ||= NurseTasks::CancelForm.new(locale: 'spanish')
end

def spanish_reschedule_form
  @spanish_reschedule_form ||= NurseTasks::RescheduleForm.new(
    locale: 'spanish'
  )
end
