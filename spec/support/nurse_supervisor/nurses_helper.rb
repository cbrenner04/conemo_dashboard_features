# filename: ./spec/support/nurse_supervisor/nurse_helper.rb

require './lib/pages/navigation'
require './lib/pages/supervisor_page'
require './lib/pages/supervisor_page/nurses'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def nurse_supervisor_1
  @nurse_supervisor_1 ||= SupervisorPage.new
end

def nurse_401
  @nurse_401 ||= SupervisorPage::Nurses.new(
    id: 401,
    num_participants: 41,
    num_tasks: 20,
    num_overdue: 10,
    supervision_date: DateTime.now - 8
  )
end

def nurse_402
  @nurse_402 ||= SupervisorPage::Nurses.new(
    id: 402,
    supervision_date: DateTime.now - 12
  )
end

def nurse_403
  @nurse_403 ||= SupervisorPage::Nurses.new(
    id: 403,
    supervision_date: DateTime.now
  )
end

def nurse_404
  @nurse_404 ||= SupervisorPage::Nurses.new(id: 404)
end
