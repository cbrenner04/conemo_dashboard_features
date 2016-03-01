# filename: ./spec/support/users_helper.rb

require './lib/pages/users'

def english_admin
  @english_admin ||= Users.new(
    email: ENV['EN_Admin_Email'],
    password: ENV['EN_Admin_Password']
  )
end