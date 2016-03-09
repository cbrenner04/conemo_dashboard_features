require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for the First Appointment Form in Active Participants
    class InitialInPersonAppointment
      include Capybara::DSL
      include NurseTasksForms

      def active?
        has_list_item?('Initial in person appointment')
        has_active_progress_bar_item?('Initial in person appointment')
      end

      def confirm
        confirm_task('Initial in person appointment')
        visible?
      end

      def cancel
        cancel_task('Initial in person appointment')
      end

      def visible?
        has_css?('h1', text: 'Initial in person appointment')
      end

      def has_next_contact_date?
        selector = all('.select2-container')
        next_week = Date.today + 7
        selector[6].has_text? next_week.strftime('%B')
        selector[7].has_text? next_week.strftime('%-d')
      end

      def enter_location
        enter_task_location(5)
      end

      def general_notes
        'Who takes notes?'
      end

      def enter_general_notes
        fill_in 'first_appointment[notes]', with: general_notes
      end

      def canceled?
        has_no_list_item?('Initial in person appointment')
        has_canceled_progress_bar_item?('Initial in person appointment')
      end

      def complete?
        has_no_list_item?('Initial in person appointment')
        has_complete_progress_bar_item?('Initial in person appointment')
      end
    end
  end
end
