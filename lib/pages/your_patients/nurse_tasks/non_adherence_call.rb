require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations'
require './lib/pages/shared/translations/nurse_tasks/non_adherence_call'

class YourPatients
  class NurseTasks
    # page object for non adherence call
    class NonAdherenceCall
      include Capybara::DSL
      include NurseTasksForms
      include Translations
      include Translations::NurseTasks::NonAdherenceCallTranslations

      def initialize(non_adherence_call)
        @locale ||= non_adherence_call[:locale]
      end

      def title
        locale('Llamada por no-adherencia', 'Chamada por não aderência',
               'Non-adherence call')
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
        select_list_item(locale(spanish_responses, portuguese_responses,
                                english_responses).sample)
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
