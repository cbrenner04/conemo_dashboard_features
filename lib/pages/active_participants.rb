# page object for active participants
class ActiveParticipants
  include Capybara::DSL

  def open
    click_on 'Active Participants'
  end

  def create_contact_for(id)
    pt_row(id).find('a', text: 'create').click
  end

  def pt_row(id)
    find('tr', text: "Last-#{id}, First")
  end

  def reschedule_appt_for(id)
    pt_row(id).find('.reschedule-link').click
  end

  def visible?
    has_css?('h1', text: 'Manage Active Participants')
  end

  def reschedule
    find('h1', text: 'Reschedule')
    @resch_time = DateTime.now + 2
    update_date_time((0..4).to_a, @resch_time)
    reason = ["Patient didn't come", 'Patient asked to reschedule',
              'NA asked to reschedule', 'Other (specify below)'].sample
    select reason, from: 'first_contact[patient_contacts_attributes][0]' \
                         '[contact_reason]'
    fill_in 'first_contact[patient_contacts_attributes][0][note]',
            with: 'Reasoning'
    click_on 'Save'
  end

  def rescheduled?
    pt_row(id)
      .find('td', text: "#{@resch_time.strftime('%d %b %H:%M')}" \
                        ' / Test Location')
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

  def record_date_contact
    update_date_time((0..4).to_a, DateTime.now)
  end

  def next_contact
    DateTime.now + 2
  end

  def schedule_next_contact
    update_date_time((5..9).to_a, next_contact)
  end
end
