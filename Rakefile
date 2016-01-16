# filename: Rakefile

# load development version of app locally with selenium_fixtures

desc "Set up and start 'CONEMO Dashboard' for testing locally"

task :load_app_local do
  Dir.chdir('/Users/Chris/Work/conemo_dashboard/') do
    system('rake db:drop db:create db:migrate && rake selenium_seed:with_fixtures')
    system('rails s')
  end
end
