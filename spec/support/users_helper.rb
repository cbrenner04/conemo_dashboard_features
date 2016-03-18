# filename: ./spec/support/users_helper.rb

require './lib/pages/users'

def english_admin
  @english_admin ||= Users.new(
    email: ENV['EN_Admin_Email'],
    password: ENV['EN_Admin_Password'],
    locale: 'english'
  )
end

def spanish_admin
  @spanish_admin ||= Users.new(
    email: ENV['PE_Admin_Email'],
    password: ENV['PE_Admin_Password'],
    locale: 'spanish'
  )
end

def portuguese_admin
  @portuguese_admin ||= Users.new(
    email: ENV['BR_Admin_Email'],
    password: ENV['BR_Admin_Password'],
    locale: 'portuguese'
  )
end

def english_nurse
  @english_nurse ||= Users.new(
    email: ENV['EN_Nurse_Email'],
    password: ENV['EN_Nurse_Password'],
    locale: 'english'
  )
end

def spanish_nurse
  @spanish_nurse ||= Users.new(
    email: ENV['PE_Nurse_Email'],
    password: ENV['PE_Nurse_Password'],
    locale: 'spanish'
  )
end

def portuguese_nurse
  @portuguese_nurse ||= Users.new(
    email: ENV['BR_Nurse_Email'],
    password: ENV['BR_Nurse_Password'],
    locale: 'portuguese'
  )
end
