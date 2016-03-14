# filename: ./spec/support/admin/login_helper.rb

require './lib/pages/navigation'
require './lib/pages/lessons'
require './lib/pages/pending_participants'
require './lib/pages/administration'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def lessons
  @lessons ||= Lessons.new(title: 'fake')
end

def pending_participants
  @pending_participants ||= PendingParticipants.new(name: 'fake')
end

def administration
  @administration ||= Administration.new
end
