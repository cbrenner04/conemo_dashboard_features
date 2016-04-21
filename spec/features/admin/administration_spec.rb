# filename: ./spec/features/admin/administration_spec.rb

feature 'Admin, Administration', metadata: :not_first do
  scenario 'Admin creates an admin'
  scenario 'Admin creates a nurse supervisor'
  scenario 'Admin creates a nurse'
  scenario 'Admin sees phone id under Participants'
  scenario 'Admin views and exports lessons table'
  scenario 'Admin views and exports participants table'
  scenario 'Admin views and exports users table'
  scenario 'Admin views and exports admins table'
  scenario 'Admin views and exports nurses table'
  scenario 'Admin views and exports nurse supervisors table'
  scenario 'Admin views and exports devices table'
  scenario 'Admin sees devices are scoped by locale'
end
