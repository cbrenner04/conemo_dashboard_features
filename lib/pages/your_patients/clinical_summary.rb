require './lib/pages/your_patients'
require './lib/pages/your_patients/first_appointment'
require './lib/pages/your_patients/second_contact'
require './lib/pages/your_patients/third_contact'
require './lib/pages/your_patients/final_appointment'

class YourPatients
  # page object for the reports page of active participants
  class ClinicalSummary
    include Capybara::DSL

    def initialize(clinical_summary)
      @id ||= clinical_summary[:id]
      @first_message ||= clinical_summary[:first_message]
      @second_message ||= clinical_summary[:second_message]
      @lesson ||= clinical_summary[:lesson]
    end

    def open
      find('a', text: @id).click
      click_on 'Clinical Summary'
    end

    def visible?
      has_css?('h1', text: "First Last-#{@id}")
    end

    def has_messages?
      has_text? @first_message
      has_text? @second_message
    end

    def show_number_of_logins
      find('th', text: 'Logins').click
    end

    def has_correct_logins?
      (1..4).each do |i|
        n = Date.today - i
        find('.logins-table').has_text? n.strftime('%B %d, %Y')
      end
    end

    def lesson_row
      @lesson == 1 ? all('tr:nth-child(1)')[1] : find("tr:nth-child(#{@lesson})")
    end

    def has_current_lesson?
      visible? # weird behavior if it doesn't find something first
      within('#lessons') do
        lesson_row.has_css?('.info')
        has_css?('.un-released', count: (15 - @lesson.to_i))
      end
    end

    def has_unread_lesson?
      visible? # weird behavior if it doesn't find something first
      find('#lessons').lesson_row.has_css?('.danger')
    end

    def has_late_lesson?
      visible?
      find('#lessons').lesson_row.has_css?('.warning')
    end

    def has_ontime_lesson?
      visible?
      find('#lessons').lesson_row.has_css?('.warning')
    end

    def has_first_appt_notes_visible?
      has_text? "First Appointment\n#{first_appt.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_second_contact_notes_visible?
      has_text? "Second Contact\n#{second_contact.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_third_contact_notes_visible?
      has_text? "Third Contact\n#{third_contact.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_final_appt_notes_visible?
      has_text? "Final Appointment\n#{final_appt.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    private

    def your_patients
      @your_patients ||= YourPatients.new
    end

    def first_appt
      @first_appt ||= YourPatients::FirstAppointment.new
    end

    def second_contact
      @second_contact ||= YourPatients::SecondContact.new
    end

    def third_contact
      @third_contact ||= YourPatients::ThirdContact.new
    end

    def final_appt
      @final_appt ||= YourPatients::ThirdContact.new
    end
  end
end
