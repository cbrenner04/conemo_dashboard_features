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

  scenario 'Admin adds a lesson without activity planning' do
    new_lesson.add

    expect(new_lesson).to be_visible
  end

  scenario 'Admin adds a lesson with activity planning' do
    activity_lesson.add_with_activity_planning

    expect(activity_lesson).to be_visible
  end

  scenario 'Admin cancels adding a slide' do
    slides.open_add_slide
    navigation.cancel

    expect(slides).to be_visible
  end

  scenario 'Admin adds a slide' do
    new_slide.add

    expect(new_slide).to be_visible
  end

  scenario 'Admin reads a lesson' do
    lesson_5.view
  end

  scenario 'Admin reads a slide' do
    lesson_6_slide_1.view
  end

  scenario 'Admin cancels editing a lesson' do
    lesson_7.open_edit
    navigation.cancel

    expect(lessons).to be_on_lesson_list_page
  end

  scenario 'Admin edits a lesson' do
    lesson_12.edit

    expect(lesson_12).to be_visible
  end

  scenario 'Admin cancels editing a slide' do
    lesson_2_slide_1.open_edit
    navigation.cancel

    expect(lesson_2_slide_2).to be_visible
  end

  scenario 'Admin edits a slide' do
    lesson_13_slide_2.edit

    expect(lesson_13_slide_2).to be_visible
  end

  scenario 'Admin deletes a slide' do
    lesson_15_slide_1.delete

    expect(lesson_15_slide_1).to_not be_visible
  end

  scenario 'Admin navigates using breadcrumbs' do
    lesson_8_slide_3.navigate_with_breadcrumbs

    expect(lessons).to be_on_lesson_list_page
  end
end

feature 'Spanish Admin, Lessons' do
  scenario 'Admin deletes a lesson' do
    spanish_admin.sign_in
    spanish_lessons.open
    spanish_lesson.delete

    expect(spanish_lesson).to_not be_visible
  end
end
