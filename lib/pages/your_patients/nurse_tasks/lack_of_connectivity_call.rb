require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'

class YourPatients
  class NurseTasks
    # page object for help requests
    class LackOfConnectivityCall
      include Capybara::DSL
      include NurseTasksForms

      def active?
        has_list_item?('Lack of connectivity call')
      end

      def mark_resolved
        mark_task_resolved('Lack of connectivity call')
      end

      def complete_resolution_form
        sleep(1)
        selector[5].click
        responses = [
          'Mobile data turned off',
          'No internet coverage',
          'Mobile plan used up',
          'Cellphone turned off',
          'Other',
          'I don\'t know'
        ].sample
        select_list_item(responses)
        navigation.submit
      end

      def contact_supervisor
        contact_supervisor_for_task('Lack of connectivity call')
      end

      private

      def navigation
        @navigation ||= Navigation.new
      end
    end
  end
end
