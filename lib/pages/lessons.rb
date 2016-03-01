# page object for lessons
class Lessons
  include Capybara::DSL

  def initialize(lessons)
    @title ||= lessons[:title]
    @day ||= lessons[:day]
  end

  def open
    click_on 'Lessons'
  end

  def on_lesson_list_page?
    has_css?('.btn', text: 'Add Lesson')
  end

  def open_add_lesson
    click_on 'Add Lesson'
    find('#lesson_title')
  end

  def add
    open_add_lesson
    fill_in 'lesson[title]', with: @title
    fill_in 'lesson[day_in_treatment]', with: @day
    click_on 'Create Lesson'
  end

  def visible?
    find('.table').has_css?('td', text: @title)
  end

  def read_lesson(lesson, slide)
    open_lesson(lesson)
    find('.ui-sortable', text: slide)
  end

  def open_edit_lesson(lesson)
    find('tr', text: lesson).find('.fa-pencil').click
  end

  def edit_lesson(lesson, new_title)
    open_edit_lesson(lesson)
    fill_in 'lesson[title]', with: new_title
    click_on 'Update Lesson'
  end

  def delete_lesson(lesson)
    find('tr', text: lesson).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{lesson}?"
    find('.alert-info', text: 'Lesson deleted')
  end

  def navigate_with_breadcrumbs(lesson, slide)
    open_lesson(lesson)
    click_on slide
    find('h2', text: slide)
    within('.breadcrumb') { click_on lesson }
    find('h2', text: lesson)
    within('.breadcrumb') { click_on 'Lessons' }
    assert_on_page
  end

  def open_lesson(lesson)
    click_on lesson
    find('h2', text: lesson)
  end
end
