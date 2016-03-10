require './lib/pages/your_patients/nurse_tasks/initial_in_person_appointment'
require './lib/pages/your_patients/nurse_tasks/follow_up_call_week_one'
require './lib/pages/your_patients/nurse_tasks/follow_up_call_week_three'
require './lib/pages/your_patients/nurse_tasks/final_appointment'

class YourPatients
  class NurseTasks
    # page object for the reports page of active participants
    class ClinicalSummary
      include RSpec::Matchers
      include Capybara::DSL

      def initialize(clinical_summary)
        @id ||= clinical_summary[:id]
        @first_message ||= clinical_summary[:first_message]
        @second_message ||= clinical_summary[:second_message]
        @current_lesson ||= clinical_summary[:current_lesson]
        @other_lesson ||= clinical_summary[:other_lesson]
      end

      def open
        click_on 'Clinical Summary'
      end

      def visible?
        has_css?('h1', text: "First Last-#{@id}")
      end

      def return_to_tasks
        find('.fa-chevron-left').click
      end

      def has_messages?
        has_text? @first_message
        has_text? @second_message
      end

      def show_number_of_logins
        find('th', text: 'Logins').click
      end

      def has_correct_logins?
        (1..4).each do |i|
          n = Date.today - i
          find('.logins-table').has_text? n.strftime('%B %d, %Y')
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
        has_css?('.warning', text: "Lesson #{@other_lesson}")
      end

      def has_ontime_lesson?
        visible?
        has_css?('.success', text: "Lesson #{@other_lesson}")
      end

      def has_first_appt_notes_visible?
        has_text? "Initial in person appointment\n" \
                  "#{first_apt.general_notes}\n" \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      def has_follow_up_week_1_notes_visible?
        has_text? "Follow up call week 1\n" \
                  "#{second_contact.general_notes}\n" \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      def has_follow_up_week_3_notes_visible?
        has_text? "Follow up call week 3\n" \
                  "#{third_contact.general_notes}\n" \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      def has_final_appt_notes_visible?
        has_text? "Final in person appointment\n" \
                  "#{final_appt.general_notes}\n" \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      private

      def lesson_table
        find('table', text: 'Lesson')
      end

      def total_lessons
        @total_lessons ||= lesson_table
                           .all('tr').last
                           .first('td').text.to_i
      end

      def expected_lessons
        @expected_lesson ||= total_lessons == 17 ? alt_lessons : all_lessons
      end

      def alt_lessons
        @alt_lesson ||= [
          "1 #{(Date.today).strftime('%B %d, %Y')} Lesson 1",
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
          "12 #{(Date.today + 11).strftime('%B %d, %Y')} Edited Lesson",
          "13 #{(Date.today + 12).strftime('%B %d, %Y')} Lesson 13",
          "14 #{(Date.today + 13).strftime('%B %d, %Y')} Lesson 14",
          "15 #{(Date.today + 14).strftime('%B %d, %Y')} New Lesson",
          "16 #{(Date.today + 14).strftime('%B %d, %Y')} Lesson 15",
          "17 #{(Date.today + 15).strftime('%B %d, %Y')} Activity Lesson"
        ]
      end

      def all_lessons
        @all_lessons ||= [
          "1 #{(Date.today).strftime('%B %d, %Y')} Lesson 1",
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

      def first_apt
        @first_apt ||= YourPatients::NurseTasks::InitialInPersonAppointment.new
      end

      def second_contact
        @second_contact ||= YourPatients::NurseTasks::FollowUpCallWeekOne.new
      end

      def third_contact
        @third_contact ||= YourPatients::NurseTasks::FollowUpCallWeekThree.new
      end

      def final_appt
        @final_appt ||= YourPatients::NurseTasks::FinalAppointment.new
      end
    end
  end
end
