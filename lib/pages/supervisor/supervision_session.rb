# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/translations/supervisor_page/nurses'

module Supervisor
  # page object for supervision sessions within nurse supervisor page
  class SupervisionSession
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::NursesTranslations

    def initialize(supervision_session)
      @id ||= supervision_session[:id]
      @supervision_date ||= supervision_session[:supervision_date]
      @supervision_time ||= supervision_session[:supervision_time]
      @locale ||= supervision_session.fetch(:locale, 'english')
    end

    def review_supervision_sessions
      nurse_panel_heading.find('a', text: review_link).click
    end

    def has_previous_sessions_listed?
      within('.table', text: 'Session') do
        array_of_elements_equal?(
          elements: all('tr'),
          ids: (1..3),
          expectation: expected_rows
        )
      end
    end

    def create_supervision_session
      nurse_panel.find('a', text: log_session_button).click
    end

    def has_last_supervision_session?
      nurse_panel_heading.has_css?('small', text: last_supervision_date)
    end

    def has_supervision_session_late?
      nurse_panel_heading.has_css?('.text-warning', text: last_supervision_date)
    end

    def has_supervision_session_overdue?
      nurse_panel_heading.has_css?('.text-danger', text: last_supervision_date)
    end

    def has_supervisor_notes_title?
      has_css?('h3', text: localize(spanish: 'Notas del Supervisor',
                                    portuguese: 'Notas do Supervisor',
                                    english: 'Nurse supervisor notes'))
    end

    def has_supervision_sessions_title?
      has_css?('h3', text: plural_supervision_form_heading)
    end

    def has_supervision_table_headers?
      array_of_elements_equal?(
        elements: all('td'),
        ids: (0..4),
        expectation: expected_headers
      )
    end

    private

    def navigation
      Navigation.new(locale: @locale)
    end

    def nurse_panel
      all('.panel', text: "Nurse-#{@id}, #{language}").last
    end

    def nurse_panel_heading
      find('.panel-heading', text: "Nurse-#{@id}, #{language}")
    end

    def last_supervision_date
      "#{last_supervision_header}: #{standard_date(@supervision_date)}" \
      "#{locale_hour(dst_time(@supervision_time))}"
    end

    def expected_rows
      first_session = dst_time(3.business_days.before(today_at_11_am))
      second_session = dst_time(8.business_days.before(today_at_11_am))
      third_session = dst_time(12.business_days.before(today_at_11_am))
      ["#{first_session.strftime('%B %d, %Y %H')}:00 30 Group Phone Non-" \
       'resolved help requests, Cancelled tasks',
       "#{second_session.strftime('%B %d, %Y %H')}:00 10 Group Phone",
       "#{third_session.strftime('%B %d, %Y %H')}:00 20 Individual In person"]
    end
  end
end
