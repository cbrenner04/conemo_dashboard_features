# filename: ./spec/features/admin/csv_spec.rb

require 'uuid'
require 'fileutils'
require 'csv'
Dir['./lib/pages/administration/csvs/*.rb'].each { |file| require file }

def check_file(file, headers)
  @driver.get "#{ENV['Base_URL']}/admin/#{file}/export?locale=en"
  @driver.find_element(css: '.btn-primary').click
  f = "#{@download_dir}/#{file}_#{Time.now.strftime('%Y-%m-%d_%Hh%Mm%S')}.csv"
  File.size(f).should be > 0
  csv_data = CSV.read(f)
  csv_data.include?(headers).should == true
end

feature 'Admin downloads, checks csv', metadata: :not_first do
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
    check_file('lesson', LessonsCSV::HEADERS)
  end

  scenario 'for devices' do
    check_file('device', DevicesCSV::HEADERS)
  end

  scenario 'for participants' do
    check_file('participant', ParticipantsCSV::HEADERS)
  end

  scenario 'for admin' do
    check_file('admin', AdminCSV::HEADERS)
  end

  scenario 'for nurses' do
    check_file('nurse', NursesCSV::HEADERS)
  end

  scenario 'for supervisors' do
    check_file('nurse_supervisor', SupervisorsCSV::HEADERS)
  end
end
