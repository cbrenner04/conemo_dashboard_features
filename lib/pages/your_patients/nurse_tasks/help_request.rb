require './lib/pages/shared/nurse_tasks_forms'

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

      def contact_supervisor
        contact_supervisor_for_task('Help request')
      end
    end
  end
end
