# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/translations/lessons'

# page object for lessons
class Lessons
  include Capybara::DSL
  include Translations::Lessons

  def initialize(lessons)
    @title ||= lessons[:title]
    @day ||= lessons[:day]
    @new_title ||= lessons[:new_title]
    @slide ||= lessons[:slide]
    @locale ||= lessons.fetch(:locale, 'english')
  end

  def open
    click_on main_button
  end

  def on_lesson_list_page?
    has_css?('#lessons')
  end

  def open_add_lesson
    click_on add_lesson_button
    find('#lesson_title')
  end

  def add
    open_add_lesson
    enter_title_and_tx_day
    navigation.submit
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
    navigation.submit
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
    navigation.submit
  end

  def delete
    find('tr', text: @title).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{@title}?"
    find('.alert-info', text: destroy_alert)
  end

  def open_lesson(lesson)
    click_on lesson
    find('h2', text: lesson)
  end

  def has_add_lesson_button?
    has_css?('.btn', text: add_lesson_button)
  end

  def has_spanish_activity_planning_true_false?
    find('tr', text: '¡Bienvenido a CONEMO!').has_css?('td', text: 'Sí') &&
      find('tr', text: 'Estar activo te ayudará').has_css?('td', text: 'No')
  end

  def has_portuguese_activity_planning_true_false?
    find('tr', text: 'Bem-vindo ao CONEMO').has_css?('td', text: 'Sim') &&
      find('tr', text: 'Sentir-se para baixo').has_css?('td', text: 'Não')
  end

  private

  def enter_title_and_tx_day
    fill_in 'lesson[title]', with: @title
    fill_in 'lesson[day_in_treatment]', with: @day
  end

  def navigation
    @navigation ||= Navigation.new(locale: @locale)
  end
end
