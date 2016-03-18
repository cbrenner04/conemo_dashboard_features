require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/shared/translations/nurse_tasks/lack_of_connectivity_call'

class YourPatients
  class NurseTasks
    # page object for help requests
    class LackOfConnectivityCall
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks::LackOfConnectivityCall

      def initialize(lack_of_connectivity_call)
        @locale ||= lack_of_connectivity_call[:locale]
      end

      def active?
        has_list_item?(lack_of_connectivity_call_title)
      end

      def mark_resolved
        mark_task_resolved(lack_of_connectivity_call_title)
      end

      def complete_resolution_form
        sleep(1)
        selector[5].click
        select_list_item(locale(spanish_responses, portuguese_responses,
                                english_responses).sample)
        navigation.submit
      end

      def contact_supervisor
        contact_supervisor_for_task(lack_of_connectivity_call_title)
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: 'english')
      end
    end
  end
end
