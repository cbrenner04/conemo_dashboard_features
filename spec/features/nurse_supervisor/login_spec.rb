# filename: ./spec/features/nurse_supervisor/login_spec.rb

feature 'Nurse Supervisor, Login' do
  scenario 'English Nurse Supervisor cannot access Spanish or Portuguese'
  scenario 'Spanish Nurse Supervisor cannot access English or Portuguese'
  scenario 'Portuguese Nurse Supervisor cannot access English or Spanish'
  scenario 'Nurse Supervisor can access appropriate parts of the app'
end
