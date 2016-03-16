require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/shared/translations'

class YourPatients
  class NurseTasks
    # page object for help requests
    class LackOfConnectivityCall
      include Capybara::DSL
      include NurseTasksForms
      include Translations

      def initialize(lack_of_connectivity_call)
        @locale ||= lack_of_connectivity_call[:locale]
      end

      def title
        locale('Llamada por no-conectividad', 'Chamada por não-conectividade',
               'Call due to no connectivity')
      end

      def active?
        has_list_item?(title)
      end

      def mark_resolved
        mark_task_resolved(title)
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
          'I don\'t know',
          'Unable to reach patient',
          'Patient does not want to continue in the program',
          'Patient did not have time to talk (multiple times)',
          'Patient not willing to talk to nurse (assistant)',
          'Other'
        ].sample
        select_list_item(responses)
        navigation.submit
      end

      def contact_supervisor
        contact_supervisor_for_task(title)
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: 'english')
      end
    end
  end
end
