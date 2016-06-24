# frozen_string_literal: true
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
require './lib/pages/translations/nurse_tasks/confirmation_call'

module Tasks
  # page object for first contact page of active participants
  class ConfirmationCall
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::ConfirmationCall

    def initialize(confirmation_call)
      @locale ||= confirmation_call.fetch(:locale, 'english')
      @task_title = confirmation_call_title
    end

    def visible_on_timeline?
      has_css?('.timeline-title', text: confirmation_call_title)
    end

    def enter_next_contact_date
      select_next_date(7)
    end

    def toggle_options_list
      custom_click(selector[10])
    end

    def enter_first_appt_location
      enter_task_location(10)
    end

    def has_form_headings?
      has_task_form_headings?(2)
    end

    def has_site_options?
      has_task_options?(10, 2, location_options)
    end

    def has_time_ago_in_words?
      has_text? localize(
        spanish: 'hace cerca de 2 horas',
        portuguese: 'aproximadamente 2 horas atrás',
        english: 'about 2 hours ago'
      )
    end
  end
end
