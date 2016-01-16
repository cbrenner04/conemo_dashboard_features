# filename: ./spec/support/active_pt_helper.rb

# require page objects for use in ./spec/features/participants/active_spec.rb
require './lib/pages/active_participants'
require './lib/pages/active_participants/profile'
require './lib/pages/active_participants/nurse'
require './lib/pages/active_participants/notes'
require './lib/pages/active_participants/first_contact'
require './lib/pages/active_participants/first_appointment'
require './lib/pages/active_participants/second_contact'

# initialize page objects
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
