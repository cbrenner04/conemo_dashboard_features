# filename: ./spec/support/nurse/tasks_helper.rb

require './lib/pages/navigation'
require './lib/pages/your_patients/nurse_tasks'
Dir['./lib/pages/your_patients/nurse_tasks/*.rb'].each { |file| require file }

def navigation
  @navigation ||= Navigation.new
end

def confirmation_call
  @confirmation_call ||= YourPatients::NurseTasks::ConfirmationCall.new
end

def initial_in_person_appt
  @initial_in_person_appt ||=
    YourPatients::NurseTasks::InitialInPersonAppointment.new
end

def contact_information
  @contact_information ||= YourPatients::NurseTasks::ContactInformation.new
end

def clinical_summary
  @clinical_summary ||= YourPatients::NurseTasks::ClinicalSummary.new(id: 1)
end

def follow_up_week_1
  @follow_up_week_1 ||= YourPatients::NurseTasks::FollowUpCallWeekOne.new
end

def follow_up_week_3
  @follow_up_week_3 ||= YourPatients::NurseTasks::FollowUpCallWeekThree.new
end

def call_to_schedule_final_appointment
  @call_to_schedule_final_appointment ||=
    YourPatients::NurseTasks::CallToScheduleFinalAppointment.new
end

def final_appointment
  @final_appointment ||= YourPatients::NurseTasks::FinalAppointment.new
end

def pt_306_nurse_tasks
  @pt_306_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 306)
end

def pt_313_nurse_tasks
  @pt_313_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 313)
end

def pt_314_nurse_tasks
  @pt_314_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 314,
    session: 'first_appointment',
    session_length: 'asdf'
  )
end

def pt_315_nurse_tasks
  @pt_315_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 315)
end

def pt_316_nurse_tasks
  @pt_316_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 316,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_317_nurse_tasks
  @pt_317_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 317,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_318_nurse_tasks
  @pt_318_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 318,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_319_nurse_tasks
  @pt_319_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 319,
    session: 'first_appointment',
    session_length: '120'
  )
end

def pt_322_nurse_tasks
  @pt_322_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 322)
end

def pt_323_nurse_tasks
  @pt_323_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 323,
    session: 'second_contact',
    session_length: 'asdf'
  )
end

def pt_324_nurse_tasks
  @pt_324_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 324)
end

def pt_325_nurse_tasks
  @pt_325_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 325,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_326_nurse_tasks
  @pt_326_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 326,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_327_nurse_tasks
  @pt_327_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 327,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_328_nurse_tasks
  @pt_328_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 328,
    session: 'second_contact',
    session_length: '120'
  )
end

def pt_330_nurse_tasks
  @pt_330_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 330)
end

def pt_331_nurse_tasks
  @pt_331_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 331,
    session: 'third_contact',
    session_length: 'asdf'
  )
end

def pt_332_nurse_tasks
  @pt_332_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 332)
end

def pt_333_nurse_tasks
  @pt_333_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 333,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_334_nurse_tasks
  @pt_334_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 334,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_335_nurse_tasks
  @pt_335_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 335,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_336_nurse_tasks
  @pt_336_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 336,
    session: 'third_contact',
    session_length: '120'
  )
end

def pt_700_nurse_tasks
  @pt_700_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 700)
end

def pt_701_nurse_tasks
  @pt_701_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 701)
end

def pt_702_nurse_tasks
  @pt_702_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 702)
end

def pt_338_nurse_tasks
  @pt_338_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 338)
end

def pt_339_nurse_tasks
  @pt_339_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 339)
end

def pt_340_nurse_tasks
  @pt_340_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 340)
end

def pt_341_nurse_tasks
  @pt_341_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 341)
end
