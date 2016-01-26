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
    lessons.add_a_slide('Lesson 11', 'New Slide')
    expect(lessons).to have_slide_visible('New Slide')
  end

  it 'reads a lesson' do
    lessons.read_lesson('Lesson 5', 'Slide 1')
  end

  it 'reads a slide' do
    lessons.read_slide('Lesson 6', 'Slide 1', 'read this')
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
    lessons.open_add_dialogue
    navigation.cancel
    expect(lessons).to be_on_dialogues_page
  end

  it 'cannot submit dialogue without title' do
    lessons.open_add_dialogue
    lessons.add_dialogue_day('5')
    lessons.add_dialogue_message('Dialogue Message')
    lessons.add_dialogue_yes_text('Yes')
    lessons.add_dialogue_no_text('No')
    lessons.submit_new_dialogue

    expect(lessons).to_not be_on_dialogues_page
  end

  it 'cannot submit dialogue with non-integer in day in treatment' do
    lessons.open_add_dialogue
    lessons.add_dialogue_title('New Dialogue')
    lessons.add_dialogue_day('asdf')
    lessons.add_dialogue_message('Dialogue Message')
    lessons.add_dialogue_yes_text('Yes')
    lessons.add_dialogue_no_text('No')
    lessons.submit_new_dialogue

    expect(lessons).to_not be_on_dialogues_page
  end

  it 'cannot submit dialogue without day in treatment' do
    lessons.open_add_dialogue
    lessons.add_dialogue_title('New Dialogue')
    lessons.add_dialogue_message('Dialogue Message')
    lessons.add_dialogue_yes_text('Yes')
    lessons.add_dialogue_no_text('No')
    lessons.submit_new_dialogue

    expect(lessons).to_not be_on_dialogues_page
  end

  it 'cannot submit dialogue without message' do
    lessons.open_add_dialogue
    lessons.add_dialogue_title('New Dialogue')
    lessons.add_dialogue_day('5')
    lessons.add_dialogue_yes_text('Yes')
    lessons.add_dialogue_no_text('No')
    lessons.submit_new_dialogue

    expect(lessons).to_not be_on_dialogues_page
  end

  it 'cannot submit dialogue without yes text' do
    lessons.open_add_dialogue
    lessons.add_dialogue_title('New Dialogue')
    lessons.add_dialogue_day('5')
    lessons.add_dialogue_message('Dialogue Message')
    lessons.add_dialogue_no_text('No')
    lessons.submit_new_dialogue

    expect(lessons).to_not be_on_dialogues_page
  end

  it 'cannot submit dialogue without no text' do
    lessons.open_add_dialogue
    lessons.add_dialogue_title('New Dialogue')
    lessons.add_dialogue_day('5')
    lessons.add_dialogue_message('Dialogue Message')
    lessons.add_dialogue_yes_text('Yes')
    lessons.submit_new_dialogue

    expect(lessons).to_not be_on_dialogues_page
  end

  it 'adds a dialogue' do
    lessons.add_dialogue('New Dialogue', '5', 'Dialogue Message', 'Yes', 'No')
    expect(lessons).to have_dialogue_visible('New Dialogue')
  end

  it 'reads a dialogue' do
    lessons.read_dialogue('Day 1', 'Hey! This is dailogue 1')
  end

  it 'cancels editing a dialogue' do
    lessons.open_edit_dialogue('Day 2')
    navigation.cancel
    expect(lessons).to be_on_dialogues_page
  end

  it 'edits a dialogue' do
    lessons.edit_dialogue('Day 3', 'Edited Dialogue')
    expect(lessons).to have_dialogue_visible('Edited Dialogue')
  end

  it 'deletes a dialogue' do
    lessons.delete_dialogue('Day 4')
    expect(lessons).to_not have_dialogue_visible('Day 4')
  end

  it 'navigates using breadcrumbs' do
    lessons.navigate_with_breadcrumbs('Lesson 8', 'Slide 3')
  end
end
