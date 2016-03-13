# filename: ./spec/support/admin/lessons_helper.rb

require './lib/pages/lessons'
require './lib/pages/lessons/slides'
require './lib/pages/navigation'

def navigation
  @navigation ||= Navigation.new
end

def lessons
  @lessons ||= Lessons.new(locale: 'english')
end

def slides
  @slides ||= Lessons::Slides.new(
    lesson: 'Lesson 3',
    title: 'Slide 1'
  )
end

def new_lesson
  @new_lesson ||= Lessons.new(
    title: 'New Lesson',
    day: 15
  )
end

def activity_lesson
  @actiivty_lesson ||= Lessons.new(
    title: 'Activity Lesson',
    day: 16
  )
end

def new_slide
  @new_slide ||= Lessons::Slides.new(
    lesson: 'Lesson 11',
    title: 'New Slide'
  )
end

def lesson_5
  @lesson_5 ||= Lessons.new(
    title: 'Lesson 5',
    slide: 'Slide 1'
  )
end

def lesson_6_slide_1
  @lesson_6_slide_1 ||= Lessons::Slides.new(
    lesson: 'Lesson 6',
    title: 'Slide 1',
    body: 'read this'
  )
end

def lesson_7
  @lesson_7 ||= Lessons.new(title: 'Lesson 7')
end

def lesson_12
  @lesson_12 ||= Lessons.new(
    title: 'Lesson 12',
    new_title: 'Edited Lesson'
  )
end

def lesson_2_slide_1
  @lesson_2_slide_1 ||= Lessons::Slides.new(
    lesson: 'Lesson 2',
    title: 'Slide 1'
  )
end

def lesson_2_slide_2
  @lesson_2_slide_2 ||= Lessons::Slides.new(
    lesson: 'Lesson 2',
    title: 'Slide 2'
  )
end

def lesson_13_slide_2
  @lesson_13_slide_2 ||= Lessons::Slides.new(
    lesson: 'Lesson 13',
    title: 'Slide 2',
    new_title: 'Edited Slide'
  )
end

def lesson_14
  @lesson_14 ||= Lessons.new(title: 'Lesson 14')
end

def lesson_15_slide_1
  @lesson_15_slide_1 ||= Lessons::Slides.new(
    lesson: 'Lesson 15',
    title: 'Slide 1'
  )
end

def lesson_8_slide_3
  @lesson_8_slide_3 ||= Lessons::Slides.new(
    lesson: 'Lesson 8',
    title: 'Slide 3'
  )
end

def spanish_lessons
  @spanish_lessons ||= Lessons.new(locale: 'spanish')
end

def spanish_lesson
  @spanish_lesson ||= Lessons.new(
    title: '¡Bienvenido a CONEMO!',
    locale: 'spanish'
  )
end

def portuguese_lessons
  @portuguese_lessons ||= Lessons.new(locale: 'portuguese')
end
