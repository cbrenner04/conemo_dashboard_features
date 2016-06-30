# frozen_string_literal: true
require './lib/pages/translations/clinical_summary'

module Summary
  # page object for Lessons in Clinical Summary
  class LessonsTable
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::ClinicalSummaryTranslations

    def initialize(lessons_table)
      @current_lesson ||= lessons_table[:current_lesson]
      @other_lesson ||= lessons_table[:other_lesson]
      @incomplete_lesson ||= lessons_table[:incomplete_lesson]
      @start_date_offset ||= lessons_table[:start_date_offset]
      @locale ||= lessons_table.fetch(:locale, 'english')
    end

    def has_lesson_table_content?
      # not updated to `array_of_elements_equal?` b/c different implementation
      total_rows = lesson_table.all('tr').count - 1
      table_content = (1..total_rows).map { |row_num| lesson_row(row_num).text }
      expect(table_content).to eq(expected_lessons)
    end

    def has_current_lesson?
      lesson = @current_lesson.gsub('Lesson ', '').to_i
      lesson_table.has_css?('.info', text: @current_lesson) &&
        lesson_table.has_css?('.un-released', count: (total_lessons - lesson))
    end

    def has_unread_lesson?
      has_css?('.danger', text: @other_lesson)
    end

    def has_late_lesson?
      has_css?('.slippage', text: @other_lesson)
    end

    def has_incomplete_late_lesson?
      has_css?('.warning', text: @incomplete_lesson)
    end

    def has_ontime_lesson?
      has_css?('.success', text: @other_lesson)
    end

    def has_lesson_release_dates?
      expectation = if total_lessons == 17
                      expected_release_dates_2
                    else
                      expected_release_dates_1
                    end

      array_of_elements_equal?(
        elements: all('.release-date'),
        ids: (0..(total_lessons - 1)),
        expectation: expectation
      )
    end

    private

    def lesson_table
      first('table', text: lesson_table_heading)
    end

    def lesson_row(num)
      if num == 1
        lesson_table.all('tr:nth-child(1)')[1]
      else
        lesson_table.find("tr:nth-child(#{num})")
      end
    end

    def total_lessons
      lesson_table.all('tr').last.first('td').text.to_i
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
  end
end
