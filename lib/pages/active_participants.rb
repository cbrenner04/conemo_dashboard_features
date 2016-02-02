# page object for active participants
class ActiveParticipants
  include RSpec::Matchers
  include Capybara::DSL

  def open
    click_on 'Active Participants'
  end

  def assert_on_page
    find('h1', text: 'Manage Active Participants')
  end

  def pt_row(id)
    find('tr', text: "Last-#{id}, First")
  end

  def create_contact_for(id)
    pt_row(id).find('a', text: 'create').click
  end

  def reschedule_appt_for(id)
    pt_row(id).find('.reschedule-link').click
  end

  def visible?
    has_css?('h1', text: 'Manage Active Participants')
  end

  def reschedule(contact)
    find('h1', text: 'Reschedule')
    contact_replacements = { 'first_appointment' => 'first_contact',
                             'second_contact' => 'first_appointment',
                             'third_contact' => 'second_contact',
                             'final_appointment' => 'third_contact' }
    reason = ["Patient didn't come", 'Patient asked to reschedule',
              'NA asked to reschedule', 'Other (specify below)'].sample
    select reason, from: "#{contact_replacements[contact]}" \
                         '[patient_contacts_attributes][0][contact_reason]'
    fill_in "#{contact_replacements[contact]}[patient_contacts_attributes][0]" \
            '[note]', with: 'Reasoning'
    click_on 'Save'
  end

  def rescheduled_for?(id)
    check_date(id, DateTime.now)
    pt_row(id).find('.fa-plus-circle')
    pt_row(id).find('.reschedule-link')
  end

  def select_non_date_item(item)
    find('.select2-result-label', text: item).click
  end

  def enter_session_length(session, time)
    fill_in "#{session}[session_length]", with: time
  end

  def check_date(id, date)
    pt_row(id).find('td', text: date.strftime('%d %b'))
  end

  def select_ability
    selector = page.all('.select2-container')
    selector[10].click
    ability = ['3 - Seems to be able to use the application',
               '2 - Seems to have some difficulties',
               '1 - Seems to have great difficulty'].sample
    select_non_date_item(ability)
  end

  def select_motivation
    selector = page.all('.select2-container')
    selector[11].click
    motivation = ['3 – Very interested', '2 – Somewhat interested',
                  '1 – Not interested'].sample
    select_non_date_item(motivation)
  end

  def has_help_message_for?(id)
    pt_row(id).has_css?('.blink-me')
  end

  def has_status_for?(status, id)
    pt_row(id).has_css?(".#{status}")
  end
end
