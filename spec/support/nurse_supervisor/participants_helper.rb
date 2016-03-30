# filename: ./spec/support/nurse_supervisor/participant_helper.rb

require './lib/pages/supervisor_page'

def nurse_supervisor
  @nurse_supervisor ||= SupervisorPage.new
end
