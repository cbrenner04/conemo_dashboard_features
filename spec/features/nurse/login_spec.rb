# filename: ./spec/login_spec.rb

require './lib/pages/navigation.rb'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def spanish_navigation
  @spanish_navigation ||= Navigation.new(locale: 'spanish')
end

def portuguese_navigation
  @portuguese_navigation ||= Navigation.new(locale: 'portuguese')
end

feature 'Nurse, Login', metadata: :not_first do
  scenario 'English nurse only accesses their patients, nurse functionality' do
    english_nurse.sign_in

    expect(navigation).to_not have_admin_buttons
    expect(english_nurse).to have_english_patient

    english_nurse.sign_out
  end

  scenario 'Spanish nurse only accesses their patients, nurse functionality' do
    spanish_nurse.sign_in

    expect(spanish_navigation).to_not have_admin_buttons
    expect(spanish_nurse).to have_spanish_patient

    spanish_nurse.sign_out
  end

  scenario 'Portuguese nurse only accesses their pts, nurse functionality' do
    portuguese_nurse.sign_in

    expect(portuguese_navigation).to_not have_admin_buttons
    expect(portuguese_nurse).to have_portuguese_patient

    portuguese_nurse.sign_out
  end
end
