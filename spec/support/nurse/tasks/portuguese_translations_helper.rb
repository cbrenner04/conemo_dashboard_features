# filename: ./spec/support/nurse/tasks/portuguese_translations_helper.rb

require './lib/pages/your_patients/nurse_tasks'
Dir['./lib/pages/your_patients/nurse_tasks/*.rb'].each { |file| require file }

def pt_601_nurse_tasks
  @pt_601_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 601,
    locale: 'portuguese'
  )
end

def pt_602_nurse_tasks
  @pt_602_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def portuguese_additional_contact
  @portuguese_additional_contact ||=
    YourPatients::NurseTasks::AdditionalContact.new(locale: 'portuguese')
end

def portuguese_confirmation_call
  @portuguese_confirmation_call ||=
    YourPatients::NurseTasks::ConfirmationCall.new(locale: 'portuguese')
end

def portuguese_initial_appointment
  @portuguese_initial_appointment ||=
    YourPatients::NurseTasks::InitialInPersonAppointment.new(
      locale: 'portuguese'
    )
end

def portuguese_follow_up_week_1
  @portuguese_follow_up_week_1 ||=
    YourPatients::NurseTasks::FollowUpCallWeekOne.new(locale: 'portuguese')
end

def portuguese_follow_up_week_3
  @portuguese_follow_up_week_3 ||=
    YourPatients::NurseTasks::FollowUpCallWeekThree.new(locale: 'portuguese')
end

def portuguese_call_to_schedule_final
  @portuguese_call_to_schedule_final ||=
    YourPatients::NurseTasks::CallToScheduleFinalAppointment.new(
      locale: 'portuguese'
    )
end

def portuguese_final_appointment
  @portuguese_final_appointment ||=
    YourPatients::NurseTasks::FinalAppointment.new(locale: 'portuguese')
end

def portuguese_lack_of_connectivity_call
  @portuguese_lack_of_connectivity_call ||=
    YourPatients::NurseTasks::LackOfConnectivityCall.new(locale: 'portuguese')
end

def portuguese_help_request
  @portuguese_help_request ||= YourPatients::NurseTasks::HelpRequest.new(
    locale: 'portuguese'
  )
end

def portuguese_non_adherence_call
  @portuguese_non_adherence_call ||=
    YourPatients::NurseTasks::NonAdherenceCall.new(locale: 'portuguese')
end

def portuguese_cancel_form
  @portuguese_cancel_form ||= YourPatients::NurseTasks::CancelForm.new(
    locale: 'portuguese'
  )
end

def portuguese_reschedule_form
  @portuguese_reschedule_form ||= YourPatients::NurseTasks::RescheduleForm.new(
    locale: 'portuguese'
  )
end
