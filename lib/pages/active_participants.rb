# page object for active participants
class ActiveParticipants
  include Capybara::DSL
  include RSpec::Matchers

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
    @resch_time = DateTime.now + 2
    update_date_time((0..4).to_a, @resch_time)
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
    pt_row(id).find('td', text: "#{@resch_time.strftime('%d %b %H:%M')}")
    pt_row(id).find('.fa-plus-circle')
    pt_row(id).find('.reschedule-link')
  end

  def select_item(item)
    find('.select2-result-label', text: item).click
  end

  def update_date_time(i, datetime)
    selector = page.all('.select2-container')
    time_format = ['%Y', '%B', '%-d', '%H', '%M']
    (0..4).zip(time_format) do |x, y|
      selector[i[x]].click
      select_item("#{datetime.strftime(y)}")
    end
  end

  def record_time
    update_date_time((0..4).to_a, DateTime.now)
  end

  def enter_session_length(session, time)
    fill_in "#{session}[session_length]", with: time
  end

  def next_contact
    DateTime.now + 2
  end

  def schedule_next_contact
    update_date_time((5..9).to_a, next_contact)
  end

  def check_date_time(id, datetime)
    act_time = pt_row(id).find('td', text: 'create').text[7..11]
    act_hour = act_time.gsub(/:\w+/, '')
    act_min = act_time.gsub(/\w+:/, '')
    exp_hour = Time.now.strftime('%H')
    exp_min = Time.now.strftime('%M')

    subt_hour = exp_hour.to_i - act_hour.to_i
    subt_min = exp_min.to_i - act_min.to_i

    if subt_hour.between?(0, 1) && subt_min.between?(0, 1)
      pt_row(id)
        .find('td', text: "#{datetime.strftime('%d %b')} " \
                          "#{act_hour.delete(' ')}:#{act_min.delete(' ')}")
    else
      expect(subt_hour)
        .to be < 2, "Expected #{exp_hour.delete(' ')}:#{exp_min.delete(' ')}" \
                    " and actual #{act_hour.delete(' ')}:" \
                    "#{act_min.delete(' ')} time are not within 1 hour"
      expect(subt_min)
        .to be < 6, "Expected #{exp_hour.delete(' ')}:#{exp_min.delete(' ')}" \
                    " and actual #{act_hour.delete(' ')}:" \
                    "#{act_min.delete(' ')} time are not within 1 minute"
    end
  end

  def select_ability
    selector = page.all('.select2-container')
    selector[10].click
    ability = ['3 - Seems to be able to use the application',
               '2 - Seems to have some difficulties',
               '1 - Seems to have great difficulty'].sample
    select_item(ability)
  end

  def select_motivation
    selector = page.all('.select2-container')
    selector[11].click
    motivation = ['3 – Very interested', '2 – Somewhat interested',
                  '1 – Not interested'].sample
    select_item(motivation)
  end

  def has_help_message_for?(id)
    pt_row(id).has_css?('.blink-me')
  end
end
