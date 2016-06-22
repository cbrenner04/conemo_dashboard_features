# frozen_string_literal: true
# filename: ./spec/support/users_helper.rb

require './lib/pages/users'

# define global method for custom click
# used when there are issues with Poltergeist
# initially written with a conditional but `.trigger('click')` is not always
# needed when using Poltergeist and `.click` is much more reliable
def custom_click(selector)
  selector.click
rescue Capybara::Poltergeist::MouseEventFailed
  selector.trigger('click')
end

# define users for use across many files

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

def english_supervisor
  @english_supervisor ||= Users.new(
    email: ENV['EN_Supervisor_Email'],
    password: ENV['EN_Supervisor_Password'],
    locale: 'english'
  )
end

def spanish_supervisor
  @spanish_supervisor ||= Users.new(
    email: ENV['PE_Supervisor_Email'],
    password: ENV['PE_Supervisor_Password'],
    locale: 'spanish'
  )
end

def portuguese_supervisor
  @portuguese_supervisor ||= Users.new(
    email: ENV['BR_Supervisor_Email'],
    password: ENV['BR_Supervisor_Password'],
    locale: 'portuguese'
  )
end

def english_nurse_401
  @english_nurse_401 ||= Users.new(
    email: ENV['Nurse_401_Email'],
    password: ENV['Nurse_401_Password'],
    locale: 'english'
  )
end

def english_nurse_404
  @english_nurse_404 ||= Users.new(
    email: ENV['Nurse_404_Email'],
    password: ENV['Nurse_404_Password'],
    locale: 'english'
  )
end

def superuser
  @superuser || Users.new(
    email: ENV['SuperUser_Email'],
    password: ENV['SuperUser_Password'],
    locale: 'english'
  )
end
