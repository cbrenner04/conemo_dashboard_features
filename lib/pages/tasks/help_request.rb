# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
require './lib/pages/translations/nurse_tasks/help_request'

module Tasks
  # page object for help requests
  class HelpRequest
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::HelpRequest

    def initialize(help_request)
      @locale ||= help_request.fetch(:locale, 'english')
      @task_title = help_request_title
    end

    def mark_resolved
      mark_task_resolved help_request_title
      visible?
    end

    def complete_resolution_form
      find('.select2-container', match: :first)
      selector[5].click
      options.delete(localize(spanish: 'Otra', portuguese: 'Outra razão',
                              english: 'Other'))
      options.delete(localize(spanish: 'Otra', portuguese: 'Outra',
                              english: 'Other'))
      options.delete(localize(spanish: 'CANCELAR llamada (no realizada)',
                              portuguese: 'Não realizado / Cancelar tarefa',
                              english: 'Not done / CANCEL task'))
      options.delete(localize(spanish: 'Razón de la solicitud de ayuda',
                              portuguese: 'Razões', english: 'Reasons'))
      @response ||= options.sample
      select_list_item(@response)
      navigation.submit
    end

    def has_response?
      has_text? @response
    end

    def contact_supervisor
      contact_supervisor_for_task help_request_title
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
        ids: (0..11),
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

    def has_resolution_confirmation_alert?
      has_css?(
        '.alert', text: localize(
          spanish: 'Solicitud de ayuda guardada exitosamente',
          portuguese: 'Pedido de ajuda salvo com sucesso',
          english: 'Help request saved successfully'
        )
      )
    end

    def has_helper_text?
      has_text? localize(
        spanish: 'Por favor, indica la razón de la solicitud de ayuda O por ' \
                 'qué estás suspendiendo la tarea',
        portuguese: 'Por favor, indicar o motivo da solicitação de ajuda OU ' \
                    'porque esta tarefa está sendo cancelada',
        english: 'Please indicate the reason for help request or why you are' \
                 ' canceling the task'
      )
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
