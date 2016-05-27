require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
require './lib/pages/translations/nurse_tasks/follow_up_calls'

module Tasks
  # page object for second contact
  class FollowUpCallWeekOne
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::FollowUpCalls

    def initialize(follow_up_call_week_one)
      @locale ||= follow_up_call_week_one.fetch(:locale, 'english')
      @task_title = follow_up_week_one_title
    end

    def enter_difficulties
      keys = (3..8).to_a.sample(2).sort
      @responses = [options[keys[0]], options[keys[1]]]
      @responses.each { |option| check option }
    end

    def general_notes
      'Notes are so much fun'
    end

    def enter_notes
      fill_in 'second_contact[notes]', with: general_notes
    end

    def has_form_headings?
      has_task_form_headings?(3)
    end

    def has_current_date_selections?
      has_date_selectors?(today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_hour_selector?(3)
    end

    def has_difficulties_options?
      checkboxes = all('.checkbox')
      actual = (0..8).map { |i| checkboxes[i].text }
      expect(actual).to eq(options)
    end

    def has_difficulties_directions?
      has_text? difficulty_directions
    end

    def has_difficulties_responses?
      has_text?('Did the patient have any difficulties using CONEMO?: ' \
                "#{@responses[0]}, #{@responses[1]}")
    end

    def scheduled_a_week_from_yesterday?
      has_css?('.progress-bar-future',
               text: "#{follow_up_week_one_title} #{standard_date(today + 6)}")
    end
  end
end
