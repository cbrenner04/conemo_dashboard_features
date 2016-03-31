require 'business_time'

class SupervisorPage
  # page object for Nurses section of Supervisor page
  class Nurses
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(nurses)
      @id ||= nurses[:id]
      @num_participants ||= nurses[:num_participants]
      @num_tasks ||= nurses[:num_tasks]
      @num_overdue ||= nurses[:num_overdue]
      @supervision_date ||= nurses[:supervision_date]
      @supervision_time ||= nurses[:supervision_time]
    end

    def has_participants_and_tasks?
      within('.panel-heading', text: "Nurse-#{@id}, English") do
        ["#{@num_participants} Participants",
         "#{@num_tasks} Tasks",
         "#{@num_overdue} Overdue",
         'English Locale Health Unit'].all? do |item|
          has_css?('li', text: item)
        end
      end
    end

    def has_supervision_session?
      nurse_panel_heading
        .has_css?('small',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %-d, %Y')} " \
                        "#{dst_time(@supervision_time).strftime('%H')}")
    end

    def has_supervision_session_late?
      nurse_panel_heading
        .has_css?('.text-warning',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %-d, %Y')} " \
                        "#{dst_time(@supervision_time).strftime('%H')}")
    end

    def has_supervision_session_overdue?
      nurse_panel_heading
        .has_css?('.text-danger',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %-d, %Y')} " \
                        "#{dst_time(@supervision_time).strftime('%H')}")
    end

    def review_supervision_sessions
      nurse_panel_heading.find('a', text: 'Review').click
    end

    def has_previous_sessions_listed?
      within('.table') do
        actual_rows = (1..3).map { |i| all('tr')[i].text }
        expect(actual_rows).to eq(expected_rows)
      end
    end

    def create_supervision_session
      nurse_panel.find('a', text: 'Log supervision session').click
    end

    def has_supervision_session_form_visible?
      has_css?('h1', text: 'Supervision session')
    end

    def create_supervision_contact
      nurse_panel.find('a', text: 'Log supervision contact').click
    end

    def has_supervision_contact_form_visible?
      has_css?('h1', text: 'Supervision contact')
    end

    def enter_session_length
      fill_in 'supervision_session[session_length]', with: 20
    end

    def select_meeting_kind
      choose ['Group', 'Individual'].sample
    end

    def select_contact_kind
      choose ['Phone', 'In person'].sample
    end

    def choose_topic
      topic = [
        'First appointments',
        'Difficulty to contact patient',
        'Non connectivity calls',
        'Non-resolved help requests',
        'Non-adherence',
        'Patient\'s difficulties with CONEMO',
        'Uncertainties related to tasks',
        'Overdue tasks / Nurse adherence',
        'Cancelled tasks',
        'Questions about intervention',
        'Serious adverse events (if nurse brings it up)',
        'Dropouts'
      ].sample(2)
      topic.each { |t| check t }
    end

    def select
      find('a', text: "Nurse-#{@id}, English").click
    end

    def has_your_patients_header?
      has_css?('h2', text: "Nurse-#{@id}, English: Participants")
    end

    private

    def nurse_panel
      if has_css?('.panel', text: "Nurse-#{@id}, English", count: 2)
        all('.panel', text: "Nurse-#{@id}, English")[1]
      else
        find('.panel', text: "Nurse-#{@id}, English")
      end
    end

    def nurse_panel_heading
      find('.panel-heading', text: "Nurse-#{@id}, English")
    end

    def dst_time(time)
      if Time.now.dst? && time.dst?
        time
      elsif !Time.now.dst? && time.dst?
        time + (1 * 60 * 60)
      else
        (time - (1 * 60 * 60))
      end
    end

    def today_at_11_am
      time = Time.now
      noon = time + ((12 - time.hour) * 60 * 60) - (time.min * 60) - time.sec
      @today_at_11_am ||= noon - (1 * 60 * 60)
    end

    def expected_rows
      date_1 = dst_time(3.business_days.before today_at_11_am)
      date_2 = dst_time(8.business_days.before today_at_11_am)
      date_3 = dst_time(12.business_days.before today_at_11_am)
      @expected_rows ||= [
        "#{date_1.strftime('%B %d, %Y %H')}:00 30 Group Phone Non-resolved" \
        ' help requests, Cancelled tasks',
        "#{date_2.strftime('%B %d, %Y %H')}:00 10 Group Phone",
        "#{date_3.strftime('%B %d, %Y %H')}:00 20 Individual In person"
      ]
    end
  end
end
