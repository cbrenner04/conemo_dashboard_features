# filename: ./spec/features/active_participants/reports_spec.rb

# require page objects
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/active_participants'

# instantiate objects
# no need to instantiate login or navigation, these are in the feature_helper.rb
def active_participants
  @active_participants ||= ActiveParticipants.new
end

describe 'An authorized admin signs in', type: :feature do
  before do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    active_participants.open
    sleep(1)
  end

  it 'sees status flashing when there is an unread help message' do
    expect(active_participants).to have_help_message_for('333')
  end

  it 'sees status solid due to messages already being read' do
    expect(active_participants).to_not have_help_message_for('343')
  end

  it 'sees correct 7 day count, logins, and messages'

  it 'sees correct status for participant ' \
     'who\'s first lesson hasn\'t passed - 305'

  # navigate to report to check "Overall Status"

  it 'sees correct status for participant ' \
     'who is up-to-date with their lessons - 400'

  # navigate to report to check "Overall Status"

  it 'sees correct status for participant ' \
     'who has missed one of the last two lessons - 320'

  # navigate to report to check "Overall Status"

  it 'sees correct status for participant ' \
     'who has missed their last two lessons - 321'

  # navigate to report to check "Overall Status"

  it 'sees current lesson (first) highlighted - 300'

  it 'sees current lesson (second) highlighted and first lesson missed - 401'

  it 'sees current lesson (third) highlighted and second lesson missed - 312'

  it 'sees current lesson (fourth) highlighted and third lesson missed - 410'

  it 'sees current lesson (fifth) highlighted and fourth lesson missed - 323'

  it 'sees current lesson (sixth) highlighted and fifth lesson missed - 420'

  it 'sees current lesson (seventh) highlighted and sixth lesson missed - 430'

  it 'sees current lesson (eighth) highlighted and seventh lesson missed - 440'

  it 'sees current lesson (ninth) highlighted and eighth lesson missed - 450'

  it 'sees current lesson (tenth) highlighted and ninth lesson missed - 460'

  it 'sees participant accessed the first lesson late - 411'

  it 'sees participant accessed the second lesson late - 324'

  it 'sees participant accessed the third lesson late - 421'

  it 'sees participant accessed the fourth lesson late - 431'

  it 'sees participant accessed the fifth lesson late - 441'

  it 'sees participant accessed the sixth lesson late - 451'

  it 'sees participant accessed the seventh lesson late - 461'

  it 'sees participant accessed the eighth lesson late - 471'

  it 'sees participant accessed the ninth lesson late - 480'

  it 'sees participant accessed the tenth lesson late - 490'

  it 'sees participant accessed the first lesson on time - 303'

  it 'sees participant accessed the second lesson on time - 317'

  it 'sees participant accessed the third lesson on time - 412'

  it 'sees participant accessed the fourth lesson on time - 324'

  it 'sees participant accessed the fifth lesson on time - 422'

  it 'sees participant accessed the sixth lesson on time - 432'

  it 'sees participant accessed the seventh lesson on time - 442'

  it 'sees participant accessed the eighth lesson on time - 452'

  it 'sees participant accessed the ninth lesson on time - 462'

  it 'sees participant accessed the tenth lesson on time - 472'
end
