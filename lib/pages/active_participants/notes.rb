class ActiveParticipants
  # page object for notes page of active participants
  class Notes
    include Capybara::DSL

    def open_for(id)
      find('tr', text: "Last-#{id}, First").find('.fa-pencil-square').click
    end

    def add_notes(id, datetime)
      open_for(id)
      update_date_time(datetime)
      @reason = ['Programmed follow-up call', 'Non-adherence',
                 'Requested phone call by patient', 'Other'].sample
      select @reason, from: 'patient_contact[contact_reason]'
      @note = 'Test note. How fun!'
      fill_in 'patient_contact[note]', with: @note
      click_on 'Save'
    end

    def visible?
      find('.table', text: "#{@reason} #{@note}")
    end

    def delete
      find('.table').find('.delete-note').click
      accept_alert 'Are you sure you want to delete this note?'
    end

    def has_any_note?
      find('table').has_css?('td', text: /./m)
    end

    def cancel
      click_on 'Cancel'
    end

    private

    def update_date_time(datetime)
      select "#{datetime.strftime('%Y')}",
             from: 'patient_contact[contact_at(1i)]'
      select "#{datetime.strftime('%B')}",
             from: 'patient_contact[contact_at(2i)]'
      select "#{datetime.strftime('%-d')}",
             from: 'patient_contact[contact_at(3i)]'
      select "#{datetime.strftime('%H')}",
             from: 'patient_contact[contact_at(4i)]'
      select "#{datetime.strftime('%M')}",
             from: 'patient_contact[contact_at(5i)]'
    end
  end
end
