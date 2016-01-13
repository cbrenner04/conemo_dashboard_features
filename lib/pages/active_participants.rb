# page object for active participants
class ActiveParticipants
  include Capybara::DSL

  def open
    click_on 'Active Participants'
  end
end
