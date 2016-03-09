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

      def contact_supervisor
        contact_supervisor_for_task('Non adherence call')
      end
    end
  end
end
