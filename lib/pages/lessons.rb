# page object for lessons
class Lessons
  include Capybara::DSL

  def initialize(lessons)
    @title ||= lessons[:title]
    @day ||= lessons[:day]
    @new_title ||= lessons[:new_title]
    @slide ||= lessons[:slide]
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
    @new_title.nil? ? lesson_title = @title : lesson_title = @new_title
    find('.table').has_css?('td', text: lesson_title)
  end

  def view
    open_lesson(@title)
    find('.ui-sortable', text: @slide)
  end

  def open_edit
    find('tr', text: @title).find('.fa-pencil').click
  end

  def edit
    open_edit
    fill_in 'lesson[title]', with: @new_title
    click_on 'Update Lesson'
  end

  def delete
    find('tr', text: @title).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{@title}?"
    find('.alert-info', text: 'Lesson deleted')
  end

  def open_lesson(lesson)
    click_on lesson
    find('h2', text: lesson)
  end
end
