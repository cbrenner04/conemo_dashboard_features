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

    def has_seven_day_access_count_of?(num)
      has_css?('.access-count', text: num)
    end

    def has_the_messages?(first, second)
      expect(page).to have_content first
      expect(page).to have_content second
    end

    def show_number_of_logins
      find('th', text: 'Logins').click
    end

    def has_logins_on?(l, m, n, o)
      within('.logins-table') do
        expect(page).to have_content l
        expect(page).to have_content m
        expect(page).to have_content n
        expect(page).to have_content o
      end
    end

    def visible?
      has_css?('h1', text: 'Overall Status')
    end

    def overall_status_heading
      find('h1', text: 'Overall Status')
    end

    def has_overall_status?(status)
      overall_status_heading.has_css?(".#{status}")
    end

    def lesson_row(lesson)
      lesson == '1' ? page.all('tr:nth-child(1)')[1] : "tr:nth-child(#{lesson})"
    end

    def has_current_lesson_at?(lesson)
      overall_status_heading # weird behavior if it doesn't find something first
      within('#lessons') do
        expect(lesson_row(lesson)).to have_css('.info')
        expect(page)
          .to have_css('.unreleased', count: (10 - lesson.to_i).to_s)
      end
    end

    def has_unread_lesson_at?(lesson)
      overall_status_heading # weird behavior if it doesn't find something first
      within('#lessons') { expect(lesson_row(lesson)).to have_css('.danger') }
    end

    def has_late_lesson_at?(lesson)
      overall_status_heading
      within('lessons') { expect(lesson_row(lesson)). to have_css('.warning') }
    end

    def has_ontime_lesson_at?(lesson)
      overall_status_heading
      within('lessons') { expect(lesson_row(lesson)). to have_css('.warning') }
    end
  end
end
