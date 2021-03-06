# frozen_string_literal: true
Dir['./lib/pages/tasks/*.rb'].each { |file| require file }
require './lib/pages/translations/clinical_summary'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/timeline_page'

# page object for profile page of active participants
class TimelinePage
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::ClinicalSummaryTranslations
  include Translations::NurseTaskTitles
  include Translations::TimelineTranslations

  def initialize(timeline)
    @id ||= timeline[:id]
    @email ||= timeline[:email]
    @session ||= timeline[:session]
    @session_length ||= timeline[:session_length]
    @locale ||= timeline.fetch(:locale, 'english')
  end

  def open
    find('#participant-menu').click
    find('a', text: timeline_page_title).click
  end

  def on_page?
    has_css?('.timeline')
  end

  def has_confirmation_call?
    find('.timeline').has_css?('.timeline-panel', count: 1) &&
      has_text?("#{confirmation_call_title} Date of contact:" \
                " #{standard_date(today)}")
  end

  def has_initial_appointment?
    find('.timeline').has_css?('.timeline-panel', count: 2) &&
      has_text?("#{initial_appointment_title} Appointment date/time: " \
                "#{standard_date(yesterday)} ")
  end

  def has_follow_up_week_1?
    find('.timeline').has_css?('.timeline-panel', count: 3) &&
      has_text?("#{follow_up_week_one_title} information Date/time of " \
                "phone call: #{standard_date(today)}") &&
      has_text?('Length of phone call (minutes): 120')
  end

  def has_follow_up_week_3?
    find('.timeline').has_css?('.timeline-panel', count: 4) &&
      has_text?("#{follow_up_week_three_title} information Date/time of " \
                "phone call: #{standard_date(today)}") &&
      has_text?('Length of phone call (minutes): 120')
  end

  def has_call_to_schedule_final_appt?
    find('.timeline').has_css?('.timeline-panel', count: 5) &&
      has_text?("#{call_to_schedule_final_title} Date/time" \
                " of phone call: #{standard_date(today)}")
  end

  def has_final_appointment?
    find('.timeline').has_css?('.timeline-panel', count: 6) &&
      has_text?("#{final_appointment_title} Date and time: " \
                "#{standard_date(today)}") &&
      has_text?('Location: 100 West Ln, Chicago, IL 60601 Was the' \
                ' phone returned?:')
  end

  def has_phone_additional_contact?
    find('.timeline')
      .has_css?('.timeline-panel', text: additional_contact_title) &&
      has_text?('Type: phone call')
  end

  def has_in_person_additional_contact?
    find('.timeline')
      .has_css?('.timeline-panel', text: additional_contact_title) &&
      has_text?('Type: in person')
  end

  def has_help_request?
    find('.timeline')
      .has_css?('.timeline-panel',
                text: "#{help_request_title} Date/time of phone call: " \
                      "#{standard_date(today)}") &&
      has_text?('Reason for help request:')
  end

  def has_non_connectivity_call?
    find('.timeline')
      .has_css?('.timeline-panel',
                text: "#{lack_of_connectivity_call_title} Date/time of " \
                      "phone call: #{standard_date(today)}") &&
      has_text?('Reason for lack of connectivity:')
  end

  def has_non_connectivity_call_in_last_12_hours?
    find('.timeline')
      .has_css?('.timeline-panel',
                text: "#{lack_of_connectivity_call_title} Date/time of " \
                      "phone call: #{standard_date(today)}" \
                      "#{locale_hour(now - (11 * one_hour))}") &&
      has_text?('Reason for lack of connectivity:')
  end

  def has_non_connectivity_call_longer_than_12_hours_ago?
    thirteen_hours_ago = now - (13 * one_hour)
    find('.timeline')
      .has_css?('.timeline-panel',
                text: "#{lack_of_connectivity_call_title} Date/time of phone" \
                      " call: #{standard_date(thirteen_hours_ago)}" \
                      "#{locale_hour(thirteen_hours_ago)}") &&
      has_text?('Reason for lack of connectivity:')
  end

  def has_non_adherence_call?
    find('.timeline')
      .has_css?('.timeline-panel',
                text: "#{non_adherence_call_title} Date/time of phone " \
                      "call: #{standard_date(today)}") &&
      has_text?('Reason for non-adherence:')
  end

  def has_non_adherence_call_two_days_ago?
    find('.timeline')
      .has_css?('.timeline-panel',
                text: "#{non_adherence_call_title} Date/time of phone " \
                      "call: #{standard_date(today - 2)}") &&
      has_text?('Reason for non-adherence:')
  end

  def edit_confirmation_call
    edit_session(confirmation_call_title)
  end

  def edit_initial_appointment
    edit_session(initial_appointment_title)
  end

  def edit_follow_up_week_1
    edit_session(follow_up_week_one_title)
  end

  def edit_follow_up_week_3
    edit_session(follow_up_week_three_title)
  end

  def edit_call_to_schedule_final_appt
    edit_session(call_to_schedule_final_title)
  end

  def edit_final_appointment
    edit_session(final_appointment_title)
  end

  def has_updated_session_length?
    find('.timeline-panel', text: @session)
      .has_text? "Session length (minutes): #{@session_length}"
  end

  def has_updated_call_length?
    find('.timeline-panel', text: @session)
      .has_text? "Length of phone call (minutes): #{@session_length}"
  end

  def has_updated_phone_return?
    find('.timeline-panel', text: final_appointment_title)
      .has_text? 'Was the phone returned?: No'
  end

  def has_updated_contact_at?
    find('.timeline-panel', text: @session)
      .has_text? "Date/time of phone call: #{standard_date(today)}"
  end

  def has_timeline_titles?
    array_of_elements_equal?(
      elements: all('.timeline-title'),
      ids: (0..8),
      expectation: expected_timeline_titles.reverse
    )
  end

  def has_contact_dates?
    # not updated to `array_of_elements_equal?` b/c different implementation
    timeline_headings = all('.timeline-heading')
    expect(
      (0..8).map do |heading_id|
        string = timeline_headings[heading_id].find('p').text
        string_end = string.index(today.strftime('%Y')) + 3
        string.slice(0..string_end)
      end
    ).to eq(expected_timeline_dates.reverse)
  end

  def has_timeline_headings?
    array_of_elements_equal?(
      elements: find('.timeline').all('strong'),
      ids: (0..10),
      expectation: expected_timeline_headings.reverse
    )
  end

  private

  def edit_session(session)
    find('.timeline-panel', text: session).find('.fa-edit').click
  end
end
