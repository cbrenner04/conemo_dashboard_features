# filename: ./spec/support/admin/pending_participants_helper.rb

require './lib/pages/navigation'
require './lib/pages/contact_information'
require './lib/pages/pending_participants'

def pending_participants
  @pending_participants ||= PendingParticipants.new(name: 'fake')
end

def navigation
  @navigation ||= Navigation.new
end

def contact_information
  @contact_information ||= ContactInformation.new(first_name: 'fake')
end

def new_participant_contact_information
  @new_participan_contact_informationt ||= ContactInformation.new(
    first_name: 'Jane',
    last_name: 'Doe',
    id: '123',
    unit: 'Some Healthy Place',
    family_record: '1234',
    phone: '12345678910',
    emergency_contact_name: 'Papa Joe',
    emergency_contact_phone: '12345678901',
    email: 'jan.doe@example.com',
    address: "100 Fake Ln\nSome City, USA, 12345",
    enrollment_date: Date.today - 1,
    gender: 'female'
  )
end

def jane_doe
  @jane_doe ||= PendingParticipants.new(
    name: "Doe, Jane 123 #{(Date.today - 1).strftime('%B %d, %Y')}"
  )
end

def participant_100
  @participant_100 ||= PendingParticipants.new(name: 'Last-100, First')
end

def participant_101
  @participant_101 ||= PendingParticipants.new(name: 'Last-101, First')
end

def participant_102
  @participant_102 ||= PendingParticipants.new(name: 'Last-102, First')
end

def participant_200
  @participant_200 ||= PendingParticipants.new(name: 'Last-200, First')
end

def participant_201
  @participant_201 ||= PendingParticipants.new(name: 'Last-201, First')
end
