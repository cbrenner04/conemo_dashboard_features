# page object for active participants
class ActiveParticipants
  include Capybara::DSL

  def open
    click_on 'Active Participants'
  end

  def create_contact_for(id)
    row_for(id).find('.fa-plus-circle').click
  end

  def row_for(id)
    find('tr', text: "Last-#{id}, First")
  end

  def reschedule_appt_for(id)
    row_for(id).find('.reschedule-link').click
  end

  def visible?
    find('h1', text: 'Manage Active Participants')
  end
end
