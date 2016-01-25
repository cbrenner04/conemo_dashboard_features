# page object for lessons
class Lessons
  include Capybara::DSL

  def open
    click_on 'Lessons'
  end

  def add_a_lesson(title, day)
    click_on 'Add Lesson'
    fill_in 'lesson[name]', with: title
    fill_in 'lesson[day_in_treatment]', with: day
    click_on 'Create Lesson'
  end

  def has_lesson_visible?(lesson)
    find('.table').has_css?('td', text: lesson)
  end

  def add_a_slide(lesson, title, body)
    open_lesson(lesson)
    click_on 'Add Slide'
    fill_in 'slide[title]', with: title
    fill_in '.cke_contents', body
    click_on 'Create Slide'
  end

  def has_slide_visible(slide)
    find('.table').has_css?('td', text: slide)
  end

  def read_lesson(lesson, slide)
    open_lesson(lesson)
    find('.ui-sortable', text: slide)
  end

  def read_slide(lesson, title, body)
    open_lesson(lesson)
    click_on title
    find('h2', text: title)
    find('p', text: body)
  end

  def edit_lesson(lesson, new_title)
    find('tr', text: lesson).find('.fa-pencil').click
    fill_in 'lesson[title]', with: new_title
    click_on 'Update Lesson'
  end

  def edit_slide(lesson, slide, new_title)
    open_lesson(lesson)
    find('tr', text: slide).find('.fa-pencil').click
    fill_in 'slide[title]', with: new_title
    click_on 'Update Slide'
  end

  private

  def open_lesson(lesson)
    click_on lesson
    find('h2', text: lesson)
  end
end
