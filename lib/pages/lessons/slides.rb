require './lib/pages/lessons'
require './lib/pages/navigation'

class Lessons
  # page object for slides
  class Slides
    include Capybara::DSL

    def initialize(slides)
      @lesson ||= slides[:lesson]
      @title ||= slides[:title]
      @body ||= slides[:body]
      @new_title ||= slides[:new_title]
      @locale ||= slides[:locale]
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
      navigation.submit
    end

    def visible?
      slide_title = @new_title.nil? ? @title : @new_title
      has_css?('.table', text: slide_title)
    end

    def open_edit
      lessons.open_lesson(@lesson)
      find('tr', text: @title).find('.fa-pencil').click
    end

    def edit
      open_edit
      fill_in 'slide[title]', with: @new_title
      navigation.submit
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
      within('.breadcrumb') { click_on @lesson }
      find('h2', text: @lesson)
      within('.breadcrumb') { click_on 'Lessons' }
    end

    private

    def lessons
      @lessons ||= Lessons.new(title: 'fake')
    end

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
