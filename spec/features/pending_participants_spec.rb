# filename: ./spec/features/pending_participants_spec.rb

# require page objects
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/contact_information'
require './lib/pages/pending_participants'

# instantiate page objects
# no need to instantiate login, navigation or contact_formation,
# they're in the feature_helper
def pending_participants
  @pending_participants ||= PendingParticipants.new
end

describe 'An authorized admin signs in', type: :feature do
  before do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    pending_participants.open
  end

  it 'can cancel creation form' do
    pending_participants.create
    navigation.cancel

    expect(page).to have_css '#pending'
  end

  it 'cannot create a participant without filling in first name' do
    pending_participants.create
    contact_information.fill_in_last_name('Doe')
    contact_information.fill_in_study_id('123')
    contact_information.fill_in_health_unit('Some Healthy Place')
    contact_information.fill_in_family_record('1234')
    contact_information.fill_in_phone('12345678910')
    contact_information.fill_in_emer_con_name('Papa Joe')
    contact_information.fill_in_emer_con_phone('12345678901')
    contact_information.fill_in_email('jane.doe@example.com')
    contact_information.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    contact_information.select_dob
    contact_information.choose_gender('female')
    contact_information.choose_chronic_disorder
    navigation.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in last name' do
    pending_participants.create
    contact_information.fill_in_first_name('Jane')
    contact_information.fill_in_study_id('123')
    contact_information.fill_in_health_unit('Some Healthy Place')
    contact_information.fill_in_family_record('1234')
    contact_information.fill_in_phone('12345678910')
    contact_information.fill_in_emer_con_name('Papa Joe')
    contact_information.fill_in_emer_con_phone('12345678901')
    contact_information.fill_in_email('jane.doe@example.com')
    contact_information.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    contact_information.select_dob
    contact_information.choose_gender('female')
    contact_information.choose_chronic_disorder
    navigation.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in study id' do
    pending_participants.create
    contact_information.fill_in_first_name('Jane')
    contact_information.fill_in_last_name('Doe')
    contact_information.fill_in_health_unit('Some Healthy Place')
    contact_information.fill_in_family_record('1234')
    contact_information.fill_in_phone('12345678910')
    contact_information.fill_in_emer_con_name('Papa Joe')
    contact_information.fill_in_emer_con_phone('12345678901')
    contact_information.fill_in_email('jane.doe@example.com')
    contact_information.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    contact_information.select_dob
    contact_information.choose_gender('female')
    contact_information.choose_chronic_disorder
    navigation.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in family health unit' do
    pending_participants.create
    contact_information.fill_in_first_name('Jane')
    contact_information.fill_in_last_name('Doe')
    contact_information.fill_in_study_id('123')
    contact_information.fill_in_family_record('1234')
    contact_information.fill_in_phone('12345678910')
    contact_information.fill_in_emer_con_name('Papa Joe')
    contact_information.fill_in_emer_con_phone('12345678901')
    contact_information.fill_in_email('jane.doe@example.com')
    contact_information.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    contact_information.select_dob
    contact_information.choose_gender('female')
    contact_information.choose_chronic_disorder
    navigation.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in phone' do
    pending_participants.create
    contact_information.fill_in_first_name('Jane')
    contact_information.fill_in_last_name('Doe')
    contact_information.fill_in_study_id('123')
    contact_information.fill_in_health_unit('Some Healthy Place')
    contact_information.fill_in_family_record('1234')
    contact_information.fill_in_emer_con_name('Papa Joe')
    contact_information.fill_in_emer_con_phone('12345678901')
    contact_information.fill_in_email('jane.doe@example.com')
    contact_information.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    contact_information.select_dob
    contact_information.choose_gender('female')
    contact_information.choose_chronic_disorder
    navigation.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in date of birth'

  it 'cannot create a participant without filling in enrollment date'

  it 'cannot create a participant without choosing in gender' do
    pending_participants.create
    contact_information.fill_in_first_name('Jane')
    contact_information.fill_in_last_name('Doe')
    contact_information.fill_in_study_id('123')
    contact_information.fill_in_health_unit('Some Healthy Place')
    contact_information.fill_in_family_record('1234')
    contact_information.fill_in_phone('12345678910')
    contact_information.fill_in_emer_con_name('Papa Joe')
    contact_information.fill_in_emer_con_phone('12345678901')
    contact_information.fill_in_email('jane.doe@example.com')
    contact_information.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    contact_information.select_dob
    contact_information.choose_chronic_disorder
    navigation.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'can create a participant without filling in the optional fields' do
    pending_participants.create
    contact_information.fill_in_first_name('Jane')
    contact_information.fill_in_last_name('Doe')
    contact_information.fill_in_study_id('123')
    contact_information.fill_in_health_unit('Some Healthy Place')
    contact_information.fill_in_phone('12345678910')
    contact_information.select_dob
    yesterday = Date.today - 1
    contact_information.select_enrollment_date(yesterday)
    contact_information.choose_gender('female')
    navigation.submit

    expect(page)
      .to have_content "Doe, Jane 123 #{yesterday.strftime('%B %-d, %Y')}"
  end

  it 'activates a participant' do
    pending_participants.activate('Last-100, First')
    pending_participants.assign_nurse

    expect(page).to have_content 'Manage Active Participants'
    expect(page).to have_content 'Last-100, First 100'
  end

  it 'disqualifies a participant' do
    pending_participants.disqualify('Last-101, First')
    pending_participants.confirm_disqualify

    expect(page).to_not have_content 'Last-101, First 101'

    pending_participants.select_ineligible_tab

    expect(page).to have_content 'Last-101, First 101'
  end

  it 'activates a participant who was previously disqualified' do
    pending_participants.select_ineligible_tab
    pending_participants.activate('Last-200, First')
    pending_participants.assign_nurse

    expect(page).to have_content 'Manage Active Participants'
    expect(page).to have_content 'Last-200, First 200'
  end

  it 'edits pending participant\'s information' do
    pending_participants.select_edit('Last-102, First')

    expect(page).to have_css '#participant_first_name'
  end

  it 'edits ineligible participant\'s information' do
    pending_participants.select_ineligible_tab
    pending_participants.select_edit('Last-201, First')

    expect(page).to have_css '#participant_first_name'
  end

  it 'visits Spanish Pending Participants,' \
     'does not see English participants, sees forms in Spanish'

  it 'visits Portuguese Pending Participants,' \
     'does not see English participants, sees forms in Portuguese'
end
