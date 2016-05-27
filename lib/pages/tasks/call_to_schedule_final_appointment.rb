require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
translations_path = './lib/pages/translations/'
require "#{translations_path}nurse_tasks/call_to_schedule_final_appointment"

module Tasks
  # page object for call to schedule final appointment task
  class CallToScheduleFinalAppointment
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::CallToScheduleFinalAppointment

    def initialize(call_to_schedule_final_appointment)
      @locale ||= call_to_schedule_final_appointment.fetch(:locale, 'english')
      @task_title = call_to_schedule_final_title
    end

    def enter_next_contact_date
      select_next_date(7)
    end

    def update_contact_at_to_today
      find('.select2-container', match: :first)
      selector[1].click
      select_list_item(today.strftime('%B'))
      selector[2].click
      today_int = today.strftime('%-d').to_i
      if today_int < 10
        first('.select2-result-label', text: today_int).click
      else
        select_list_item(today_int)
      end
    end

    def toggle_options_list
      selector[10].click
    end

    def select_location
      find('.select2-container', match: :first)
      selector[10].click
      find('.select2-result-label', text: location_options.sample).click
    end

    def has_form_headings?
      has_task_form_headings?(2)
    end

    def has_current_date_selections?
      has_date_selectors?(today, 1,
                          localize(spanish: 0, portuguese: 0, english: 2),
                          localize(spanish: 2, portuguese: 2, english: 0)) &&
        has_hour_selector?(3)
    end

    def has_next_contact_date?
      has_date_selectors?(today, 6,
                          localize(spanish: 5, portuguese: 5, english: 7),
                          localize(spanish: 7, portuguese: 7, english: 5)) &&
        has_time_selectors?(8, 9)
    end

    def has_location_options?
      has_task_options?(10, 2, location_options)
    end

    def scheduled_6_weeks_from_yesterday?
      has_css?('.progress-bar-future',
               text: "#{call_to_schedule_final_title} " \
                     "#{standard_date(today + ((6 * 7) - 1))}")
    end
  end
end
