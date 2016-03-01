# filename: ./spec/features/admin/login_spec.rb

feature 'Admin, Login' do
  scenario 'Admin in English locale cannot access Spanish or Portuguese'
  scenario 'Admin in Spanish locale cannot access English or Portuguese'
  scenario 'Admin in Portuguese locale cannot access English or Spanish'
  scenario 'Admin can access appropriate parts of the app'
end

# require page objects, these are instantiated in the feature helper
require './lib/pages/login.rb'
require './lib/pages/navigation.rb'

describe 'A visitor to the site', type: :feature do
  it 'is an authorized English admin and logs in' do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    expect(navigation.act_buttons)
      .to match_array(navigation.english_admin_buttons)
  end

  it 'is an authorized Spanish admin and logs in' do
    login.sign_in(ENV['PE_Admin_Email'], ENV['PE_Admin_Password'])
    expect(navigation.act_buttons)
      .to match_array(navigation.spanish_admin_buttons)
  end

  it 'is an authorized Portuguese admin and logs in' do
    login.sign_in(ENV['BR_Admin_Email'], ENV['BR_Admin_Password'])
    expect(navigation.act_buttons)
      .to match_array(navigation.portuguese_admin_buttons)
  end
end
