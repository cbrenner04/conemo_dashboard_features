require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/cancel_form'

class NurseTasks
  # page object for task cancellation form
  class CancelForm
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTasks::CancellationForm

    def initialize(cancel_form)
      @locale ||= cancel_form[:locale]
    end

    def complete
      toggle_options_list
      select_list_item(options.sample)
      navigation.submit
    end

    def has_form_headings?
      has_css?('.control-label', text: locale('Razones', 'Motivo', 'Reason'))
    end

    def has_reason_options?
      has_task_options?(0, 4)
    end

    def toggle_options_list
      sleep(1)
      selector[0].click
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
