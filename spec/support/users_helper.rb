# filename: ./spec/support/users_helper.rb

require './lib/pages/users'

def english_admin
  @english_admin ||= Users.new(
    email: ENV['EN_Admin_Email'],
    password: ENV['EN_Admin_Password']
  )
end

def spanish_admin
  @spanish_admin ||= Users.new(
    email: ENV['PE_Admin_Email'],
    password: ENV['PE_Admin_Password']
  )
end

def portuguese_admin
  @portuguese_admin ||= Users.new(
    email: ENV['BR_Admin_Email'],
    password: ENV['BR_Admin_Password']
  )
end

def english_nurse
  @english_nurse ||= Users.new(
    email: ENV['EN_Nurse_Email'],
    password: ENV['EN_Nurse_Password']
  )
end
