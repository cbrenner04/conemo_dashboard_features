require 'business_time'
require './lib/pages/navigation'
require './lib/pages/translations/supervisor_page/nurses'

class SupervisorPage
  # page object for Nurses section of Supervisor page
  class Nurses
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::NursesTranslations

    def initialize(nurses)
      @id ||= nurses[:id]
      @num_participants ||= nurses[:num_participants]
      @num_tasks ||= nurses[:num_tasks]
      @num_overdue ||= nurses[:num_overdue]
      @supervision_date ||= nurses[:supervision_date]
      @supervision_time ||= nurses[:supervision_time]
      @locale ||= nurses.fetch(:locale, 'english')
      @note ||= nurses[:note]
    end

    def has_nurses_title?
      has_css?('h3', text: nurse_title)
    end

    def has_subheadings?
      has_css?('ul', text: subheadings)
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

    def has_new_supervision_session?
      find('.table', text: 'Session')
        .has_text?(Date.today.strftime('%B %d, %Y')) &&
        find('.table', text: 'Session')
          .has_text?("20 #{@meeting_kind} #{@contact_kind} #{@topic[0]}, " \
                     "#{@topic[1]}")
    end

    def has_last_supervision_session?
      nurse_panel_heading
        .has_css?('small', text: last_supervision_date)
    end

    def has_supervision_session_late?
      nurse_panel_heading
        .has_css?('.text-warning', text: last_supervision_date)
    end

    def has_supervision_session_overdue?
      nurse_panel_heading
        .has_css?('.text-danger', text: last_supervision_date)
    end

    def review_supervision_sessions
      nurse_panel_heading.find('a', text: review_link).click
    end

    def has_supervisor_notes_title?
      has_css?('h3',
               text: localize(spanish: 'Notas del Supervisor',
                              portuguese: 'Notas do Supervisor',
                              english: 'Nurse supervisor notes'))
    end

    def has_supervision_sessions_title?
      # will need to update spanish version
      has_css?('h3',
               text: localize(spanish: 'Añadir nueva supervisión',
                              portuguese: 'Sessão de Supervisão',
                              english: 'Supervision sessions'))
    end

    def has_supervision_table_headers?
      headers = all('td')
      actual_headers = (0..4).map { |i| headers[i].text }
      expect(actual_headers).to eq(expected_headers)
    end

    def has_previous_sessions_listed?
      within('.table', text: 'Session') do
        rows = all('tr')
        actual_rows = (1..3).map { |i| rows[i].text }
        expect(actual_rows).to eq(expected_rows)
      end
    end

    def create_supervision_session
      nurse_panel.find('a', text: log_session_button).click
    end

    def has_supervision_session_form_visible?
      has_css?('h1', text: supervision_form_heading)
    end

    def has_questions_and_responses?
      expect(all('label')[0].text)
        .to eq localize(spanish: 'Fecha/hora',
                        portuguese: 'Data/hora',
                        english: 'Session at')
      labels = all('label')
      actual = (6..31).map { |i| labels[i].text }
      expect(actual).to eq(expected_questions_and_answers)
    end

    def enter_session_length
      fill_in 'supervision_session[session_length]', with: 20
    end

    def select_meeting_kind
      @meeting_kind = ['Group', 'Individual'].sample
      choose @meeting_kind
    end

    def select_contact_kind
      @contact_kind = ['Phone', 'In person'].sample
      choose @contact_kind
    end

    def choose_topic
      topics = [
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
      ]
      choices = (0..17).to_a.sample(2).sort
      @topic = [topics[choices[0]], topics[choices[1]]]
      @topic.each { |t| check t }
    end

    def create_supervision_note
      find('.fa-edit').click
      fill_in 'supervisor_note[note]', with: @note
      navigation.submit
    end

    def has_supervision_note?
      find('.table', match: :first)
      first('.table')
        .has_text?("#{@note}\n#{Date.today.strftime('%B %d, %Y')}") &&
        has_css?('.alert', text: 'Supervisor note was successfully created')
    end

    def select
      4.times { navigation.scroll_down }
      nurse_panel_heading
        .find('a', text: "Nurse-#{@id}, #{language}").click
    end

    def has_your_patients_header?
      has_css?('h2', text: "Nurse-#{@id}, English: Participants")
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end

    def language
      @language ||= localize(
        spanish: 'Spanish',
        portuguese: 'Portuguese',
        english: 'English'
      )
    end

    def nurse_panel
      all('.panel', text: "Nurse-#{@id}, #{language}").last
    end

    def nurse_panel_heading
      find('.panel-heading', text: "Nurse-#{@id}, #{language}")
    end

    def last_supervision_date
      @last_supervision_date ||=
        "#{last_supervision_header}: " \
        "#{locale_date(@supervision_date)}" \
        "#{locale_hour(dst_time(@supervision_time))}"
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
