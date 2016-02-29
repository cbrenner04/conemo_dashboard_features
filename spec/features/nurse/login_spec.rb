# filename: ./spec/login_spec.rb

feature 'Nurse, Login' do
  scenario 'Nurse in English locale cannot access Spanish or Portuguese'
  scenario 'Nurse in Spanish locale cannot access English or Portuguese'
  scenario 'Nurse in Portuguese locale cannot access English or Spanish'
  scenario 'Nurse has access to the appropriate functionality'

# require page objects, these are instantiated in the feature helper
require './lib/pages/login.rb'
require './lib/pages/navigation.rb'

describe 'A visitor to the site', type: :feature do
  it 'is an authorized English nurse and logs in' do
    login.sign_in(ENV['EN_Nurse_400_Email'], ENV['EN_Nurse_400_Password'])
    expect(login.act_buttons)
      .to_not match_array(navigation.english_admin_buttons)
  end

  it 'is an authorized Spanish nurse and logs in' do
    login.sign_in(ENV['PE_Nurse_Email'], ENV['PE_Nurse_Password'])
    expect(login.act_buttons)
      .to_not match_array(navigation.spanish_admin_buttons)
  end

  it 'is an authorized Portuguese nurse and logs in' do
    login.sign_in(ENV['BR_Nurse_Email'], ENV['BR_Nurse_Password'])
    expect(login.act_buttons)
      .to_not match_array(navigation.portuguese_admin_buttons)
  end
end
