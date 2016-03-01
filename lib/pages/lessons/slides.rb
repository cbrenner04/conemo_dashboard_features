class Lessons
  # page object for slides
  class Slides
    include Capybara::DSL

    def open_add_slide(lesson)
      open_lesson(lesson)
      click_on 'Add Slide'
      find('#slide_title')
    end

    def add_a_slide(lesson, title)
      open_add_slide(lesson)
      fill_in 'slide[title]', with: title
      find('.cke_contents').click
      find('#cke_53').click
      click_on 'Create Slide'
    end

    def has_slide_visible?(slide)
      has_css?('.table', text: slide)
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

    def read_slide(lesson, title, body)
      open_lesson(lesson)
      click_on title
      find('h2', text: title)
      find('p', text: body)
    end

    def delete_slide(lesson, slide)
      open_lesson(lesson)
      find('tr', text: slide).find('.fa-trash-o').click
      accept_alert "Are you sure you want to delete #{slide}?"
      find('.alert-info', text: 'Slide deleted')
    end
  end
end
