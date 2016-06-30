# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Tasks
  # page object for progress bar on nurse tasks page
  class ProgressBar
    include Capybara::DSL
    include Translations::NurseTaskTitles
    include Translations::NurseTasksTranslations

    def initialize(progress_bar)
      @locale ||= progress_bar.fetch(:locale, 'english')
    end

    def empty?
      sched_tasks = [confirmation_call_title, initial_appointment_title,
                     follow_up_week_one_title, follow_up_week_three_title,
                     call_to_schedule_final_title, final_appointment_title]
      sched_tasks.all? { |task| has_css?('.progress-bar-future', text: task) }
    end

    def has_heading?
      has_css?('h3', text: progress_bar_heading)
    end
  end
end
