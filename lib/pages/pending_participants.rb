require './lib/pages/translations/pending_participants.rb'

# page object for pending participants
class PendingParticipants
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::PendingParticipants

  def initialize(pending_participant)
    @name ||= pending_participant[:name]
    @locale ||= pending_participant.fetch(:locale, 'english')
  end

  def open
    click_on main_button
  end

  def has_landing_page_visible?
    has_css?('h3', text: main_heading) &&
      has_css?('.panel-heading', text: 'Unassigned participants')
  end

  def activate
    select_button(@name, '.fa-thumbs-up')
  end

  def activated?
    has_text? 'Successfully activated participant'
  end

  def disqualify
    select_button(@name, '.fa-thumbs-down')
  end

  def confirm_disqualify
    accept_alert disqualify_alert
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
    find('th', match: :first)
    table_headings = all('th')
    actual = (0..4).map { |i| table_headings[i].text }
    expect(actual).to match(expected_pending_headers)
  end

  def has_pending_participant_table_title?
    has_text? localize(
      spanish: 'Participantes no asignados',
      portuguese: 'Participantes pendentes',
      english: 'Pending participants'
    )
  end

  private

  def select_button(name, button)
    within('tr', text: name) { find(button).click }
  end
end
