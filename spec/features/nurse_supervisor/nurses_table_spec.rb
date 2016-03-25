# filename: ./spec/features/nurse_supervisor/nurse_table_spec.rb

feature 'Nurse Supervisor, Nurses Table' do
  scenario 'Nurse supervisor sees all nurses assigned to them'
  scenario 'Nurse supervisor sees # of pts, tasks, overdue tasks for each'

  feature 'Nurse Supervisor, Supervision log' do
    scenario 'Nurse supervisor cancels filling in supervision log'
    scenario 'Nurse supervisor must fill in session Length'
    scenario 'Nurse supervisor must select meeting kind'
    scenario 'Nurse supervisor must select contact kind'
    scenario 'Nurse supervisor completes supervision log'
  end
end
