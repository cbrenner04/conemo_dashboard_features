require './lib/pages/shared/translations/pending_participants.rb'

# page object for pending participants
class PendingParticipants
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::PendingParticipants

  def initialize(pending_participant)
    @name ||= pending_participant[:name]
    @locale ||= pending_participant[:locale]
  end

  def open
    click_on main_button
  end

  def has_landing_page_visible?
    has_css?('h1', text: main_heading) && has_css?('#pending')
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
    accept_alert 'Are you sure you want to mark this person as ineligible?'
  end

  def select_ineligible_tab
    click_on ineligible_button
  end

  def select_edit
    select_button(@name, '.fa-edit')
  end

  def create
    click_on create_button
  end

  def visible?
    has_text? @name
  end

  def has_pending_table_headers?
    actual = (0..5).map { |i| find('#pending').all('th')[i].text }

    expect(actual).to match(expected_pending_headers)
  end

  def has_ineligible_table_headers?
    actual = (0..4).map { |i| find('#ineligible').all('th')[i].text }

    expect(actual).to match(expected_ineligible_headers)
  end

  private

  def select_button(name, button)
    within('tr', text: name) { find(button).click }
  end
end
