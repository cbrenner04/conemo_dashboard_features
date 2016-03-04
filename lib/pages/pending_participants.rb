# page object for pending participants
class PendingParticipants
  include Capybara::DSL

  def initialize(pending_participant)
    @name ||= pending_participant[:name]
  end

  def open
    click_on 'Pending Participants'
  end

  def has_landing_page_visible?
    has_css?('h1', text: 'Pending Participants')
    has_css?('#pending')
  end

  def activate
    select_button(@name, '.fa-thumbs-up')
  end

  def assign_nurse
    click_on 'Save'
  end

  def disqualify
    select_button(@name, '.fa-thumbs-down')
  end

  def confirm_disqualify
    page.accept_alert 'Are you sure you want to mark this person as ineligible?'
  end

  def select_ineligible_tab
    click_on 'Ineligible'
  end

  def select_edit
    select_button(@name, '.fa-edit')
  end

  def create
    click_on 'ADD NEW PARTICIPANT'
  end

  def visible?
    has_text? @name
  end

  private

  def select_button(name, button)
    within('tr', text: name) { find(button).click }
  end
end
