# frozen_string_literal: true
# filename: ./spec/support/admin/lessons_helper.rb

require './lib/pages/lessons'
require './lib/pages/navigation'
require './lib/pages/slides'

def navigation
  @navigation ||= Navigation.new(locale: 'english')
end

def lessons
  @lessons ||= Lessons.new(locale: 'english')
end

def slides
  @slides ||= Slides.new(
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
  @new_slide ||= Slides.new(
    lesson: 'Lesson 11',
    title: 'New Slide'
  )
end

def lesson_2_slide_1
  @lesson_2_slide_1 ||= Slides.new(
    lesson: 'Lesson 2',
    title: 'Slide 1'
  )
end

def lesson_2_slide_2
  @lesson_2_slide_2 ||= Slides.new(
    lesson: 'Lesson 2',
    title: 'Slide 2'
  )
end

def lesson_5
  @lesson_5 ||= Lessons.new(
    title: 'Lesson 5',
    slide: 'Slide 1'
  )
end

def lesson_6_slide_1
  @lesson_6_slide_1 ||= Slides.new(
    lesson: 'Lesson 6',
    title: 'Slide 1',
    body: 'read this'
  )
end

def lesson_7
  @lesson_7 ||= Lessons.new(title: 'Lesson 7')
end

def lesson_8_slide_3
  @lesson_8_slide_3 ||= Slides.new(
    lesson: 'Lesson 8',
    title: 'Slide 3'
  )
end

def lesson_12
  @lesson_12 ||= Lessons.new(title: 'Lesson 12')
end

def lesson_12_a
  @lesson_12_a ||= Lessons.new(title: 'Edited Lesson')
end

def lesson_13_slide_2
  @lesson_13_slide_2 ||= Slides.new(
    lesson: 'Lesson 13',
    title: 'Slide 2'
  )
end

def lesson_13_slide_2_edited
  @lesson_13_slide_2_edited ||= Slides.new(
    lesson: 'Lesson 13',
    title: 'Edited Slide'
  )
end

def lesson_14
  @lesson_14 ||= Lessons.new(title: 'Lesson 14')
end

def lesson_15_slide_1
  @lesson_15_slide_1 ||= Slides.new(
    lesson: 'Lesson 15',
    title: 'Slide 1'
  )
end

def spanish_lessons
  @spanish_lessons ||= Lessons.new(locale: 'spanish')
end

def spanish_lesson
  @spanish_lesson ||= Lessons.new(
    title: 'Haz las cosas a tu propio ritmo',
    locale: 'spanish'
  )
end

def portuguese_lessons
  @portuguese_lessons ||= Lessons.new(locale: 'portuguese')
end

def portuguese_lesson
  @portuguese_lesson ||= Lessons.new(
    title: 'Pode ser difícil começar.',
    locale: 'portuguese'
  )
end
