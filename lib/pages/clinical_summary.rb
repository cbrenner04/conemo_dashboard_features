require './lib/pages/navigation'
require './lib/pages/tasks/initial_in_person_appointment'
require './lib/pages/tasks/follow_up_call_week_one'
require './lib/pages/tasks/follow_up_call_week_three'
require './lib/pages/tasks/final_appointment'
require './lib/pages/translations/clinical_summary'
require './lib/pages/translations/nurse_tasks_titles'

# page object for the reports page of active participants
class ClinicalSummary
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::ClinicalSummaryTranslations

  def initialize(clinical_summary)
    @id ||= clinical_summary[:id]
    @current_lesson ||= clinical_summary[:current_lesson]
    @other_lesson ||= clinical_summary[:other_lesson]
    @note ||= clinical_summary[:note]
    @incomplete_lesson ||= clinical_summary[:incomplete_lesson]
    @locale ||= clinical_summary.fetch(:locale, 'english')
    @start_date_offset ||= clinical_summary[:start_date_offset]
    @num_of_lessons ||= clinical_summary[:num_of_lessons]
    @last_seen ||= clinical_summary[:last_seen]
  end

  def open
    find('#participant-menu').click
    find('a', text: clinical_summary_link).click
  end

  def visible?
    has_css?('h2', text: clinical_summary_title)
  end

  def return_to_tasks
    find('a', text: 'Tasks').click
  end

  def has_note?
    notes_table
      .has_css?('dt', text: additional_note_title) && has_text?(@note)
  end

  def delete_note
    find('td', text: @note).find('.fa-times-circle').click
    accept_alert 'Are you sure you want to delete this note?'
  end

  def has_lesson_table_content?
    visible?
    total_rows = lesson_table.all('tr').count - 1
    table_content = (1..total_rows).map { |i| lesson_row(i).text }
    expect(table_content).to eq(expected_lessons)
  end

  def lesson_row(num)
    if num == 1
      lesson_table.all('tr:nth-child(1)')[1]
    else
      lesson_table.find("tr:nth-child(#{num})")
    end
  end

  def has_current_lesson?
    visible? # weird behavior if it doesn't find something first
    lesson = @current_lesson.gsub('Lesson ', '').to_i
    lesson_table.has_css?('.info', text: @current_lesson) &&
      lesson_table.has_css?('.un-released', count: (total_lessons - lesson))
  end

  def has_unread_lesson?
    visible? # weird behavior if it doesn't find something first
    has_css?('.danger', text: @other_lesson)
  end

  def has_late_lesson?
    visible?
    has_css?('.slippage', text: @other_lesson)
  end

  def has_incomplete_late_lesson?
    visible?
    has_css?('.warning', text: @incomplete_lesson)
  end

  def has_ontime_lesson?
    visible?
    has_css?('.success', text: @other_lesson)
  end

  def has_first_appt_notes_visible?
    has_text? "#{initial_appointment_title}\n" \
              "#{initial_in_person_appointment.general_notes}\n" \
              "#{standard_date(yesterday)}"
  end

  def has_follow_up_week_1_notes_visible?
    has_text? "#{follow_up_week_one_title}\n" \
              "#{follow_up_call_week_one.general_notes}\n" \
              "#{standard_date(today)}"
  end

  def has_follow_up_week_3_notes_visible?
    has_text? "#{follow_up_week_three_title}\n" \
              "#{follow_up_call_week_three.general_notes}\n" \
              "#{standard_date(today)}"
  end

  def has_final_appt_notes_visible?
    has_text? "#{final_appointment_title}\n" \
              "#{final_appt.general_notes}\n" \
              "#{standard_date(today)}"
  end

  def has_headers?
    find('th', match: :first)
    headers = all('th')
    actual_headers = [1, 2, 4].map { |i| headers[i].text }
    expect(actual_headers).to eq(expected_headers)
  end

  def has_legend?
    visible?
    legend = find('.table-condensed').all('td')
    actual_legend = (0..5).map { |i| legend[i].text }
    expect(actual_legend).to eq(expected_legend)
  end

  def has_notes_headers?
    headers = notes_table.all('dt')
    actual_notes_headers = (0..3).map { |i| headers[i].text }
    expect(actual_notes_headers).to eq(expected_notes_headers)
  end

  def has_lesson_release_dates?
    actual_release = (0..(total_lessons - 1)).map do |i|
      all('.release-date')[i].text
    end
    if total_lessons == 17
      expect(actual_release).to eq(expected_release_dates_2)
    else
      expect(actual_release).to eq(expected_release_dates_1)
    end
  end

  def has_contact_dates?
    dates = notes_table.all('em')
    actual_contact_dates = (0..3).map do |i|
      year = today.strftime('%Y')
      string = dates[i].text
      string_end = string.index(year.to_s) + (year.length - 1)
      string.slice(0..string_end)
    end
    expect(actual_contact_dates).to eq(expected_contact_dates)
  end

  def has_one_non_connectivity_icon_in_current_lesson?
    find('tr', text: standard_date(Date.today))
      .has_css?('.fa-wifi') && has_css?('.fa-wifi', count: 1)
  end

  def has_no_non_connectivity_icon?
    has_no_css?('.fa-wifi')
  end

  def has_three_non_connectivity_icons?
    has_css?('.fa-wifi', count: 3)
  end

  def has_last_seen_timestamp?
    heading = localize(
      spanish: 'Conectado/a por última vez',
      portuguese: 'Última conexão à(s)',
      english: 'Last connection at'
    )
    has_text? "#{heading} #{standard_date(@last_seen)}" \
              "#{locale_hour(@last_seen)}"
  end

  private

  def lesson_table
    first('table', text: lesson_table_heading)
  end

  def notes_table
    if has_css?('.table', text: notes_heading, count: 1)
      find('.table', text: notes_heading)
    else
      first('.table', text: notes_heading)
    end
  end

  def total_lessons
    @total_lessons ||= lesson_table
                       .all('tr').last
                       .first('td').text.to_i
  end

  def expected_lessons
    @expected_lessons ||= [
      "1 #{standard_date(today)} Lesson 1",
      "2 #{standard_date(tomorrow)} Lesson 2",
      "3 #{standard_date(today + 2)} Lesson 3",
      "4 #{standard_date(today + 3)} Lesson 4",
      "5 #{standard_date(today + 4)} Lesson 5",
      "6 #{standard_date(today + 5)} Lesson 6",
      "7 #{standard_date(today + 6)} Lesson 7",
      "8 #{standard_date(today + 7)} Lesson 8",
      "9 #{standard_date(today + 8)} Lesson 9",
      "10 #{standard_date(today + 9)} Lesson 10",
      "11 #{standard_date(today + 10)} Lesson 11",
      "12 #{standard_date(today + 11)} Lesson 12",
      "13 #{standard_date(today + 12)} Lesson 13",
      "14 #{standard_date(today + 13)} Lesson 14",
      "15 #{standard_date(today + 14)} Lesson 15"
    ]
  end

  def navigation
    @navigation ||= Navigation.new(locale: @locale)
  end

  def initial_in_person_appointment
    @initial_in_person_appointment ||=
      Tasks::InitialInPersonAppointment.new(
        locale: @locale
      )
  end

  def follow_up_call_week_one
    @follow_up_call_week_one ||=
      Tasks::FollowUpCallWeekOne.new(locale: @locale)
  end

  def follow_up_call_week_three
    @follow_up_call_week_three ||=
      Tasks::FollowUpCallWeekThree.new(
        locale: @locale
      )
  end

  def final_appt
    @final_appt ||= Tasks::FinalAppointment.new(
      locale: @locale
    )
  end
end
