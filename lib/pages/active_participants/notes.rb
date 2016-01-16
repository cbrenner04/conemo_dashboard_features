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

    private

    def update_date_time(datetime)
      time_format = ['%Y', '%B', '%-d', '%H', '%M']
      time_format.zip(1..5) do |x, y|
        select "#{datetime.strftime(x)}",
               from: "patient_contact[contact_at(#{y}i)]"
      end
    end
  end
end
