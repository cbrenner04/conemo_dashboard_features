# frozen_string_literal: true
# filename: ./spec/features/feature_helper.rb

# define global method for custom click
# used when there are issues with Poltergeist
# initially written with a conditional but `.trigger('click')` is not always
# needed when using Poltergeist and `.click` is much more reliable

def custom_click(selector)
  selector.click
rescue Capybara::Poltergeist::MouseEventFailed
  selector.trigger('click')
end

# define global methods for retrying actions

def retry_action_with_scroll_down
  tries ||= 2
  yield
rescue Capybara::ElementNotFound, Selenium::WebDriver::Error::UnknownError
  navigation.scroll_down
  retry unless (tries -= 1).zero?
end

def retry_action_with_scroll_up
  tries ||= 2
  yield
rescue Capybara::ElementNotFound, Selenium::WebDriver::Error::UnknownError,
       Capybara::ModalNotFound
  navigation.scroll_up
  retry unless (tries -= 1).zero?
end

# define global methods for checking an array of elements on the page

def array_of_elements_match?(elements:, ids:, expectation:)
  actual = ids.map { |id| elements[id].text }
  actual.should =~ expectation
end

def array_of_elements_equal?(elements:, ids:, expectation:)
  actual = ids.map { |id| elements[id].text }
  expect(actual).to eq(expectation)
end
