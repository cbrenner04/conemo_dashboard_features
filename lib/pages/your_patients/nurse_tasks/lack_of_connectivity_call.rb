require './lib/pages/shared/nurse_tasks_forms'

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

      def contact_supervisor
        contact_supervisor_for_task('Lack of connectivity call')
      end
    end
  end
end
