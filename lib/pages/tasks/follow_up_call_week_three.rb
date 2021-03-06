# frozen_string_literal: true
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
require './lib/pages/translations/nurse_tasks/follow_up_calls'

module Tasks
  # page object for first contact page of active participants
  class FollowUpCallWeekThree
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::FollowUpCalls

    def initialize(follow_up_call_week_three)
      @locale ||= follow_up_call_week_three.fetch(:locale, 'english')
      @task_title = follow_up_week_three_title
    end

    def enter_difficulties
      keys = (3..8).to_a.sample(2).sort
      @responses = [options[keys[0]], options[keys[1]]]
      @responses.each { |option| check option }
    end

    def general_notes
      'Notes notes notes notes'
    end

    def enter_general_notes
      fill_in 'third_contact[notes]', with: general_notes
    end

    def has_form_headings?
      has_task_form_headings?(3)
    end

    def has_difficulties_options?
      array_of_elements_equal?(
        elements: all('.checkbox'),
        ids: (0..8),
        expectation: options
      )
    end

    def has_difficulties_directions?
      has_text? difficulty_directions
    end

    def has_difficulties_responses?
      has_text?('Did the patient have any difficulties using CONEMO?: ' \
                "#{@responses[0]}, #{@responses[1]}")
    end

    def scheduled_3_weeks_from_yesterday?
      has_css?('.progress-bar-future',
               text: "#{follow_up_week_three_title} " \
                     "#{standard_date(today + ((3 * 7) - 1))}")
    end

    private

    def cancel_form
      @cancel_form ||= Tasks::CancelForm.new(locale: @locale)
    end
  end
end
