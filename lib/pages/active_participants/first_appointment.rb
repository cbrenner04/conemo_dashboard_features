require './lib/pages/active_participants'

class ActiveParticipants
  # page object for the First Appointment Form in Active Participants
  class FirstAppointment
    include Capybara::DSL

    def active_pt
      @active_pt ||= ActiveParticipants.new
    end

    def enter_time_location_next_time
      find('h1', text: 'First Appointment')
      active_pt.record_date_contact
      fill_in 'first_appointment[appointment_location]',
              with: '100 N Ln, Chicago, IL 60601'
      active_pt.schedule_next_contact
    end

    def enter_session_length(time)
      fill_in 'first_appointment[session_length]', with: time
    end

    def select_pt_comfort_with_phone
      selector = page.all('.select2-container')
      selector[10].click
      comfort = [
        '4 – Patient can turn on the cell phone',
        '3 – After FIRST demonstration patient needs help',
        '2 – After SECOND demonstration patient needs help',
        '1 – Continues to have difficulties after THIRD demonstration'
      ].sample
      active_pt.select_item(comfort)
    end

    def enter_phone_note
      fill_in 'first_appointment[smart_phone_comfort_note]',
              with: 'Taking phone notes is boring'
    end

    def select_engagement
      selector = page.all('.select2-container')
      selector[11].click
      engagement = ['3 – Very engaged', '2 – More or less engaged',
                    '1 – Not engaged'].sample
      active_pt.select_item(engagement)
    end

    def select_chances
      selector = page.all('.select2-container')
      selector[12].click
      chance = ['3 – high chance', '2 – 50/50 chance', '1 – low chance'].sample
      active_pt.select_item(chance)
    end

    def enter_general_notes
      fill_in 'first_appointment[notes]', with: 'Who takes notes?'
    end

    def created_for_participant?(id)
      active_pt.pt_row(id).has_css?('.fa-check-circle', count: 2)
      active_pt.pt_row(id)
        .find('td', text: "#{active_pt.next_contact.strftime('%d %b %H:%M')}")
    end
  end
end
