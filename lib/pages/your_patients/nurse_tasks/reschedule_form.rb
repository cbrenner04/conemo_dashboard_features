require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for task cancellation form
    class RescheduleForm
      include Capybara::DSL
      include NurseTasksForms

      def initialize(reschedule_form)
        @locale ||= reschedule_form[:locale]
      end

      def complete
        sleep(1)
        selector[2].click
        select_list_item((Date.today + 1).strftime('%-d'))
        navigation.submit
      end

      def has_form_headings?
        has_css?('.control-label', text: 'Scheduled at')
      end

      def has_current_date_selections?
        has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
          has_hour_selector?(3)
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: @locale)
      end
    end
  end
end
