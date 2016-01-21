# filename: ./spec/support/active_pt_helper.rb

# require page objects for use in ./spec/features/participants/active_spec.rb
Dir['./lib/pages/active_participants/*.rb'].each { |file| require file }

# instantiate page objects
def active_participants
  @active_participants ||= ActiveParticipants.new
end

def profile
  @profile ||= ActiveParticipants::Profile.new
end

def nurse
  @nurse ||= ActiveParticipants::Nurse.new
end

def notes
  @notes ||= ActiveParticipants::Notes.new
end

def first_contact
  @first_contact ||= ActiveParticipants::FirstContact.new
end

def first_appointment
  @first_contact ||= ActiveParticipants::FirstAppointment.new
end

def second_contact
  @second_contact ||= ActiveParticipants::SecondContact.new
end

def third_contact
  @third_contact ||= ActiveParticipants::ThirdContact.new
end

def final_appointment
  @final_appointment ||= ActiveParticipants::FinalAppointment.new
end

def reports
  @reports ||= ActiveParticipants::Reports.new
end
