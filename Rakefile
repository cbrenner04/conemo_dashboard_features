# frozen_string_literal: true
# filename: Rakefile

# load development version of app locally with selenium_fixtures
desc "Set up and start 'CONEMO Dashboard' for testing locally"
task :load_app_local do
  Dir.chdir("#{ENV['Path']}/conemo_dashboard/") do
    system('rake db:drop db:create db:migrate')
    system('rake selenium_seed:with_fixtures')
    system('rake alerts:connectivity')
    system('rake alerts:adherence')
    system('rails s')
  end
end
