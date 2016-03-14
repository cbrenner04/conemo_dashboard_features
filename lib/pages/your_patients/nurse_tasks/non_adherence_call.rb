require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for non adherence call
    class NonAdherenceCall
      include Capybara::DSL
      include NurseTasksForms

      def active?
        has_list_item?('Non adherence call')
      end

      def mark_resolved
        mark_task_resolved('Non adherence call')
      end

      def complete_resolution_form
        sleep(1)
        selector[5].click
        responses = [
          'Difficulties using CONEMO',
          'No time for CONEMO',
          'Not willing to use CONEMO',
          'Failure of data transfer (sessions were completed)',
          'Patient is traveling (without the smartphone)',
          'Patient does not state a reason',
          'Other',
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
        contact_supervisor_for_task('Non adherence call')
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: 'english')
      end
    end
  end
end
