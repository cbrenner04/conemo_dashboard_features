# filename: ./spec/support/nurse/tasks_helper.rb

require './lib/pages/navigation'
Dir['./lib/pages/nurse_tasks/*.rb'].each { |file| require file }
require './lib/pages/supervisor_page'
require './lib/pages/nurse_tasks'
require './lib/pages/your_patients'

def cancel_form
  @cancel_form ||= NurseTasks::CancelForm.new(locale: 'english')
end

def clinical_summary
  @clinical_summary ||= NurseTasks::ClinicalSummary.new(id: 1)
end

def contact_information
  @contact_information ||= NurseTasks::ContactInformation.new(id: 'fake')
end

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def reschedule_form
  @reschedule_form ||= NurseTasks::RescheduleForm.new(locale: 'english')
end

def your_patients
  @your_patients ||= YourPatients.new(pt_id: 'fake')
end

def confirmation_call
  @confirmation_call ||= NurseTasks::ConfirmationCall.new(locale: 'english')
end

def initial_in_person_appt
  @initial_in_person_appt ||=
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

def additional_contact
  @additional_contact ||= NurseTasks::AdditionalContact.new(locale: 'english')
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= NurseTasks.new(pt_id: 300)
end

def pt_313_nurse_tasks
  @pt_313_nurse_tasks ||= NurseTasks.new(pt_id: 313)
end

def pt_320_nurse_tasks
  @pt_320_nurse_tasks ||= NurseTasks.new(pt_id: 320)
end

def pt_451_nurse_tasks
  @pt_451_nurse_tasks ||= NurseTasks.new(pt_id: 451)
end

def pt_1000_nurse_tasks
  @pt_1000_nurse_tasks ||= NurseTasks.new(
    pt_id: 1000,
    tasks_count: 3
  )
end
