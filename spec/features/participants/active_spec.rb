# filename: ./spec/features/active_spec.rb

# require page objects
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/active_participants'
require './lib/pages/profile'
require './lib/pages/contact_information'

# initialize page objects
# no need to initialize login, navigation, or contact_information
# they're in the feature_helper
def active_participants
  @active_participants ||= ActiveParticipants.new
end

def profile
  @profile ||= Profile.new
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

  it 'edits participant information from the profile page' do
    profile.go_to_profile_of('Last-301, First')
    profile.select_edit_contact_information
    contact_information.fill_in_email('participant301@example.com')
    contact_information.submit

    expect(page).to have_content 'Email: participant301@example.com'
  end

  it 'enters smartphone information' do
    profile.go_to_profile_of('Last-302, First')
    profile.select_edit_smartphone_information
    profile.enter_smartphone_number('1234567890')
    profile.select_all_radios
    profile.submit_smartphone_info

    expect(page).to have_content 'Smartphone Information: 1234567890'
  end
end
