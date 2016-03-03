require './lib/pages/your_patients/nurse_tasks/initial_in_person_appointment'
require './lib/pages/your_patients/nurse_tasks/follow_up_call_week_one'
require './lib/pages/your_patients/nurse_tasks/follow_up_call_week_three'
require './lib/pages/your_patients/nurse_tasks/final_appointment'

class YourPatients
  class NurseTasks
    # page object for the reports page of active participants
    class ClinicalSummary
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

      def lesson_table
        find('#lessons')
      end

      def lesson_row(num)
        num == 1 ? all('tr:nth-child(1)')[1] : find("tr:nth-child(#{num})")
      end

      def has_current_lesson?
        visible? # weird behavior if it doesn't find something first
        within('#lessons') do
          l = lesson_row(@current_lesson)
          l.has_css?('.info')
          has_css?('.un-released', count: (15 - @current_lesson))
        end
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
        has_text? "Follow up call week one\n" \
                  "#{second_contact.general_notes}\n" \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      # def has_third_contact_notes_visible?
      #   has_text? "Third Contact\n#{third_contact.general_notes}\n" \
      #             "#{DateTime.now.strftime('%B %d, %Y')}"
      # end

      # def has_final_appt_notes_visible?
      #   has_text? "Final Appointment\n#{final_appt.general_notes}\n" \
      #             "#{DateTime.now.strftime('%B %d, %Y')}"
      # end

      private

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
