require './lib/pages/active_participants'

class ActiveParticipants
  # page object for first contact page of active participants
  class FirstContact
    include Capybara::DSL

    def active_participants
      @active_pt ||= ActiveParticipants.new
    end

    def enter_first_appt_location
      fill_in 'first_contact[first_appointment_location]',
              with: '100 West Ln, Chicago, IL 60601'
    end

    def visible?
      find('td',
           text: "#{active_pt.next_contact.strftime('%d %b %H:%M')}" \
                       ' / 100 West Ln, Chicago, IL 60601')
      find('.fa-plus-circle')
      find('.reschedule-link')
    end
  end
end
