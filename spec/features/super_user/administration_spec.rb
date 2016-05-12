# filename: ./spec/features/super_user/administration_spec.rb

feature 'Super User, Administration', metadata: :not_first do
  scenario 'Super user can create an admin'
  scenario 'Super user can create a nurse'
  scenario 'Super user can create a nurse supervisor'
end

# this will require different set up
feature 'Super User, Administration', metadata: :not_first do
  scenario 'Super user can view and export authentication tokens table'
  scenario 'Super user can view and export participants table'
  scenario 'Super user can view and export users table'
  scenario 'Super user can view and export admin table'
  scenario 'Super user can view and export nurse table'
  scenario 'Super user can view and export nurse supervisor table'
  scenario 'Super user can view and export content access events table'
  scenario 'Super user can view and export devices table'
  scenario 'Super user can view and export help messages table'
  scenario 'Super user can view and export logins table'
  scenario 'Super user can view and export participant start dates table'
  scenario 'Super user can view and export planned activities table'
  scenario 'Super user can view and export responses table'
  scenario 'Super user can view and export session events table'
  scenario 'Super user can view and export final appointments table'
  scenario 'Super user can view and export first appointments table'
  scenario 'Super user can view and export first contacts table'
  scenario 'Super user can view and export nurse participant evaluations table'
  scenario 'Super user can view and export nurse tasks table'
  scenario 'Super user can view and export patient contacts table'
  scenario 'Super user can view and export reminder messages table'
  scenario 'Super user can view and export second contacts table'
  scenario 'Super user can view and export smartphones table'
  scenario 'Super user can view and export third contacts table'
  scenario 'Super user can view and export lessons table'
end
