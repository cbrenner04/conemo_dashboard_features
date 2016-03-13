# filename: ./spec/support/nurse/contact_information_helper.rb

require './lib/pages/navigation'
require './lib/pages/your_patients'
Dir['./lib/pages/your_patients/**/*.rb'].each { |file| require file }

def navigation
  @navigation ||= Navigation.new
end

def your_patients
  @your_patients ||= YourPatients.new
end

def confirmation_call
  @confirmation_call ||= YourPatients::NurseTasks::ConfirmationCall.new
end

def initial_appointment
  @initial_appointment ||=
    YourPatients::NurseTasks::InitialInPersonAppointment.new
end

def call_to_schedule_final_appointment
  @call_to_schedule_final_appointment ||=
    YourPatients::NurseTasks::CallToScheduleFinalAppointment.new
end

def final_appointment
  @final_appointment ||= YourPatients::NurseTasks::FinalAppointment.new
end

def pt_300_contact_info
  @pt_300_contact_info ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 300
  )
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 300)
end

def pt_301_contact_info
  @pt_301_contact_info ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 301,
    email: 'participant301@example.com'
  )
end

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 301)
end

def pt_310_contact_info
  @pt_310_contact_info ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 310
  )
end

def pt_310_nurse_tasks
  @pt_310_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 310)
end

def pt_302_contact_info
  @pt_302_contact_info ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 302
  )
end

def pt_302_nurse_tasks
  @pt_302_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 302)
end

def pt_342_contact_info_1
  @pt_342_contact_info_1 ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 342,
    session: 'Initial in person appointment',
    session_length: 60
  )
end

def pt_342_nurse_tasks_1
  @pt_342_nurse_tasks_1 ||= YourPatients::NurseTasks.new(
    pt_id: 342,
    session: 'first_appointment',
    session_length: 60
  )
end

def pt_342_contact_info_2
  @pt_342_contact_info_2 ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 342,
    session: 'Follow up call week 1',
    session_length: 60
  )
end

def pt_342_nurse_tasks_2
  @pt_342_nurse_tasks_2 ||= YourPatients::NurseTasks.new(
    pt_id: 342,
    session: 'second_contact',
    session_length: 60
  )
end

def pt_342_contact_info_3
  @pt_342_contact_info_3 ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 342,
    session: 'Follow up call week 3',
    session_length: 120
  )
end

def pt_342_nurse_tasks_3
  @pt_342_nurse_tasks_3 ||= YourPatients::NurseTasks.new(
    pt_id: 342,
    session: 'third_contact',
    session_length: 120
  )
end

def pt_343_nurse_tasks
  @pt_343_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 343)
end

def pt_343_contact_info
  @pt_343_contact_info ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 343,
    session: 'Call to schedule final appointment'
  )
end
