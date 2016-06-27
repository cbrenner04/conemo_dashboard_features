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
    inputs = ['pre_planning_content', 'activity_choices',
              'post_planning_content', 'non_planning_content',
              'feedback_after_days', 'planning_response_yes_content',
              'planning_response_no_content', 'non_planning_response_content']
    responses = ['You should plan an activity', "Act. 1\nAct. 2\nAct. 3",
                 'Planning is good', 'You should really plan', 2, 'Great job!',
                 'No good', 'You should answer']
    inputs.zip(responses) do |input, response|
      fill_in "lesson[#{input}]", with: response
    end
    navigation.submit
  end

  def visible?
    find('.table').has_css?('td', text: @title)
  end

  def view
    open_lesson(@title)
    find('.ui-sortable', text: @slide)
  end

  def open_edit
    find('tr', text: @title).find('.fa-pencil').click
  end

  def edit
    fill_in 'lesson[title]', with: @title
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
    Navigation.new(locale: @locale)
  end
end
