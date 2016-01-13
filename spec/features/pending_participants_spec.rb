# filename: ./spec/features/pending_participants_spec.rb

# require page objects
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/pending_participants'

# initialize page objects
# no need to initialize login or navigation, they're in the feature_helper
def pending_participants
  @pending_participants ||= PendingParticipants.new
end

describe 'An authorized admin signs in', type: :feature do
  before do
    visit ENV['Base_URL']
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    pending_participants.open
  end

  it ' can cancel creation form' do
    pending_participants.create
    pending_participants.cancel

    expect(page).to have_css '#pending'
  end

  it 'cannot create a participant without filling in first name' do
    pending_participants.create
    pending_participants.fill_in_last_name('Doe')
    pending_participants.fill_in_study_id('123')
    pending_participants.fill_in_health_unit('Some Healthy Place')
    pending_participants.fill_in_family_record('1234')
    pending_participants.fill_in_phone('12345678910')
    pending_participants.fill_in_emer_con_name('Papa Joe')
    pending_participants.fill_in_emer_con_phone('12345678901')
    pending_participants.fill_in_email('jane.doe@example.com')
    pending_participants.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    pending_participants.select_dob
    pending_participants.choose_gender('female')
    pending_participants.choose_chronic_disorder
    pending_participants.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in last name' do
    pending_participants.create
    pending_participants.fill_in_first_name('Jane')
    pending_participants.fill_in_study_id('123')
    pending_participants.fill_in_health_unit('Some Healthy Place')
    pending_participants.fill_in_family_record('1234')
    pending_participants.fill_in_phone('12345678910')
    pending_participants.fill_in_emer_con_name('Papa Joe')
    pending_participants.fill_in_emer_con_phone('12345678901')
    pending_participants.fill_in_email('jane.doe@example.com')
    pending_participants.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    pending_participants.select_dob
    pending_participants.choose_gender('female')
    pending_participants.choose_chronic_disorder
    pending_participants.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in study id' do
    pending_participants.create
    pending_participants.fill_in_first_name('Jane')
    pending_participants.fill_in_last_name('Doe')
    pending_participants.fill_in_health_unit('Some Healthy Place')
    pending_participants.fill_in_family_record('1234')
    pending_participants.fill_in_phone('12345678910')
    pending_participants.fill_in_emer_con_name('Papa Joe')
    pending_participants.fill_in_emer_con_phone('12345678901')
    pending_participants.fill_in_email('jane.doe@example.com')
    pending_participants.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    pending_participants.select_dob
    pending_participants.choose_gender('female')
    pending_participants.choose_chronic_disorder
    pending_participants.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in family health unit' do
    pending_participants.create
    pending_participants.fill_in_first_name('Jane')
    pending_participants.fill_in_last_name('Doe')
    pending_participants.fill_in_study_id('123')
    pending_participants.fill_in_family_record('1234')
    pending_participants.fill_in_phone('12345678910')
    pending_participants.fill_in_emer_con_name('Papa Joe')
    pending_participants.fill_in_emer_con_phone('12345678901')
    pending_participants.fill_in_email('jane.doe@example.com')
    pending_participants.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    pending_participants.select_dob
    pending_participants.choose_gender('female')
    pending_participants.choose_chronic_disorder
    pending_participants.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in phone' do
    pending_participants.create
    pending_participants.fill_in_first_name('Jane')
    pending_participants.fill_in_last_name('Doe')
    pending_participants.fill_in_study_id('123')
    pending_participants.fill_in_health_unit('Some Healthy Place')
    pending_participants.fill_in_family_record('1234')
    pending_participants.fill_in_emer_con_name('Papa Joe')
    pending_participants.fill_in_emer_con_phone('12345678901')
    pending_participants.fill_in_email('jane.doe@example.com')
    pending_participants.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    pending_participants.select_dob
    pending_participants.choose_gender('female')
    pending_participants.choose_chronic_disorder
    pending_participants.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'cannot create a participant without filling in date of birth'

  it 'cannot create a participant without filling in enrollment date'

  it 'cannot create a participant without choosing in gender' do
    pending_participants.create
    pending_participants.fill_in_first_name('Jane')
    pending_participants.fill_in_last_name('Doe')
    pending_participants.fill_in_study_id('123')
    pending_participants.fill_in_health_unit('Some Healthy Place')
    pending_participants.fill_in_family_record('1234')
    pending_participants.fill_in_phone('12345678910')
    pending_participants.fill_in_emer_con_name('Papa Joe')
    pending_participants.fill_in_emer_con_phone('12345678901')
    pending_participants.fill_in_email('jane.doe@example.com')
    pending_participants.fill_in_address("100 Fake Ln\nSome City, USA, 12345")
    pending_participants.select_dob
    pending_participants.choose_chronic_disorder
    pending_participants.submit

    expect(page).to_not have_css '#pending'
    expect(page).to have_css '#participant_first_name'
  end

  it 'can create a participant without filling in the optional fields' do
    pending_participants.create
    pending_participants.fill_in_first_name('Jane')
    pending_participants.fill_in_last_name('Doe')
    pending_participants.fill_in_study_id('123')
    pending_participants.fill_in_health_unit('Some Healthy Place')
    pending_participants.fill_in_phone('12345678910')
    pending_participants.select_dob
    yesterday = Date.today - 1
    pending_participants.select_enrollment_date(yesterday)
    pending_participants.choose_gender('female')
    pending_participants.submit

    expect(page)
      .to have_content "Doe, Jane 123 #{yesterday.strftime('%B %-d, %Y')}"
  end

  it 'activates a participant' do
    pending_participants.activate('Schmo, Joe')
    pending_participants.assign_nurse

    expect(page).to have_content 'Manage Active Participants'
    expect(page).to have_content 'Schmo, Joe 1111'
  end

  it 'disqualifies a participant' do
    pending_participants.disqualify('Smith, John')
    pending_participants.confirm_disqualify

    expect(page).to_not have_content 'Smith, John 2222'

    pending_participants.select_ineligible_tab

    expect(page).to have_content 'Smith, John 2222'
  end

  it 'activates a participant who was previously disqualified' do
    pending_participants.select_ineligible_tab
    pending_participants.activate('Smith, Patti')
    pending_participants.assign_nurse

    expect(page).to have_content 'Manage Active Participants'
    expect(page).to have_content 'Smith, Patti 3333'
  end
end
