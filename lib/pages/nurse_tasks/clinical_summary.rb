require './lib/pages/navigation'
require './lib/pages/translations/clinical_summary'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/nurse_tasks/initial_in_person_appointment'
require './lib/pages/nurse_tasks/follow_up_call_week_one'
require './lib/pages/nurse_tasks/follow_up_call_week_three'
require './lib/pages/nurse_tasks/final_appointment'

class NurseTasks
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
      @locale ||= clinical_summary[:locale]
      @start_date_offset ||= clinical_summary[:start_date_offset]
      @num_of_lessons ||= clinical_summary[:num_of_lessons]
    end

    def open
      find('#participant-menu').find('a', text: clinical_summary_link).click
    end

    def visible?
      has_text? 'Release day'
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

    def show_number_of_logins
      find('th', text: 'Logins').click
    end

    def has_correct_logins?
      (1..4).all? do |i|
        n = Date.today - i
        find('#logins-table').has_text? n.strftime('%B %d, %Y')
      end
    end

    def has_lesson_table_content?
      visible?
      total_rows = (lesson_table.all('tr').count - 1)
      table_content = Range.new(1, total_rows).map { |i| lesson_row(i).text }

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
      l = lesson_row(@current_lesson)
      l.has_css?('.info')
      lesson_table.has_css?('.un-released',
                            count: (total_lessons - @current_lesson))
    end

    def has_unread_lesson?
      visible? # weird behavior if it doesn't find something first
      has_css?('.danger', text: "Lesson #{@other_lesson}")
    end

    def has_late_lesson?
      visible?
      has_css?('.slippage', text: "Lesson #{@other_lesson}")
    end

    def has_incomplete_late_lesson?
      visible?
      has_css?('.warning', text: "Lesson #{@incomplete_lesson}")
    end

    def has_ontime_lesson?
      visible?
      has_css?('.success', text: "Lesson #{@other_lesson}")
    end

    def has_first_appt_notes_visible?
      has_text? "#{initial_appointment_title}\n" \
                "#{initial_in_person_appointment.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_follow_up_week_1_notes_visible?
      has_text? "#{follow_up_week_one_title}\n" \
                "#{follow_up_call_week_one.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_follow_up_week_3_notes_visible?
      has_text? "#{follow_up_week_three_title}\n" \
                "#{follow_up_call_week_three.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_final_appt_notes_visible?
      has_text? "#{final_appointment_title}\n" \
                "#{final_appt.general_notes}\n" \
                "#{DateTime.now.strftime('%B %d, %Y')}"
    end

    def has_links?
      visible?
      actual_links = (2..3).map { |i| all('a')[i].text }
      expect(actual_links).to eq(expected_links)
    end

    def has_headers?
      actual_headers = [0, 2, 3, 4].map { |i| all('th')[i].text }
      expect(actual_headers).to eq(expected_headers)
    end

    def has_legend?
      visible?
      legend = find('.table-condensed')
      actual_legend = (0..5).map { |i| legend.all('td')[i].text }
      expect(actual_legend).to eq(expected_legend)
    end

    def has_notes_headers?
      actual_notes_headers = (0..3).map { |i| notes_table.all('dt')[i].text }
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
      actual_contact_dates = (0..3).map do |i|
        year = Date.today.strftime('%Y')
        string = notes_table.all('em')[i].text
        string.slice(0..(string.index(year.to_s) + (year.length - 1)))
      end
      expect(actual_contact_dates).to eq(expected_contact_dates)
    end

    def create_supervisor_note
      supervisor_notes_table.find('.fa-edit').click
      fill_in 'supervisor_note[note]', with: @note
      navigation.submit
    end

    def has_supervisor_note?
      supervisor_notes_table
        .has_text? "#{@note}\n#{Date.today.strftime('%B %d, %Y')}"
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

    def supervisor_notes_table
      find('.table', text: 'Nurse supervisor Notes')
    end

    def total_lessons
      @total_lessons ||= lesson_table
                         .all('tr').last
                         .first('td').text.to_i
    end

    def expected_lessons
      @expected_lessons ||= [
        "1 #{Date.today.strftime('%B %d, %Y')} Lesson 1",
        "2 #{(Date.today + 1).strftime('%B %d, %Y')} Lesson 2",
        "3 #{(Date.today + 2).strftime('%B %d, %Y')} Lesson 3",
        "4 #{(Date.today + 3).strftime('%B %d, %Y')} Lesson 4",
        "5 #{(Date.today + 4).strftime('%B %d, %Y')} Lesson 5",
        "6 #{(Date.today + 5).strftime('%B %d, %Y')} Lesson 6",
        "7 #{(Date.today + 6).strftime('%B %d, %Y')} Lesson 7",
        "8 #{(Date.today + 7).strftime('%B %d, %Y')} Lesson 8",
        "9 #{(Date.today + 8).strftime('%B %d, %Y')} Lesson 9",
        "10 #{(Date.today + 9).strftime('%B %d, %Y')} Lesson 10",
        "11 #{(Date.today + 10).strftime('%B %d, %Y')} Lesson 11",
        "12 #{(Date.today + 11).strftime('%B %d, %Y')} Lesson 12",
        "13 #{(Date.today + 12).strftime('%B %d, %Y')} Lesson 13",
        "14 #{(Date.today + 13).strftime('%B %d, %Y')} Lesson 14",
        "15 #{(Date.today + 14).strftime('%B %d, %Y')} Lesson 15"
      ]
    end

    def navigation
      @navigation ||= Navigation.new(locale: 'english')
    end

    def initial_in_person_appointment
      @initial_in_person_appointment ||=
        NurseTasks::InitialInPersonAppointment.new(
          locale: 'english'
        )
    end

    def follow_up_call_week_one
      @follow_up_call_week_one ||=
        NurseTasks::FollowUpCallWeekOne.new(locale: 'english')
    end

    def follow_up_call_week_three
      @follow_up_call_week_three ||=
        NurseTasks::FollowUpCallWeekThree.new(
          locale: 'english'
        )
    end

    def final_appt
      @final_appt ||= NurseTasks::FinalAppointment.new(
        locale: 'english'
      )
    end
  end
end
