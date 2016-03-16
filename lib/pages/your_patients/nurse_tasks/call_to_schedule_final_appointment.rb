require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations'

class YourPatients
  class NurseTasks
    # page object for call to schedule final appointment task
    class CallToScheduleFinalAppointment
      include Capybara::DSL
      include NurseTasksForms
      include Translations

      def initialize(call_to_schedule_final_appointment)
        @locale ||= call_to_schedule_final_appointment[:locale]
      end

      def title
        locale('Llamada para programar cita fina',
               'Chamada para agendar encontro final',
               'Call to schedule final in person appointment')
      end

      def scheduled?
        has_no_list_item?(title) && has_scheduled_progress_bar_item?(title)
      end

      def active?
        has_list_item?(title) && has_active_progress_bar_item?(title)
      end

      def complete?
        has_no_list_item?(title) && has_complete_progress_bar_item?(title)
      end

      def canceled?
        has_no_list_item?(title) && has_canceled_progress_bar_item?(title)
      end

      def confirm
        confirm_task title
        visible?
      end

      def cancel
        cancel_task title
      end

      def open_reschedule_form
        open_reschedule title
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def visible?
        has_css?('h1', text: title)
      end

      def enter_next_contact_date
        select_next_date(7)
      end

      def update_contact_at_to_today
        sleep(1)
        selector[2].click
        select_list_item((Date.today).strftime('%-d'))
      end

      def has_next_contact_date?
        next_week = Date.today + 7
        selector[6].has_text?(next_week.strftime('%B')) &&
          selector[7].has_text?(next_week.strftime('%-d'))
      end

      def select_location
        sleep(1)
        selector[10].click
        location = []
        (2..9).each { |i| location.push("unit #{i}") }
        find('.select2-result-label', text: location.sample).click
      end
    end
  end
end
