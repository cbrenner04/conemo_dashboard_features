# filename: ./spec/features/active_participants/reports_spec.rb

# require page objects
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/active_participants'
require './lib/pages/active_participants/reports'

# instantiate objects
# no need to instantiate login or navigation, these are in the feature_helper.rb
def active_participants
  @active_participants ||= ActiveParticipants.new
end

def reports
  @reports ||= ActiveParticipants::Reports.new
end

describe 'An authorized admin signs in', type: :feature do
  before do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    active_participants.open
    active_participants.assert_on_page
  end

  it 'sees status flashing when there is an unread help message' do
    expect(active_participants).to have_help_message_for('333')
  end

  it 'sees status solid due to messages already being read' do
    expect(active_participants).to_not have_help_message_for('343')
  end

  it 'sees correct 7 day count, logins, and messages' do
    scroll_by('2000')
    reports.open_for('343')
    expect(reports).to have_seven_day_access_count_of('4')
    expect(reports).to have_the_messages('I need some help, please', 'Help!')

    reports.show_number_of_logins
    date_1 = (Date.today - 1).strftime('%B %d, %Y')
    date_2 = (Date.today - 2).strftime('%B %d, %Y')
    date_3 = (Date.today - 3).strftime('%B %d, %Y')
    date_4 = (Date.today - 4).strftime('%B %d, %Y')
    expect(reports).to have_logins_on(date_1, date_2, date_3, date_4)
  end

  it 'sees correct status for participant ' \
     'who\'s first lesson hasn\'t passed' do
    status = 'disabled'
    expect(active_participants).to have_status_for(status, '305')

    # navigate to report to check "Overall Status"
    reports.open_for('305')
    expect(reports).to have_overall_status(status)
  end

  it 'sees correct status for participant ' \
     'who is up-to-date with their lessons' do
    status = 'green'
    expect(active_participants).to have_status_for(status, '400')

    # navigate to report to check "Overall Status"
    scroll_by('2000')
    reports.open_for('400')
    expect(reports).to have_overall_status(status)
  end

  it 'sees correct status for participant ' \
     'who has missed one of the last two lessons' do
    status = 'yellow'
    expect(active_participants).to have_status_for(status, '320')

    # navigate to report to check "Overall Status"
    scroll_by('1000')
    reports.open_for('320')
    expect(reports).to have_overall_status(status)
  end

  it 'sees correct status for participant ' \
     'who has missed their last two lessons' do
    status = 'red'
    expect(active_participants).to have_status_for(status, '321')

    # navigate to report to check "Overall Status"
    scroll_by('1000')
    reports.open_for('321')
    expect(reports).to have_overall_status(status)
  end

  it 'sees current lesson (first) highlighted' do
    reports.open_for('300')
    expect(reports).to have_current_lesson_at('1')
  end

  it 'sees current lesson (second) highlighted and first lesson missed' do
    scroll_by('2000')
    reports.open_for('401')
    expect(reports).to have_current_lesson_at('2')

    expect(reports).to have_unread_lesson_of('1')
  end

  it 'sees current lesson (third) highlighted and second lesson missed' do
    scroll_by('500')
    reports.open_for('312')
    expect(reports).to have_current_lesson_at('3')

    expect(reports).to have_unread_lesson_of('2')
  end

  it 'sees current lesson (fourth) highlighted and third lesson missed' do
    scroll_by('2000')
    reports.open_for('410')
    expect(reports).to have_current_lesson_at('4')

    expect(reports).to have_unread_lesson_of('3')
  end

  it 'sees current lesson (fifth) highlighted and fourth lesson missed' do
    scroll_by('1000')
    reports.open_for('323')
    expect(reports).to have_current_lesson_at('5')

    expect(reports).to have_unread_lesson_of('4')
  end

  it 'sees current lesson (sixth) highlighted and fifth lesson missed' do
    scroll_by('2500')
    reports.open_for('420')
    expect(reports).to have_current_lesson_at('6')

    expect(reports).to have_unread_lesson_of('5')
  end

  it 'sees current lesson (seventh) highlighted and sixth lesson missed' do
    scroll_by('2500')
    reports.open_for('430')
    expect(reports).to have_current_lesson_at('7')

    expect(reports).to have_unread_lesson_of('6')
  end

  it 'sees current lesson (eighth) highlighted and seventh lesson missed' do
    scroll_by('2500')
    reports.open_for('440')
    expect(reports).to have_current_lesson_at('8')

    expect(reports).to have_unread_lesson_of('7')
  end

  it 'sees current lesson (ninth) highlighted and eighth lesson missed' do
    scroll_by('2500')
    reports.open_for('450')
    expect(reports).to have_current_lesson_at('9')

    expect(reports).to have_unread_lesson_of('8')
  end

  it 'sees current lesson (tenth) highlighted and ninth lesson missed' do
    scroll_by('3000')
    reports.open_for('460')
    expect(reports).to have_current_lesson_at('10')

    expect(reports).to have_unread_lesson_of('9')
  end

  it 'sees participant accessed the first lesson late' do
    scroll_by('2000')
    reports.open_for('411')
  end

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

def scroll_by(pixels)
  page.execute_script("window.scrollBy(0,#{pixels})")
end
