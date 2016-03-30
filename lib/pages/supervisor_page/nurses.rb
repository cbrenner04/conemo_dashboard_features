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
                        "#{sup_time}")
    end

    def has_supervision_session_late?
      nurse_panel_heading
        .has_css?('.text-warning',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %-d, %Y')} " \
                        "#{sup_time}")
    end

    def has_supervision_session_overdue?
      nurse_panel_heading
        .has_css?('.text-danger',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %-d, %Y')} " \
                        "#{sup_time}")
    end

    def review_supervision_sessions
      nurse_panel_heading.find('a', text: 'Review').click
    end

    def has_previous_sessions_listed?
      within('.table') do
        actual_rows = (1..3).map { |i| all('tr')[i].text }
        expected_rows = [
          'March 24, 2016 11:00 30 Group Phone Non-resolved help requests,' \
          ' Cancelled tasks',
          'March 17, 2016 11:00 10 Group Phone',
          'March 11, 2016 10:00 20 Individual In person'
        ]
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

    def sup_time
      heading = nurse_panel_heading.find('small').text
      subheading = heading
                   .gsub('Last supervision session: ' \
                         "#{@supervision_date.strftime('%B %-d, %Y')} ", '')
      actual_time = subheading.gsub(' Review', '')
      time_offset = if Time.now.dst? && @supervision_time.dst?
                      0
                    elsif !Time.now.dst? && @supervision_time.dst?
                      (1 * 60 * 60)
                    else
                      (-1 * 60 * 60)
                    end
      expected_time = @supervision_time.hour.to_i + time_offset
      comparison = expected_time - actual_time.gsub(/:\w+/, '').to_i
      comparison <= 1 ? actual_time : Time.now.hour
    end
  end
end
