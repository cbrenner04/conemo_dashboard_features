# filename: ./spec/login_spec.rb

# require page objects
require './lib/pages/login.rb'
require './lib/pages/navigation.rb'

# initialize page objects
# no need to initialize login or navigation, they're in the feature_helper

describe 'A visitor to the site', type: :feature do
  before do
    visit ENV['Base_URL']
  end

  it 'is an authorized English admin and logs in' do
    navigation.switch_to_english
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])

    buttons = all('.btn').map(&:text)
    expect(buttons).to match_array(navigation.english_admin_buttons)
  end

  it 'is an authorized Spanish admin and logs in' do
    navigation.switch_to_spanish
    login.sign_in(ENV['PE_Admin_Email'], ENV['PE_Admin_Password'])

    buttons = all('.btn').map(&:text)
    expect(buttons).to match_array(navigation.spanish_admin_buttons)
  end

  it 'is an authorized Portuguese admin and logs in' do
    navigation.switch_to_portuguese
    login.sign_in(ENV['BR_Admin_Email'], ENV['BR_Admin_Password'])

    buttons = all('.btn').map(&:text)
    expect(buttons).to match_array(navigation.portuguese_admin_buttons)
  end

  it 'is an authorized English nurse and logs in' do
    navigation.switch_to_english
    login.sign_in(ENV['EN_Nurse_Email'], ENV['EN_Nurse_Password'])

    buttons = all('.btn').map(&:text)
    expect(buttons).to_not match_array(navigation.english_admin_buttons)
  end

  it 'is an authorized Spanish nurse and logs in' do
    navigation.switch_to_spanish
    login.sign_in(ENV['PE_Nurse_Email'], ENV['PE_Nurse_Password'])

    buttons = all('.btn').map(&:text)
    expect(buttons).to_not match_array(navigation.spanish_admin_buttons)
  end

  it 'is an authorized Portuguese nurse and logs in' do
    navigation.switch_to_portuguese
    login.sign_in(ENV['BR_Nurse_Email'], ENV['BR_Nurse_Password'])

    buttons = all('.btn').map(&:text)
    expect(buttons).to_not match_array(navigation.portuguese_admin_buttons)
  end
end
