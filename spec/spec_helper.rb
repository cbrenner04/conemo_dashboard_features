# filename: ./spec/spec_helper.rb

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'

# RSpec configuration options
RSpec.configure do |config|
  config.full_backtrace = false
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.run_all_when_everything_filtered = true
  config.profile_examples = 10
  config.register_ordering(:global) do |list|
    list.sort_by do |group|
      case group.metadata[:metadata]
      when :very_first then 10
      when :first then 20
      when :last then 40
      else 30
      end
    end
  end
end

# Capybara configuration options
Capybara.configure do |config|
  config.default_max_wait_time = 1
  config.register_driver :selenium do |app|
    Selenium::WebDriver::Firefox::Binary.path = ENV['Firefox_Path']
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
  config.default_driver = :selenium
  config.page.driver.browser.manage.window.resize_to(1280, 743)
  # this is deprecated but currently it only saves pages to this path
  config.save_and_open_page_path = 'spec/screenshots/'
end

# capybara-screenshot configuration options
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  example.description.tr(' ', '-').gsub(/^.*\/spe \//, ')')
end
Capybara::Screenshot.prune_strategy = :keep_last_run
