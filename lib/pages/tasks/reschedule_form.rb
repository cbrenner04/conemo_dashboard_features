# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/reschedule_form'

module Tasks
  # page object for task cancellation form
  class RescheduleForm
    include RSpec::Matchers
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::RescheduleFormTranslations

    def initialize(reschedule_form)
      @locale ||= reschedule_form.fetch(:locale, 'english')
    end

    def complete
      find('.select2-container', match: :first)
      select_next_date(2)
      selector[5].click
      @reschedule_reason ||= expected_options.sample
      select_list_item(@reschedule_reason)
      navigation.submit
    end

    def has_form_headings?
      find('.control-label', match: :first)
      array_of_elements_equal?(
        elements: all('.control-label'),
        ids: (0..2),
        expectation: expected_headings
      )
    end

    def has_reason_options?
      selector[5].click
      array_of_elements_equal?(
        elements: all('.select2-result-label'),
        ids: (0..4),
        expectation: expected_options
      )
    end

    def has_reschedule_reason?
      has_text? @reschedule_reason
    end

    def toggle_options_list
      custom_click(selector[5])
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
