require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/cancel_form'

class NurseTasks
  # page object for task cancellation form
  class CancelForm
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::CancellationForm

    def initialize(cancel_form)
      @locale ||= cancel_form[:locale]
    end

    def complete
      toggle_options_list
      @cancellation_reason ||= options.sample
      select_list_item(@cancellation_reason)
      navigation.submit
    end

    def has_form_title?
      has_css?('h1', text: localize(spanish: 'Cancelar punto de contacto',
                                    portuguese: 'Cancelar ponto de contato',
                                    english: 'Cancel contact point'))
    end

    def has_cancel_alert?(task)
      has_css?('.alert',
               text: localize(spanish: "#{task} cancelada exitosamente",
                              portuguese: "#{task} cancelado com sucesso",
                              english: "#{task} canceled successfully"))
    end

    def has_form_headings?
      has_css?('.control-label', text: localize(spanish: 'Razones',
                                                portuguese: 'Motivo',
                                                english: 'Reason'))
    end

    def has_reason_options?
      has_task_options?(0, 4)
    end

    def toggle_options_list
      sleep(0.25)
      selector[0].click
    end

    def has_cancellation_reason?
      has_text? @cancellation_reason
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
