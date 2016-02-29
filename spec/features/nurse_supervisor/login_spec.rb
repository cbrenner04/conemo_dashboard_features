# filename: ./spec/features/nurse_supervisor/login_spec.rb

feature 'Nurse Supervisor, Login' do
  scenario 'Nurse Supervisor in English locale cannot access Spanish or Portuguese'
  scenario 'Nurse Supervisor in Spanish locale cannot access English or Portuguese'
  scenario 'Nurse Supervisor in Portuguese locale cannot access English or Spanish'
  scenario 'Nurse Supervisor can access appropriate parts of the app'
end
