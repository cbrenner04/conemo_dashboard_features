require './lib/pages/nurse_tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/follow_up_call_week_three'

class NurseTasks
  # page object for first contact page of active participants
  class FollowUpCallWeekThree
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::FollowUpCallWeekThree

    def initialize(follow_up_call_week_three)
      @locale ||= follow_up_call_week_three[:locale]
    end

    def active?
      has_list_item?(follow_up_week_three_title) &&
        has_active_progress_bar_item?(follow_up_week_three_title)
    end

    def complete?
      has_no_list_item?(follow_up_week_three_title) &&
        has_complete_progress_bar_item?(follow_up_week_three_title)
    end

    def canceled?
      has_no_list_item?(follow_up_week_three_title) &&
        has_canceled_progress_bar_item?(follow_up_week_three_title)
    end

    def confirm
      confirm_task follow_up_week_three_title
      visible?
    end

    def overdue?
      has_list_item?(follow_up_week_three_title) &&
        has_overdue_progress_bar_item?(follow_up_week_three_title)
    end

    def cancel
      cancel_task follow_up_week_three_title
    end

    def open_reschedule_form
      open_reschedule follow_up_week_three_title
    end

    def visible?
      has_css?('h1', text: follow_up_week_three_title)
    end

    def enter_difficulties
      options.delete_at(1)
      options.sample(2).each { |option| check option }
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

    def has_current_date_selections?
      has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
        has_hour_selector?(3)
    end

    def has_difficulties_options?
      actual = (0..7).map { |i| all('.checkbox')[i].text }
      expect(actual).to eq(options)
    end

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(follow_up_week_three_title)
    end

    private

    def cancel_form
      @cancel_form ||= NurseTasks::CancelForm.new(locale: @locale)
    end
  end
end
