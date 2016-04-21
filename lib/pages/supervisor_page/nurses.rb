require 'business_time'
require './lib/pages/navigation'
require './lib/pages/translations'

class SupervisorPage
  # page object for Nurses section of Supervisor page
  class Nurses
    include RSpec::Matchers
    include Capybara::DSL
    include Translations

    def initialize(nurses)
      @id ||= nurses[:id]
      @num_participants ||= nurses[:num_participants]
      @num_tasks ||= nurses[:num_tasks]
      @num_overdue ||= nurses[:num_overdue]
      @supervision_date ||= nurses[:supervision_date]
      @supervision_time ||= nurses[:supervision_time]
      @locale ||= nurses[:locale]
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

    def has_contact_notification?
      nurse_panel.has_css?('.fa-exclamation-circle')
    end

    def has_supervision_session?
      nurse_panel_heading
        .has_css?('small',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %d, %Y')} " \
                        "#{dst_time(@supervision_time).strftime('%H')}")
    end

    def has_supervision_session_late?
      nurse_panel_heading
        .has_css?('.text-warning',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %d, %Y')} " \
                        "#{dst_time(@supervision_time).strftime('%H')}")
    end

    def has_supervision_session_overdue?
      nurse_panel_heading
        .has_css?('.text-danger',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %d, %Y')} " \
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
        'Non-resolved help requests',
        'Non connectivity calls',
        'Non-adherence',
        'Patient\'s difficulties with CONEMO',
        'Overdue tasks / Nurse adherence',
        'Cancelled tasks',
        'Serious adverse events (if nurse brings it up)',
        'Dropouts',
        'Uncertainties related to tasks',
        'Questions about intervention',
        'Other programmed contact points',
        'Resolved help requests',
        'Difficult situations for the nurse related to the intervention/study',
        'Administrative issues',
        'Additional contacts',
        'Others'
      ].sample(2)
      topic.each { |t| check t }
    end

    def select
      4.times { navigation.scroll_down }
      find('.panel-heading',
           text: "Nurse-#{@id}, #{locale('Spanish', 'Portuguese', 'English')}")
        .find('a',
              text: "Nurse-#{@id}, " \
                    "#{locale('Spanish', 'Portuguese', 'English')}").click
    end

    def has_your_patients_header?
      has_css?('h2', text: "Nurse-#{@id}, English: Participants")
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: 'english')
    end

    def nurse_panel
      all('.panel', text: "Nurse-#{@id}, English").last
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
      date_1 = dst_time(3.business_days.before(today_at_11_am))
      date_2 = dst_time(8.business_days.before(today_at_11_am))
      date_3 = dst_time(12.business_days.before(today_at_11_am))
      @expected_rows ||= [
        "#{date_1.strftime('%B %d, %Y %H')}:00 30 Group Phone Non-resolved" \
        ' help requests, Cancelled tasks',
        "#{date_2.strftime('%B %d, %Y %H')}:00 10 Group Phone",
        "#{date_3.strftime('%B %d, %Y %H')}:00 20 Individual In person"
      ]
    end
  end
end
