# filename: ./spec/support/nurse/tasks/portuguese_translations_helper.rb

require './lib/pages/nurse_tasks'
Dir['./lib/pages/nurse_tasks/*.rb'].each { |file| require file }

def pt_601_nurse_tasks
  @pt_601_nurse_tasks ||= NurseTasks.new(
    pt_id: 601,
    locale: 'portuguese'
  )
end

def pt_602_nurse_tasks
  @pt_602_nurse_tasks ||= NurseTasks.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def portuguese_additional_contact
  @portuguese_additional_contact ||=
    NurseTasks::AdditionalContact.new(locale: 'portuguese')
end

def portuguese_confirmation_call
  @portuguese_confirmation_call ||=
    NurseTasks::ConfirmationCall.new(locale: 'portuguese')
end

def portuguese_initial_appointment
  @portuguese_initial_appointment ||=
    NurseTasks::InitialInPersonAppointment.new(
      locale: 'portuguese'
    )
end

def portuguese_follow_up_week_1
  @portuguese_follow_up_week_1 ||=
    NurseTasks::FollowUpCallWeekOne.new(locale: 'portuguese')
end

def portuguese_follow_up_week_3
  @portuguese_follow_up_week_3 ||=
    NurseTasks::FollowUpCallWeekThree.new(locale: 'portuguese')
end

def portuguese_call_to_schedule_final
  @portuguese_call_to_schedule_final ||=
    NurseTasks::CallToScheduleFinalAppointment.new(
      locale: 'portuguese'
    )
end

def portuguese_final_appointment
  @portuguese_final_appointment ||=
    NurseTasks::FinalAppointment.new(locale: 'portuguese')
end

def portuguese_lack_of_connectivity_call
  @portuguese_lack_of_connectivity_call ||=
    NurseTasks::LackOfConnectivityCall.new(locale: 'portuguese')
end

def portuguese_help_request
  @portuguese_help_request ||= NurseTasks::HelpRequest.new(
    locale: 'portuguese'
  )
end

def portuguese_non_adherence_call
  @portuguese_non_adherence_call ||=
    NurseTasks::NonAdherenceCall.new(locale: 'portuguese')
end

def portuguese_cancel_form
  @portuguese_cancel_form ||= NurseTasks::CancelForm.new(
    locale: 'portuguese'
  )
end

def portuguese_reschedule_form
  @portuguese_reschedule_form ||= NurseTasks::RescheduleForm.new(
    locale: 'portuguese'
  )
end
