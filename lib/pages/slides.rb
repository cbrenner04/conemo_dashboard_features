# frozen_string_literal: true
require './lib/pages/lessons'
require './lib/pages/navigation'

# page object for slides
class Slides
  include Capybara::DSL

  def initialize(slides)
    @lesson ||= slides[:lesson]
    @title ||= slides[:title]
    @body ||= slides[:body]
    @locale ||= slides.fetch(:locale, 'english')
  end

  def open_add_slide
    lessons.open_lesson(@lesson)
    click_on 'Add Slide'
    find('#slide_title')
  end

  def add
    open_add_slide
    fill_in 'slide[title]', with: @title
    find('.cke_contents').click
    find('#cke_53').click
    # updated from `navigation.submit` for Poltergeist
    find('input[value = "Save"]').click
  end

  def visible?
    has_css?('.table', text: @title)
  end

  def open_edit
    lessons.open_lesson(@lesson)
    find('tr', text: @title).find('.fa-pencil').click
  end

  def edit
    fill_in 'slide[title]', with: @title
    # updated from `navigation.submit` for Poltergeist
    find('input[value = "Save"]').click
  end

  def view
    lessons.open_lesson(@lesson)
    click_on @title
    find('h2', text: @title)
    find('p', text: @body)
  end

  def delete
    lessons.open_lesson(@lesson)
    find('tr', text: @title).find('.fa-trash-o').click
    accept_alert "Are you sure you want to delete #{@title}?"
    find('.alert-info', text: 'Slide deleted')
  end

  def navigate_with_breadcrumbs
    lessons.open_lesson(@lesson)
    click_on @title
    find('h2', text: @title)
    within_breadcrumbs_click_on(@lesson)
    find('h2', text: @lesson)
    within_breadcrumbs_click_on('Lessons')
  end

  private

  def lessons
    Lessons.new(title: @lesson)
  end

  def navigation
    Navigation.new(locale: @locale)
  end

  def within_breadcrumbs_click_on(link)
    within('.breadcrumb') { click_on link }
  end
end
