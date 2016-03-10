require './lib/pages/shared/nurse_tasks_forms'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class AdditionalContact
      include Capybara::DSL
      include NurseTasksForms

      def open
        click_on 'Additional contact'
      end

      def create
        open
        sleep(1)
        selector[5].click
        select_list_item(['in person', 'phone call'].sample)
        navigation.submit
      end
    end
  end
end
