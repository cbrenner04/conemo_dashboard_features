# frozen_string_literal: true
# filename: ./spec/features/admin/csv_spec.rb

require 'uuid'
require 'fileutils'
require 'csv'
Dir['./lib/pages/admin/csvs/*.rb'].each { |file| require file }

def check_size_and_headers(file, headers)
  @driver.get "#{ENV['Base_URL']}/admin/#{file}/export?locale=en"
  @driver.find_element(css: '.btn-primary').click
  new_file = "#{@download_dir}/#{file}_#{now.strftime('%Y-%m-%d_%Hh%Mm%S')}.csv"
  File.size(new_file).should be > 0
  CSV.read(new_file).include?(headers).should == true
end

feature 'Admin downloads, checks csv', :browser, metadata: :not_first do
  before(:all) do
    @download_dir = File.join(Dir.pwd, UUID.new.generate)
    FileUtils.mkdir_p @download_dir

    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.download.dir'] = @download_dir
    profile['browser.download.folderList'] = 2
    profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv'
    profile['pdfs.disabled'] = true
    @driver = Selenium::WebDriver.for :firefox, profile: profile

    @driver.get "#{ENV['Base_URL']}/users/sign_in"
    @driver.find_element(id: 'user_email').send_keys(ENV['EN_Admin_Email'])
    @driver
      .find_element(id: 'user_password').send_keys(ENV['EN_Admin_Password'])
    @driver.find_element(css: '.btn-primary').click
  end

  after(:all) do
    @driver.quit
    FileUtils.rm_rf @download_dir
  end

  scenario 'for lessons' do
    check_size_and_headers('lesson', LessonsCSV::HEADERS)
  end

  # will fail for now - as export has been removed for admin
  skip 'for devices' do
    check_size_and_headers('device', DevicesCSV::HEADERS)
  end

  # will fail for now - as export has been removed for admin
  skip 'for participants' do
    check_size_and_headers('participant', ParticipantsCSV::HEADERS)
  end

  scenario 'for admin' do
    check_size_and_headers('admin', AdminCSV::HEADERS)
  end

  scenario 'for nurses' do
    check_size_and_headers('nurse', NursesCSV::HEADERS)
  end

  scenario 'for supervisors' do
    check_size_and_headers('nurse_supervisor', SupervisorsCSV::HEADERS)
  end
end
