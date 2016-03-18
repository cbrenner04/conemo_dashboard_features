require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for the First Appointment Form in Active Participants
    class InitialInPersonAppointment
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks

      def initialize(initial_in_person_appointment)
        @locale ||= initial_in_person_appointment[:locale]
      end

      def active?
        has_list_item?(initial_appointment_title) &&
          has_active_progress_bar_item?(initial_appointment_title)
      end

      def canceled?
        has_no_list_item?(initial_appointment_title) &&
          has_canceled_progress_bar_item?(initial_appointment_title)
      end

      def complete?
        has_no_list_item?(initial_appointment_title) &&
          has_complete_progress_bar_item?(initial_appointment_title)
      end

      def scheduled?
        has_no_list_item?(initial_appointment_title) &&
          has_scheduled_progress_bar_item?(initial_appointment_title)
      end

      def visible?
        has_css?('h1', text: initial_appointment_title)
      end

      def confirm
        confirm_task initial_appointment_title
        visible?
      end

      def cancel
        cancel_task initial_appointment_title
      end

      def open_reschedule_form
        open_reschedule initial_appointment_title
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def enter_next_contact_date
        select_next_date(8)
      end

      def has_next_contact_date?
        next_week = Date.today + 7
        selector[6].has_text?(next_week.strftime('%B')) &&
          selector[7].has_text?(next_week.strftime('%-d'))
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
    end
  end
end
