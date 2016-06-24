# frozen_string_literal: true
# filename: ./spec/support/nurse/tasks/portuguese_translations_helper.rb

require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
require './lib/pages/supervisor/nurses'
Dir['./lib/pages/tasks/*.rb'].each { |file| require file }

def portuguese_navigation
  @portuguese_navigation ||= Navigation.new(locale: 'portuguese')
end

def pt_601_nurse_tasks
  @pt_601_nurse_tasks ||= NurseTasks.new(
    pt_id: 601,
    locale: 'portuguese'
  )
end

def pt_601_supervisor_contact
  @pt_601_supervisor_contact ||=
    Tasks::SupervisorContact.new(locale: 'portuguese')
end

def pt_602_nurse_tasks
  @pt_602_nurse_tasks ||= NurseTasks.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def pt_617_nurse_tasks
  @pt_617_nurse_tasks ||= NurseTasks.new(
    pt_id: 617,
    locale: 'portuguese'
  )
end

def nurse_600
  @nurse_600 ||= Supervisor::Nurses.new(
    id: 600,
    locale: 'portuguese'
  )
end

def portuguese_additional_contact
  @portuguese_additional_contact ||=
    Tasks::AdditionalContact.new(locale: 'portuguese')
end

def portuguese_confirmation_call
  @portuguese_confirmation_call ||=
    Tasks::ConfirmationCall.new(locale: 'portuguese')
end

def portuguese_initial_appointment
  @portuguese_initial_appointment ||=
    Tasks::InitialInPersonAppointment.new(locale: 'portuguese')
end

def portuguese_follow_up_week_1
  @portuguese_follow_up_week_1 ||=
    Tasks::FollowUpCallWeekOne.new(locale: 'portuguese')
end

def portuguese_follow_up_week_3
  @portuguese_follow_up_week_3 ||=
    Tasks::FollowUpCallWeekThree.new(locale: 'portuguese')
end

def portuguese_call_to_schedule_final
  @portuguese_call_to_schedule_final ||=
    Tasks::CallToScheduleFinalAppointment.new(locale: 'portuguese')
end

def portuguese_final_appointment
  @portuguese_final_appointment ||=
    Tasks::FinalAppointment.new(locale: 'portuguese')
end

def portuguese_lack_of_connectivity_call
  @portuguese_lack_of_connectivity_call ||=
    Tasks::LackOfConnectivityCall.new(locale: 'portuguese')
end

def portuguese_help_request
  @portuguese_help_request ||= Tasks::HelpRequest.new(
    locale: 'portuguese'
  )
end

def portuguese_non_adherence_call
  @portuguese_non_adherence_call ||=
    Tasks::NonAdherenceCall.new(locale: 'portuguese')
end

def portuguese_cancel_form
  @portuguese_cancel_form ||= Tasks::CancelForm.new(
    locale: 'portuguese'
  )
end

def portuguese_reschedule_form
  @portuguese_reschedule_form ||= Tasks::RescheduleForm.new(
    locale: 'portuguese'
  )
end
