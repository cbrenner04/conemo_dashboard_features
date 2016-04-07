require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/reschedule_form'

class NurseTasks
  # page object for task cancellation form
  class RescheduleForm
    include RSpec::Matchers
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksTranslations::RescheduleFormTranslations

    def initialize(reschedule_form)
      @locale ||= reschedule_form[:locale]
    end

    def complete
      sleep(1)
      select_next_date(2)
      selector[5].click
      @reschedule_reason ||= expected_options.sample
      select_list_item(@reschedule_reason)
      navigation.submit
    end

    def has_form_headings?
      actual_headings = (0..2).map { |i| all('.control-label')[i].text }
      expect(actual_headings).to eq(expected_headings)
    end

    def has_reason_options?
      selector[5].click
      actual_options = (0..4).map { |i| all('.select2-result-label')[i].text }
      expect(actual_options).to eq(expected_options)
    end

    def has_current_date_selections?
      has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
        has_hour_selector?(3)
    end

    def has_reschedule_reason?
      has_text? @reschedule_reason
    end

    private

    def navigation
      @navigation ||= Navigation.new(locale: @locale)
    end
  end
end
