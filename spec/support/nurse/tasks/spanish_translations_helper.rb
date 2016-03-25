# filename: ./spec/support/nurse/tasks/spanish_translations_helper.rb

require './lib/pages/your_patients/nurse_tasks'
Dir['./lib/pages/your_patients/nurse_tasks/*.rb'].each { |file| require file }

def pt_501_nurse_tasks
  @pt_501_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 501,
    locale: 'spanish'
  )
end

def pt_502_nurse_tasks
  @pt_502_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def spanish_additional_contact
  @spanish_additional_contact ||=
    YourPatients::NurseTasks::AdditionalContact.new(
      locale: 'spanish'
    )
end

def spanish_confirmation_call
  @spanish_confirmation_call ||= YourPatients::NurseTasks::ConfirmationCall.new(
    locale: 'spanish'
  )
end

def spanish_initial_appointment
  @spanish_initial_appointment ||=
    YourPatients::NurseTasks::InitialInPersonAppointment.new(locale: 'spanish')
end

def spanish_follow_up_week_1
  @spanish_follow_up_week_1 ||=
    YourPatients::NurseTasks::FollowUpCallWeekOne.new(locale: 'spanish')
end

def spanish_follow_up_week_3
  @spanish_follow_up_week_3 ||=
    YourPatients::NurseTasks::FollowUpCallWeekThree.new(locale: 'spanish')
end

def spanish_call_to_schedule_final
  @spanish_call_to_schedule_final ||=
    YourPatients::NurseTasks::CallToScheduleFinalAppointment.new(
      locale: 'spanish'
    )
end

def spanish_final_appointment
  @spanish_final_appointment ||= YourPatients::NurseTasks::FinalAppointment.new(
    locale: 'spanish'
  )
end

def spanish_lack_of_connectivity_call
  @spanish_lack_of_connectivity_call ||=
    YourPatients::NurseTasks::LackOfConnectivityCall.new(locale: 'spanish')
end

def spanish_help_request
  @spanish_help_request ||= YourPatients::NurseTasks::HelpRequest.new(
    locale: 'spanish'
  )
end

def spanish_non_adherence_call
  @spanish_non_adherence_call ||=
    YourPatients::NurseTasks::NonAdherenceCall.new(locale: 'spanish')
end

def spanish_cancel_form
  @spanish_cancel_form ||= YourPatients::NurseTasks::CancelForm.new(
    locale: 'spanish'
  )
end

def spanish_reschedule_form
  @spanish_reschedule_form ||= YourPatients::NurseTasks::RescheduleForm.new(
    locale: 'spanish'
  )
end
