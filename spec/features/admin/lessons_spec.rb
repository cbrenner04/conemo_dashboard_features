# filename: ./spec/features/lessons_spec.rb

require './spec/support/admin/lessons_helper'

feature 'Admin, Lessons' do
  background do
    english_admin.sign_in
    lessons.open
    
    expect(lessons).to be_on_lesson_list_page
  end

  scenario 'Admin cancels adding a lesson' do
    lessons.open_add_lesson
    navigation.cancel
    
    expect(lessons).to be_on_lesson_list_page
  end

  scenario 'Admin adds a lesson' do
    lessons.add_a_lesson('New Lesson', '15')
    expect(lessons).to have_lesson_visible('New Lesson')
  end

  scenario 'Admin cancels adding a slide' do
    lessons.open_add_slide('Lesson 3')
    navigation.cancel
    expect(lessons).to have_slide_visible('Slide 1')
  end

  scenario 'Admin adds a slide' do
    lessons.add_a_slide('Lesson 11', 'New Slide')
    expect(lessons).to have_slide_visible('New Slide')
  end

  scenario 'Admin reads a lesson' do
    lessons.read_lesson('Lesson 5', 'Slide 1')
  end

  scenario 'Admin reads a slide' do
    lessons.read_slide('Lesson 6', 'Slide 1', 'read this')
  end

  scenario 'Admin cancels editing a lesson' do
    lessons.open_edit_lesson('Lesson 7')
    navigation.cancel
    lessons.assert_on_page
  end

  scenario 'Admin edits a lesson' do
    lessons.edit_lesson('Lesson 12', 'Edited Lesson')
    expect(lessons).to have_lesson_visible('Edited Lesson')
  end

  scenario 'Admin cancels editing a slide' do
    lessons.open_edit_slide('Lesson 2', 'Slide 1')
    navigation.cancel
    expect(lessons).to have_slide_visible('Slide 2')
  end

  scenario 'Admin edits a slide' do
    lessons.edit_slide('Lesson 13', 'Slide 2', 'Edited Slide')
    expect(lessons).to have_slide_visible('Edited Slide')
  end

  scenario 'Admin deletes a lesson' do
    lessons.delete_lesson('Lesson 14')
    expect(lessons).to_not have_lesson_visible('Lesson 14')
  end

  scenario 'Admin deletes a slide' do
    lessons.delete_slide('Lesson 15', 'Slide 1')
    expect(lessons).to_not have_slide_visible('Lesson 15')
  end

  scenario 'Admin navigates using breadcrumbs' do
    lessons.navigate_with_breadcrumbs('Lesson 8', 'Slide 3')
  end
end
