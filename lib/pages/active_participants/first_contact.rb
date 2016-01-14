class ActiveParticipants
  # page object for first contact page of active participants
  class FirstContact
    include Capybara::DSL

    def record_date_contact
      contact_datetime = DateTime.now
      update_date_time((0..4).to_a, contact_datetime)
    end

    def assign_date_first_appointment
      @appt_datetime = DateTime.now + 2
      update_date_time((5..9).to_a, @appt_datetime)
    end

    def enter_first_appt_location
      fill_in 'first_contact[first_appointment_location]',
              with: '100 West Ln, Chicago, IL 60601'
    end

    def submit
      click_on 'Save'
    end

    def cancel
      click_on 'Cancel'
    end

    def visible?
      find('td', text: "#{@appt_datetime.strftime('%d %b %H:%M')}" \
                       ' / 100 West Ln, Chicago, IL 60601')
      find('.fa-plus-circle')
      find('.reschedule-link')
    end

    private

    def update_date_time(i, datetime)
      find('h1', text: 'First Contact')
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
