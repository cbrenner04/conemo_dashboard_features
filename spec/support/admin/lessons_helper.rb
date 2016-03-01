# filename: ./spec/support/admin/lessons_helper.rb

require './lib/pages/lessons'
require './lib/pages/login'
require './lib/pages/navigation'

def lessons
  @lessons ||= Lessons.new(title: 'fake')
end

def new_lesson
  @new_lesson ||= Lessons.new(
    title: 'New Lesson',
    day: 15
  )
end
