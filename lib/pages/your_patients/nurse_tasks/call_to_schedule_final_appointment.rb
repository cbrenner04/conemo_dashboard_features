require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for call to schedule final appointment task
    class CallToScheduleFinalAppointment
      include Capybara::DSL
      include NurseTasksForms

      def scheduled?
        has_no_list_item? 'Call to schedule final appointment in about 1 month'
        has_scheduled_progress_bar_item? 'Call to schedule final appointment'
      end

      def active?
        has_list_item?('Call to schedule final appointment')
        has_active_progress_bar_item?('Call to schedule final appointment')
      end

      def complete?
        has_no_list_item?('Call to schedule final appointment')
        has_complete_progress_bar_item?('Call to schedule final appointment')
      end

      def canceled?
        has_no_list_item?('Call to schedule final appointment')
        has_canceled_progress_bar_item?('Call to schedule final appointment')
      end

      def confirm
        confirm_task('Call to schedule final appointment')
        visible?
      end

      def cancel
        cancel_task('Call to schedule final appointment')
      end

      def visible?
        has_css?('h1', text: 'Call to schedule final in person appointment')
      end

      def select_location
        sleep(1)
        selector = all('.select2-container')
        selector[10].click
        location = []
        (2..9).each { |i| location.push("unit #{i}") }
        find('.select2-result-label', text: location.sample).click
      end
    end
  end
end
