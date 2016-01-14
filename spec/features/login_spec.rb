# filename: ./spec/login_spec.rb

# require page objects
require './lib/pages/login.rb'
require './lib/pages/navigation.rb'

# initialize page objects
# no need to initialize login or navigation, they're in the feature_helper

describe 'A visitor to the site', type: :feature do
  it 'is an authorized English admin and logs in' do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    assert_correct_buttons(navigation.english_admin_buttons)
  end

  it 'is an authorized Spanish admin and logs in' do
    login.sign_in(ENV['PE_Admin_Email'], ENV['PE_Admin_Password'])
    assert_correct_buttons(navigation.spanish_admin_buttons)
  end

  it 'is an authorized Portuguese admin and logs in' do
    login.sign_in(ENV['BR_Admin_Email'], ENV['BR_Admin_Password'])
    assert_correct_buttons(navigation.portuguese_admin_buttons)
  end

  it 'is an authorized English nurse and logs in' do
    login.sign_in(ENV['EN_Nurse_Email'], ENV['EN_Nurse_Password'])
    assert_does_not_have_buttons(navigation.english_admin_buttons)
  end

  it 'is an authorized Spanish nurse and logs in' do
    login.sign_in(ENV['PE_Nurse_Email'], ENV['PE_Nurse_Password'])
    assert_does_not_have_buttons(navigation.spanish_admin_buttons)
  end

  it 'is an authorized Portuguese nurse and logs in' do
    login.sign_in(ENV['BR_Nurse_Email'], ENV['BR_Nurse_Password'])
    assert_does_not_have_buttons(navigation.portuguese_admin_buttons)
  end
end

def assert_correct_buttons(buttons)
  buttons = all('.btn').map(&:text)
  expect(buttons).to match_array(buttons)
end

def assert_does_not_have_buttons(buttons)
  buttons = all('.btn').map(&:text)
  expect(buttons).to_not match_array(buttons)
end
