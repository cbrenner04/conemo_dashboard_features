# page object for pending participants
class PendingParticipants
  include Capybara::DSL

  def open
    click_on 'Pending Participants'
  end

  def visible?
    has_css?('h1', text: 'Pending Participants')
  end

  def activate(name)
    select_button(name, '.fa-thumbs-up')
  end

  def assign_nurse
    click_on 'Save'
  end

  def disqualify(name)
    select_button(name, '.fa-thumbs-down')
  end

  def confirm_disqualify
    page.accept_alert 'Are you sure you want to mark this person as ineligible?'
  end

  def select_ineligible_tab
    click_on 'Ineligible'
  end

  def select_edit(name)
    select_button(name, '.fa-edit')
  end

  def create
    click_on 'ADD NEW PARTICIPANT'
  end

  private

  def select_button(name, button)
    within('tr', text: name) { find(button).click }
  end
end
