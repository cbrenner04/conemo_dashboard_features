# filename: ./spec/login_spec.rb

require './lib/pages/navigation.rb'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

feature 'Nurse, Login' do
  scenario 'English nurse only accesses their patients, nurse functionality' do
    english_nurse.sign_in

    expect(navigation).to_not have_english_admin_buttons

    expect(english_nurse).to have_english_patient

    english_nurse.sign_out
  end

  scenario 'Spanish nurse only accesses their patients, nurse functionality' do
    spanish_nurse.sign_in

    expect(navigation).to_not have_spanish_admin_buttons

    spanish_nurse.sign_out
  end

  scenario 'Portuguese nurse only accesses their pts, nurse functionality' do
    portuguese_nurse.sign_in

    expect(navigation).to_not have_portuguese_admin_buttons

    expect(portuguese_nurse).to have_portuguese_patient

    portuguese_nurse.sign_out
  end
end
