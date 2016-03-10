# filename: ./spec/support/nurse/tasks_helper.rb

require './lib/pages/navigation'
require './lib/pages/your_patients'
require './lib/pages/your_patients/nurse_tasks'
Dir['./lib/pages/your_patients/nurse_tasks/*.rb'].each { |file| require file }

def navigation
  @navigation ||= Navigation.new
end

def confirmation_call
  @confirmation_call ||= YourPatients::NurseTasks::ConfirmationCall.new
end

def help_request
  @help_request ||= YourPatients::NurseTasks::HelpRequest.new
end

def lack_of_connectivity_call
  @lack_of_connectivity_call ||=
    YourPatients::NurseTasks::LackOfConnectivityCall.new
end

def non_adherence_call
  @non_adherence_call ||= YourPatients::NurseTasks::NonAdherenceCall.new
end

def initial_in_person_appt
  @initial_in_person_appt ||=
    YourPatients::NurseTasks::InitialInPersonAppointment.new
end

def contact_information
  @contact_information ||= YourPatients::NurseTasks::ContactInformation.new(
    id: 'fake'
  )
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

def additional_contact
  @additional_contact ||= YourPatients::NurseTasks::AdditionalContact.new
end

def pt_451_nurse_tasks
  @pt_451_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 451)
end

def pt_802_nurse_tasks
  @pt_802_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 802,
    days_since_due: '3 days',
    contact_type: 'Help request'
  )
end

def pt_400_nurse_tasks
  @pt_400_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 400)
end

def pt_401_nurse_tasks
  @pt_401_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 401)
end

def pt_402_nurse_tasks
  @pt_402_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 402,
    time_of_contact: Time.now - (3 * 60 * 60)
  )
end

def pt_403_nurse_tasks
  @pt_403_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 403,
    time_of_contact: Time.now - (3 * 60 * 60)
  )
end

def pt_803_nurse_tasks
  @pt_803_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 803,
    contact_type: 'Lack of connectivity call',
    days_since_due: '3 days'
  )
end

def pt_410_nurse_tasks
  @pt_410_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 410)
end

def pt_411_nurse_tasks
  @pt_411_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 411)
end

def pt_412_nurse_tasks
  @pt_412_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 412,
    time_of_contact: Time.now - (2 * 60 * 60)
  )
end

def pt_413_nurse_tasks
  @pt_413_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 413,
    time_of_contact: Time.now - (2 * 60 * 60)
  )
end

def pt_426_nurse_tasks
  @pt_426_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 426)
end

def pt_427_nurse_tasks
  @pt_427_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 427)
end

def pt_320_nurse_tasks
  @pt_320_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 320)
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 300)
end

def pt_804_nurse_tasks
  @pt_804_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 804,
    contact_type: 'Non adherence call',
    days_since_due: '3 days'
  )
end

def pt_420_nurse_tasks
  @pt_420_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 420)
end

def pt_421_nurse_tasks
  @pt_421_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 421)
end

def pt_422_nurse_tasks
  @pt_422_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 422,
    time_of_contact: Time.now - (2 * 60 * 60)
  )
end

def pt_423_nurse_tasks
  @pt_423_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 423,
    time_of_contact: Time.now - (2 * 60 * 60)
  )
end

def pt_706_nurse_tasks
  @pt_706_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 706,
    contact_type: 'Confirmation call',
    days_since_due: 'about 2 months'
  )
end

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 301)
end

def pt_303_nurse_tasks
  @pt_303_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 303)
end

def pt_304_nurse_tasks
  @pt_304_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 304)
end

def pt_306_nurse_tasks
  @pt_306_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 306)
end

def patient_306
  @patient_306 ||= YourPatients.new(pt_id: 306)
end

def pt_707_nurse_tasks
  @pt_707_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 707,
    contact_type: 'Initial in person appointment',
    days_since_due: 'about 1 month'
  )
end

def pt_311_nurse_tasks
  @pt_311_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 311)
end

def pt_317_nurse_tasks
  @pt_317_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 317)
end

def pt_318_nurse_tasks
  @pt_318_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 318)
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

def pt_319_nurse_tasks
  @pt_319_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 319,
    session: 'first_appointment',
    session_length: '120'
  )
end

def patient_319
  @patient_319 ||= YourPatients.new(pt_id: 319)
end

def pt_708_nurse_tasks
  @pt_708_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 708,
    contact_type: 'Follow up call week one',
    days_since_due: 'about 1 month'
  )
end

def pt_321_nurse_tasks
  @pt_321_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 321)
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
  @pt_324_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 324,
    session: 'second_contact',
    session_length: '120'
  )
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

def patient_328
  @patient_328 ||= YourPatients.new(pt_id: 328)
end

def pt_709_nurse_tasks
  @pt_709_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 709,
    contact_type: 'Follow up call week three',
    days_since_due: '14 days'
  )
end

def pt_329_nurse_tasks
  @pt_329_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 329)
end

def pt_333_nurse_tasks
  @pt_333_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 333)
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

def patient_336
  @patient_336 ||= YourPatients.new(pt_id: 336)
end

def pt_800_nurse_tasks
  @pt_800_nurse_tasks ||= YourPatients::NurseTasks.new(
    pt_id: 800,
    contact_type: 'Call to schedule final appointment',
    days_since_due: '4 days'
  )
end

def pt_704_nurse_tasks
  @pt_704_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 704)
end

def pt_705_nurse_tasks
  @pt_705_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 705)
end

def pt_337_nurse_tasks
  @pt_337_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 337)
end

def pt_345_nurse_tasks
  @pt_345_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 345)
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

def patient_702
  @patient_702 ||= YourPatients.new(pt_id: 702)
end

def pt_801_nurse_tasks
  @pt_801_nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 801)
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

def your_patients
  @your_patients ||= YourPatients.new(pt_id: 'fake')
end

def patient_341
  @patient_341 ||= YourPatients.new(pt_id: 341)
end
