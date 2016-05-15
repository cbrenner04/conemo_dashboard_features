require './lib/pages/nurse_tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/follow_up_calls'

class NurseTasks
  # page object for second contact
  class FollowUpCallWeekOne
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::FollowUpCalls

    def initialize(follow_up_call_week_one)
      @locale ||= follow_up_call_week_one.fetch(:locale, 'english')
    end

    def active?
      has_list_item?(follow_up_week_one_title) &&
        has_active_progress_bar_item?(follow_up_week_one_title)
    end

    def complete?
      has_no_list_item?(follow_up_week_one_title) &&
        has_complete_progress_bar_item?(follow_up_week_one_title)
    end

    def canceled?
      has_no_list_item?(follow_up_week_one_title) &&
        has_canceled_progress_bar_item?(follow_up_week_one_title)
    end

    def overdue?
      has_list_item?(follow_up_week_one_title) &&
        has_overdue_progress_bar_item?(follow_up_week_one_title)
    end

    def rescheduled?
      has_no_list_item?(follow_up_week_one_title) &&
        has_scheduled_progress_bar_item?(follow_up_week_one_title)
    end

    def confirm
      confirm_task follow_up_week_one_title
      visible?
    end

    def cancel
      cancel_task follow_up_week_one_title
    end

    def open_reschedule_form
      open_reschedule follow_up_week_one_title
    end

    def visible?
      has_css?('h1', text: follow_up_week_one_title)
    end

    def enter_difficulties
      options.delete_at(0)
      options.delete_at(1)
      keys = (0..5).to_a.sample(2).sort
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
      has_date_selectors?(Date.today, 1,
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

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(follow_up_week_one_title)
    end

    def has_difficulties_responses?
      has_text?('Did the patient have any difficulties using CONEMO?: ' \
                "#{@responses[0]}, #{@responses[1]}")
    end

    private

    def cancel_form
      @cancel_form ||= NurseTasks::CancelForm.new(locale: @locale)
    end
  end
end
