class ActiveParticipants
  # page object for the First Appointment Form in Active Participants
  class FirstAppointment
    include Capybara::DSL

    def cancel
      click_on 'Cancel'
    end

    def reschedule
      @datetime = DateTime.now + 2
      update_date_time((0..4).to_a, @datetime)
      reason = ["Patient didn't come", 'Patient asked to reschedule',
                'NA asked to reschedule', 'Other (specify below)'].sample
      select reason, from: 'first_contact[patient_contacts_attributes][0]' \
                           '[contact_reason]'
      fill_in 'first_contact[patient_contacts_attributes][0][note]',
              with: 'Reasoning'
      click_on 'Save'
    end

    def rescheduled?
      find('td', text: "#{@appt_datetime.strftime('%d %b %H:%M')} / Reasoning")
      find('.fa-plus-circle')
      find('.reschedule-link')
    end

    private

    def update_date_time(i, datetime)
      find('h1', text: 'Reschedule')
      selector = page.all('.select2-container')
      selector[i[0]].click
      find('.select2-result-label', text: "#{datetime.strftime('%Y')}").click
      selector[i[1]].click
      find('.select2-result-label', text: "#{datetime.strftime('%B')}").click
      selector[i[2]].click
      find('.select2-result-label', text: "#{datetime.strftime('%-d')}").click
      selector[i[3]].click
      find('.select2-result-label', text: "#{datetime.strftime('%H')}").click
      selector[i[4]].click
      find('.select2-result-label', text: "#{datetime.strftime('%M')}").click
    end
  end
end
