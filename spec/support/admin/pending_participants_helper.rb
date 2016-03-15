# filename: ./spec/support/admin/pending_participants_helper.rb

require './lib/pages/navigation'
require './lib/pages/pending_participants/contact_information'
require './lib/pages/pending_participants'
require './lib/pages/your_patients'

def pending_participants
  @pending_participants ||= PendingParticipants.new(locale: 'english')
end

def spanish_pending_participants
  @spanish_pending_participants ||= PendingParticipants.new(locale: 'spanish')
end

def portuguese_pending_participants
  @portuguese_pending_participants ||= PendingParticipants.new(
    locale: 'portuguese'
  )
end

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def spanish_navigation
  @spanish_navigation ||= Navigation.new(locale: 'spanish')
end

def portuguese_navigation
  @portuguese_navigation ||= Navigation.new(locale: 'portuguese')
end

def contact_information
  @contact_information ||= PendingParticipants::ContactInformation.new(
    locale: 'english'
  )
end

def spanish_contact_information
  @spanish_contact_information ||= PendingParticipants::ContactInformation.new(
    locale: 'spanish'
  )
end

def portuguese_contact_information
  @portuguese_contact_information ||=
    PendingParticipants::ContactInformation.new(
      locale: 'portuguese'
    )
end

def new_participant_contact_information
  @new_participan_contact_information ||=
    PendingParticipants::ContactInformation.new(
      first_name: 'Jane',
      last_name: 'Doe',
      id: '123',
      phone: '12345678910',
      contact_person: 'Papa Joe',
      address: "100 Fake Ln\nSome City, USA, 12345",
      gender: 'female'
    )
end

def jane_doe
  @jane_doe ||= PendingParticipants.new(
    name: "Doe, Jane 123 #{(Date.today - 1).strftime('%B %d, %Y')}"
  )
end

def participant_2000
  @participant_2000 ||= PendingParticipants.new(name: 'Last-2000, First')
end

def participant_2000_contact_information
  @participant_2000_contact_information ||=
    PendingParticipants::ContactInformation.new(
      first_name: 'First',
      last_name: 'Last-2000',
      id: '2000',
      phone: '12345678910',
      contact_person: 'Papa Joe',
      address: "100 Fake Ln\nSome City, USA, 12345",
      gender: 'female'
    )
end

def patient_2000
  @patient_2000 ||= YourPatients.new(pt_id: 2000)
end

def participant_100
  @participant_100 ||= PendingParticipants.new(name: 'Last-100, First')
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

def participant_2001
  @participant_2001 ||= PendingParticipants.new(
    name: 'Last-2001, First',
    locale: 'spanish'
  )
end

def participant_2002
  @participant_2002 ||= PendingParticipants.new(
    name: 'Last-2002, First',
    locale: 'spanish'
  )
end

def participant_3000
  @participant_3000 ||= PendingParticipants.new(
    name: 'Last-3000, First',
    locale: 'portuguese'
  )
end

def participant_3001
  @participant_3001 ||= PendingParticipants.new(
    name: 'Last-3001, First',
    locale: 'portuguese'
  )
end
