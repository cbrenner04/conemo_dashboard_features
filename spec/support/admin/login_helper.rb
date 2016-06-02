# frozen_string_literal: true
# filename: ./spec/support/admin/login_helper.rb

require './lib/pages/administration'
require './lib/pages/lessons'
require './lib/pages/navigation'
require './lib/pages/pending_participants'

def administration
  @administration ||= Administration.new
end

def lessons
  @lessons ||= Lessons.new(title: 'fake')
end

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def spanish_navigation
  @spanish_navigation ||= Navigation.new(locale: 'spanish')
end

def portuguese_navigation
  @portuguese_navigation ||= Navigation.new(locale: 'portuguese')
end

def pending_participants
  @pending_participants ||= PendingParticipants.new(name: 'fake')
end
