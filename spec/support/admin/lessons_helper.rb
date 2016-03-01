# filename: ./spec/support/admin/lessons_helper.rb

require './lib/pages/lessons'
require './lib/pages/login'
require './lib/pages/navigation'

def lessons
  @lessons ||= Lessons.new
end
