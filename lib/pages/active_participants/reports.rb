require './lib/pages/active_participants'
require './lib/pages/active_participants/first_appointment'

class ActiveParticipants
  # page object for the reports page of active participants
  class Reports
    include Capybara::DSL
    include RSpec::Matchers

    def active_pt
      @active_pt ||= ActiveParticipants.new
    end

    def first_appt
      @first_appt ||= ActiveParticipants::FirstAppointment.new
    end

    def open_for(id)
      active_pt.pt_row(id).find('.fa-circle').click
    end

    def has_first_appt_notes_visible?
      expect(page)
        .to have_content "First Appointment\n" \
                         "#{first_appt.general_notes}\n" \
                         "#{DateTime.now.strftime('%B %d, %Y %H:%M')}"
    end
  end
end
