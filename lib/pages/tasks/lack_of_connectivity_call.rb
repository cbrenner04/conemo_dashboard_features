# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
require './lib/pages/translations/nurse_tasks/lack_of_connectivity_call'

module Tasks
  # page object for help requests
  class LackOfConnectivityCall
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::LackOfConnectivityCall

    def initialize(lack_of_connectivity_call)
      @locale ||= lack_of_connectivity_call.fetch(:locale, 'english')
      @task_title = lack_of_connectivity_call_title
    end

    def mark_resolved
      mark_task_resolved(lack_of_connectivity_call_title)
      has_css?('h1', text: lack_of_connectivity_call_title)
    end

    def complete_resolution_form
      find('.select2-container', match: :first)
      selector[5].click
      options.delete('Other')
      options.delete('Not done / CANCEL task')
      options.delete('Reasons')
      @response ||= options.sample
      select_list_item(@response)
      navigation.submit
    end

    def has_response?
      has_text? @response
    end

    def contact_supervisor
      execute_script 'window.scrollBy(0,100)'
      contact_supervisor_for_task(lack_of_connectivity_call_title)
    end

    def toggle_options_list
      custom_click(selector[5])
    end

    def has_form_headings?
      has_task_form_headings?(1)
    end

    def has_reason_options?
      selector[5].click
      array_of_elements_equal?(
        elements: all('.select2-result-label'),
        ids: (0..12),
        expectation: options
      )
    end

    def resolve_as_canceled
      find('.select2-container', match: :first)
      selector[5].click
      @cancel_response ||= resolve_as_canceled_responses.sample
      select_list_item(@cancel_response)
      navigation.submit
    end

    def has_cancel_reason?
      has_text? @cancel_response
    end

    def has_helper_text?
      has_text? localize(
        spanish: 'Por favor, indica la razón para la falta de conectividad O' \
                 ' por qué estás suspendiendo la tarea',
        portuguese: 'Por favor, indicar a razão da falta de conectividade OU' \
                    ' porque esta tarefa está sendo cancelada',
        english: 'Please indicate the reason for lack of connectivity or why' \
                 ' you are canceling the task'
      )
    end
  end
end
