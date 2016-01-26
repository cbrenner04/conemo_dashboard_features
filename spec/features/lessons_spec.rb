# filename: ./spec/features/lessons_spec.rb

# require page objects, these are instantiated in the feature_helper.rb
require './lib/pages/login'
require './lib/pages/navigation'

# require page object specific to lessons and instantiate
require './lib/pages/lessons'

def lessons
  @lessons ||= Lessons.new
end

describe 'An authorized admin logs in,' \
         'navigates to the lessons page', type: :feature do
  before do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    lessons.open
    lessons.assert_on_page
  end

  it 'cancels adding a lesson' do
    lessons.open_add_lesson
    navigation.cancel
    lessons.assert_on_page
  end

  it 'adds a lesson' do
    lessons.add_a_lesson('New Lesson', '15')
    expect(lessons).to have_lesson_visible('New Lesson')
  end

  it 'cancels adding a slide' do
    lessons.open_add_slide('Lesson 3')
    navigation.cancel
    expect(lessons).to have_slide_visible('Slide 1')
  end

  it 'adds a slide' do
    lessons.add_a_slide('Lesson 11', 'New Slide', 'This is the slide body')
    expect(lessons).to have_slide_visible('New Slide')
  end

  it 'reads a lesson' do
    lessons.read_lesson('Lesson 5', 'Slide 1')
  end

  it 'reads a slide' do
    lessons.read_slide('Lessons 6', 'Slide 1', 'read this')
  end

  it 'cancels editing a lesson' do
    lessons.open_edit_lesson('Lesson 7')
    navigation.cancel
    lessons.assert_on_page
  end

  it 'edits a lesson' do
    lessons.edit_lesson('Lesson 12', 'Edited Lesson')
    expect(lessons).to have_lesson_visible('Edited Lesson')
  end

  it 'cancels editing a slide' do
    lessons.open_edit_slide('Lesson 2', 'Slide 1')
    navigation.cancel
    expect(lessons).to have_slide_visible('Slide 2')
  end

  it 'edits a slide' do
    lessons.edit_slide('Lesson 13', 'Slide 2', 'Edited Slide')
    expect(lessons).to have_slide_visible('Edited Slide')
  end

  it 'deletes a lesson' do
    lessons.delete_lesson('Lesson 14')
    expect(lessons).to_not have_lesson_visible('Lesson 14')
  end

  it 'deletes a slide' do
    lessons.delete_slide('Lesson 15', 'Slide 1')
    expect(lessons).to_not have_slide_visible('Lesson 15')
  end

  it 'cancels adding a dialogue' do

  end

  it 'adds a dialogue' do

  end

  it 'reads a dialogue' do

  end

  it 'cancels editing a dialogue' do

  end

  it 'edits a dialogue' do

  end

  it 'deletes a dialogue' do

  end

  it 'navigates using breadcrumbs' do

  end
end
