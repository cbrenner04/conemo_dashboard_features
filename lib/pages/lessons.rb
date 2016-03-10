# page object for lessons
class Lessons
  include Capybara::DSL

  def initialize(lessons)
    @title ||= lessons[:title]
    @day ||= lessons[:day]
    @new_title ||= lessons[:new_title]
    @slide ||= lessons[:slide]
    @locale ||= lessons[:locale]
  end

  def open
    button = @locale == 'spanish' ? 'Sesiones' : 'Lessons'
    click_on button
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
    enter_title_and_tx_day
    create
  end

  def add_with_activity_planning
    open_add_lesson
    enter_title_and_tx_day
    choose 'Yes'
    fill_in 'lesson[pre_planning_content]', with: 'You should plan an activity'
    fill_in 'lesson[activity_choices]', with: "Act. 1\nAct. 2\nAct. 3"
    fill_in 'lesson[post_planning_content]', with: 'Planning is good'
    fill_in 'lesson[non_planning_content]', with: 'You should really plan'
    fill_in 'lesson[feedback_after_days]', with: 2
    fill_in 'lesson[planning_response_yes_content]', with: 'Great job!'
    fill_in 'lesson[planning_response_no_content]', with: 'No good'
    fill_in 'lesson[non_planning_response_content]', with: 'You should answer'
    create
  end

  def visible?
    lesson_title = @new_title.nil? ? @title : @new_title
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
    accept_alert "Are you sure you want to delete #{@title} ?"
    alert = @locale == 'spanish' ? 'Sesión eliminada' : 'Lesson deleted'
    find('.alert-info', text: alert)
  end

  def open_lesson(lesson)
    click_on lesson
    find('h2', text: lesson)
  end

  private

  def enter_title_and_tx_day
    fill_in 'lesson[title]', with: @title
    fill_in 'lesson[day_in_treatment]', with: @day
  end

  def create
    click_on 'Create Lesson'
  end
end
