require './lib/pages/active_participants'

class ActiveParticipants
  # page object for first contact page of active participants
  class FirstContact
    include Capybara::DSL

    def active_pt
      @active_pt ||= ActiveParticipants.new
    end

    def enter_first_appt_location
      fill_in 'first_contact[first_appointment_location]',
              with: '100 West Ln, Chicago, IL 60601'
    end

    def assert_on_page
      find('h1', text: 'First Contact')
    end

    def visible?
      find('td',
           text: "#{DateTime.now.strftime('%d %b %H:%M')}" \
                       ' / 100 West Ln, Chicago, IL 60601')
      find('.fa-plus-circle')
      find('.reschedule-link')
    end
  end
end
