# filename: ./spec/features/super_user/csvs_spec.rb

require 'uuid'
require 'fileutils'
require 'csv'

def check_file(file) # , headers)
  @driver.get "#{ENV['Base_URL']}/admin/#{file}/export?locale=en"
  @driver.find_element(css: '.btn-primary').click
  f = "#{@download_dir}/#{file}_#{Time.now.strftime('%Y-%m-%d_%Hh%Mm%S')}.csv"
  File.size(f).should be > 0
  # csv_data = CSV.read(f)
  # csv_data.include?(headers).should == true
end

feature 'Super User, checks csv', metadata: :not_first do
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
    @driver.find_element(id: 'user_email').send_keys(ENV['SuperUser_Email'])
    @driver
      .find_element(id: 'user_password').send_keys(ENV['SuperUser_Password'])
    @driver.find_element(css: '.btn-primary').click
  end

  after(:all) do
    @driver.quit
    FileUtils.rm_rf @download_dir
  end

  scenario 'for authentication tokens table' do
    check_file('token_auth~authentication_token')
  end

  scenario 'for participants table' do
    check_file('participant')
  end

  scenario 'for users table' do
    check_file('user')
  end

  scenario 'for admin table' do
    check_file('admin')
  end

  scenario 'for nurse table' do
    check_file('nurse')
  end

  scenario 'for nurse supervisor table' do
    check_file('nurse_supervisor')
  end

  scenario 'for content access events table' do
    check_file('content_access_event')
  end

  scenario 'for devices table' do
    check_file('device')
  end

  scenario 'for help messages table' do
    check_file('help_message')
  end

  scenario 'for logins table' do
    check_file('login')
  end

  scenario 'for participant start dates table' do
    check_file('participant_start_date')
  end

  scenario 'for planned activities table' do
    check_file('planned_activity')
  end

  scenario 'for responses table' do
    check_file('response')
  end

  scenario 'for session events table' do
    check_file('session_event')
  end

  scenario 'for final in person appointment table' do
    check_file('final_appointment')
  end

  scenario 'for initial in person appointments table' do
    check_file('first_appointment')
  end

  scenario 'for confirmation calls table' do
    check_file('first_contact')
  end

  scenario 'for tasks table' do
    check_file('nurse_task')
  end

  scenario 'for additional notes table' do
    check_file('patient_contact')
  end

  scenario 'for follow up call week 1 table' do
    check_file('second_contact')
  end

  scenario 'for smartphones table' do
    check_file('smartphone')
  end

  scenario 'for follow up call week 3 table' do
    check_file('third_contact')
  end

  scenario 'for lessons table' do
    check_file('lesson')
  end

  scenario 'for past device assignments' do
    check_file('past_device_assignment')
  end
end
