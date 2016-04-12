# filename: ./spec/support/nurse/contact_information_helper.rb

require './lib/pages/navigation'
require './lib/pages/nurse_tasks'
require './lib/pages/nurse_tasks/contact_information'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def spanish_navigation
  @spanish_navigation ||= Navigation.new(locale: 'spanish')
end

def portuguese_navigation
  @portuguese_navigation ||= Navigation.new(locale: 'portuguese')
end

def pt_300_contact_info
  @pt_300_contact_info ||= NurseTasks::ContactInformation.new(id: 300)
end

def pt_300_nurse_tasks
  @pt_300_nurse_tasks ||= NurseTasks.new(pt_id: 300)
end

def pt_301_contact_info
  @pt_301_contact_info ||= NurseTasks::ContactInformation.new(
    id: 301,
    email: 'participant301@example.com'
  )
end

def pt_301_nurse_tasks
  @pt_301_nurse_tasks ||= NurseTasks.new(pt_id: 301)
end

def pt_302_contact_info
  @pt_302_contact_info ||= NurseTasks::ContactInformation.new(id: 302)
end

def pt_302_nurse_tasks
  @pt_302_nurse_tasks ||= NurseTasks.new(pt_id: 302)
end

def pt_310_contact_info
  @pt_310_contact_info ||= NurseTasks::ContactInformation.new(id: 310)
end

def pt_310_nurse_tasks
  @pt_310_nurse_tasks ||= NurseTasks.new(pt_id: 310)
end

def pt_500_contact_info
  @pt_500_contact_info ||= NurseTasks::ContactInformation.new(
    id: 500,
    locale: 'spanish'
  )
end

def pt_500_nurse_tasks
  @pt_500_nurse_tasks ||= NurseTasks.new(
    pt_id: 500,
    locale: 'spanish'
  )
end

def pt_600_contact_info
  @pt_600_contact_info ||= NurseTasks::ContactInformation.new(
    id: 600,
    locale: 'portuguese'
  )
end

def pt_600_nurse_tasks
  @pt_600_nurse_tasks ||= NurseTasks.new(
    pt_id: 600,
    locale: 'portuguese'
  )
end
