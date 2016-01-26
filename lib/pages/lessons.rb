# page object for lessons
class Lessons
  include Capybara::DSL

  def open
    click_on 'Lessons'
  end

  def assert_on_page
    find('.btn', text: 'Add Lesson')
  end

  def open_add_lesson
    click_on 'Add Lesson'
    find('#lesson_title')
  end

  def add_a_lesson(title, day)
    open_add_lesson
    fill_in 'lesson[name]', with: title
    fill_in 'lesson[day_in_treatment]', with: day
    click_on 'Create Lesson'
  end

  def has_lesson_visible?(lesson)
    find('.table').has_css?('td', text: lesson)
  end

  def open_add_slide(lesson)
    open_lesson(lesson)
    click_on 'Add Slide'
    find('#slide_title')
  end

  def add_a_slide(lesson, title, body)
    open_add_slide(lesson)
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

  def open_edit_lesson(lesson)
    find('tr', text: lesson).find('.fa-pencil').click
  end

  def edit_lesson(lesson, new_title)
    open_edit_lesson(lesson)
    fill_in 'lesson[title]', with: new_title
    click_on 'Update Lesson'
  end

  def open_edit_slide(lesson, slide)
    open_lesson(lesson)
    find('tr', text: slide).find('.fa-pencil').click
  end

  def edit_slide(lesson, slide, new_title)
    open_edit_slide(lesson, slide)
    fill_in 'slide[title]', with: new_title
    click_on 'Update Slide'
  end

  def delete_lesson(lesson)
    find('tr', text: lesson).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{lesson}?"
    find('.alert-info', text: 'Lesson deleted')
  end

  def delete_slide(lesson, slide)
    open_lesson(lesson)
    find('tr', text: slide).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{slide}?"
    find('.alert-info', text: 'Slide deleted')
  end

  def add_dialogue(title, day, message)
    navigate_to_dialogues
    click_on 'Add Dialogue'
    fill_in 'dialogue[title]', text: title
    fill_in 'dialogue[day_in_treatment]', text: day
    fill_in 'dialogue[message]', text: message
    fill_in 'dialogue[yes_text]', text: yes
    fill_in 'dialogue[no_text]', text: no
    click_on 'Create Dialogue'
  end

  def has_dialogue_visible?(dialogue)
    navigate_to_dialogues
    find('.table').has_css?('td', text: dialogue)
  end

  def read_dialogue(dialogue, message)
    navigate_to_dialogues
    click_on dialogue
    find('h2', text: dialogue)
    find('p', text: message)
  end

  def edit_dialogue(dialogue, new_title)
    navigate_to_dialogues
    find('tr', text: dialogue).find('.fa-pencil').click
    fill_in 'dialogue[title]', text: new_title
    click_on 'Update Dialogue'
  end

  def delete_dialogue(dialogue)
    navigate_to_dialogues
    find('tr', text: dialogue).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{dialogue}?"
  end

  def navigate_with_breadcrumbs(lesson, slide)
    open_lesson(lesson)
    click_on slide
    find('h2', text: slide)
    within('.breadcrumbs') { click_on lesson }
    find('h2', text: lesson)
    within('.breadcrumbs') { click_on 'Lessons' }
    assert_on_page
  end

  private

  def open_lesson(lesson)
    click_on lesson
    find('h2', text: lesson)
  end

  def navigate_to_dialogues
    click_on 'Dialogues'
  end
end
