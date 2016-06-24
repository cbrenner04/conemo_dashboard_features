# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/spanish_translations_helper.rb

require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
require './lib/pages/supervisor/nurses'
Dir['./lib/pages/tasks/*.rb'].each { |file| require file }

def spanish_navigation
  @spanish_navigation ||= Navigation.new(locale: 'spanish')
end

def pt_501_nurse_tasks
  @pt_501_nurse_tasks ||= NurseTasks.new(
    pt_id: 501,
    locale: 'spanish'
  )
end

def pt_501_supervisor_contact
  @pt_501_supervisor_contact ||= Tasks::SupervisorContact.new(
    locale: 'spanish'
  )
end

def pt_502_nurse_tasks
  @pt_502_nurse_tasks ||= NurseTasks.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def pt_517_nurse_tasks
  @pt_517_nurse_tasks ||= NurseTasks.new(
    pt_id: 517,
    locale: 'spanish'
  )
end

def nurse_500
  @nurse_500 ||= Supervisor::Nurses.new(
    id: 500,
    locale: 'spanish'
  )
end

def spanish_additional_contact
  @spanish_additional_contact ||=
    Tasks::AdditionalContact.new(
      locale: 'spanish'
    )
end

def spanish_confirmation_call
  @spanish_confirmation_call ||= Tasks::ConfirmationCall.new(
    locale: 'spanish'
  )
end

def spanish_initial_appointment
  @spanish_initial_appointment ||=
    Tasks::InitialInPersonAppointment.new(locale: 'spanish')
end

def spanish_follow_up_week_1
  @spanish_follow_up_week_1 ||=
    Tasks::FollowUpCallWeekOne.new(locale: 'spanish')
end

def spanish_follow_up_week_3
  @spanish_follow_up_week_3 ||=
    Tasks::FollowUpCallWeekThree.new(locale: 'spanish')
end

def spanish_call_to_schedule_final
  @spanish_call_to_schedule_final ||=
    Tasks::CallToScheduleFinalAppointment.new(locale: 'spanish')
end

def spanish_final_appointment
  @spanish_final_appointment ||= Tasks::FinalAppointment.new(
    locale: 'spanish'
  )
end

def spanish_lack_of_connectivity_call
  @spanish_lack_of_connectivity_call ||=
    Tasks::LackOfConnectivityCall.new(locale: 'spanish')
end

def spanish_help_request
  @spanish_help_request ||= Tasks::HelpRequest.new(locale: 'spanish')
end

def spanish_non_adherence_call
  @spanish_non_adherence_call ||=
    Tasks::NonAdherenceCall.new(locale: 'spanish')
end

def spanish_cancel_form
  @spanish_cancel_form ||= Tasks::CancelForm.new(locale: 'spanish')
end

def spanish_reschedule_form
  @spanish_reschedule_form ||= Tasks::RescheduleForm.new(
    locale: 'spanish'
  )
end
