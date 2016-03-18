require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/shared/translations/nurse_tasks/help_request'

class YourPatients
  class NurseTasks
    # page object for help requests
    class HelpRequest
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks::HelpRequest

      def active?
        has_list_item? help_request_title
      end

      def mark_resolved
        mark_task_resolved help_request_title
      end

      def complete_resolution_form
        sleep(1)
        selector[5].click
        select_list_item(locale(spanish_responses, portuguese_responses,
                                english_responses).sample)
        navigation.submit
      end

      def contact_supervisor
        contact_supervisor_for_task help_request_title
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: 'english')
      end
    end
  end
end
