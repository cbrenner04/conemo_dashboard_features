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
  end

  it 'cancels adding a lesson'
  it 'adds a lesson'
  it 'cancels adding a slide'
  it 'adds a slide'
  it 'reads a lesson'
  it 'reads a slide'
  it 'cancels editing a lesson'
  it 'edits a lesson'
  it 'cancels editing a slide'
  it 'edits a slide'
  it 'deletes a lesson'
  it 'deletes a slide'
  it 'adds a dialogue'
  it 'reads a dialogue'
  it 'edits a dialogue'
  it 'deletes a dialogue'
  it 'navigates using breadcrumbs from lesson'
  it 'navigates using breadcrumbs from slide'
end
