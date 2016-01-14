# filename: ./spec/features/active_spec.rb

# require page objects
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/contact_information'
require './lib/pages/active_participants'
require './lib/pages/active_participants/profile'
require './lib/pages/active_participants/nurse'
require './lib/pages/active_participants/notes'
require './lib/pages/active_participants/first_contact'
require './lib/pages/active_participants/first_appointment'

# initialize page objects
# no need to initialize login, navigation, or contact_information
# they're in the feature_helper
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

describe 'An authorized admin signs in', type: :feature do
  before do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    active_participants.open
  end

  it 'views participant profile' do
    profile.go_to_profile_of('Last-300, First')
    expect(profile).to be_visible_with_id('300')
  end

  it 'cancels out of edit of participant information'

  it 'edits participant information from the profile page' do
    profile.go_to_profile_of('Last-301, First')
    profile.select_edit_contact_information
    contact_information.fill_in_email('participant301@example.com')
    contact_information.submit

    expect(page).to have_content 'Email: participant301@example.com'
  end

  it 'views smartphone information'

  it 'cancels out of edit of smartphone information' do
    profile.go_to_profile_of('Last-310, First')
    profile.select_edit_smartphone_information
    profile.cancel

    expect(active_participants).to be_visible
  end

  it 'enters smartphone information' do
    profile.go_to_profile_of('Last-302, First')
    profile.select_edit_smartphone_information
    profile.enter_smartphone_number('1234567890')
    profile.select_all_radios
    profile.submit
    profile.go_to_profile_of('Last-302, First')

    expect(page).to have_content 'Smartphone Information: 1234567890'
  end

  it 'cancels out of edit nurse form' do
    nurse.open('309')
    nurse.cancel

    expect(active_participants).to be_visible
  end

  it 'updates nurse' do
    nurse.edit('303', '401')
    nurse.assert_new_nurse('303', '401')
  end

  it 'cancels add note' do
    notes.open_for('308')
    notes.cancel

    expect(active_participants).to be_visible
  end

  it 'adds a note' do
    datetime = DateTime.now - 2
    notes.add_notes('304', datetime)
    notes.open_for('304')

    expect(notes).to be_visible
  end

  it 'deletes a note' do
    notes.open_for('305')
    notes.delete
    notes.open_for('305')

    expect(notes).to_not have_any_note
  end

  it 'cancels out of first contact form' do
    active_participants.create_contact_for('307')
    first_contact.cancel

    expect(active_participants).to be_visible
  end

  it 'creates first contact' do
    active_participants.create_contact_for('306')
    first_contact.record_date_contact
    first_contact.assign_date_first_appointment
    first_contact.enter_first_appt_location
    first_contact.submit

    within active_participants.row_for('306') do
      expect(first_contact).to be_visible
    end
  end

  it 'cancels out of a first appointment reschedule form' do
    active_participants.reschedule_appt_for('311')
    first_appointment.cancel

    expect(active_participants).to be_visible
  end

  it 'reschedules a first appointment' do
    active_participants.reschedule_appt_for('312')
    first_appointment.reschedule

    expect(first_appointment).to be_rescheduled
  end

  it 'cancels out of a first appointment creation form'

  it 'creates a first appointment'
end
