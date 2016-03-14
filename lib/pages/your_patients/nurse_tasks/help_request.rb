require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'

class YourPatients
  class NurseTasks
    # page object for help requests
    class HelpRequest
      include Capybara::DSL
      include NurseTasksForms

      def active?
        has_list_item?('Help request')
      end

      def mark_resolved
        mark_task_resolved('Help request')
      end

      def complete_resolution_form
        sleep(1)
        selector[5].click
        responses = [
          'Difficulty using the CONEMO app',
          'Question about the intervention',
          'Pressed help button by mistake',
          'Not related to CONEMO (e.g. health)',
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
        contact_supervisor_for_task('Help request')
      end

      private

      def navigation
        @navigation ||= Navigation.new(locale: 'english')
      end
    end
  end
end
