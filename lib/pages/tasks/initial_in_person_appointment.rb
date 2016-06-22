# frozen_string_literal: true
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
translations_path = './lib/pages/translations/'
require "#{translations_path}nurse_tasks/initial_in_person_appointment"

module Tasks
  # page object for the First Appointment Form in Active Participants
  class InitialInPersonAppointment
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::InitialInPersonAppointment

    def initialize(initial_in_person_appointment)
      @locale ||= initial_in_person_appointment.fetch(:locale, 'english')
      @task_title = initial_appointment_title
    end

    def reschedule
      open_reschedule_form
      reschedule_task
    end

    def enter_yesterday_as_contact_date
      selector[1].click
      select_list_item yesterday.strftime('%B')
      selector[2].click
      yest_int = yesterday.strftime('%-d').to_i
      if yest_int < 10
        first('.select2-result-label', text: yest_int).click
      else
        select_list_item(yest_int)
      end
    end

    def toggle_options_list
      custom_click(selector[5])
    end

    def enter_location
      enter_task_location(5)
    end

    def general_notes
      'Who takes notes?'
    end

    def enter_general_notes
      fill_in 'first_appointment[notes]', with: general_notes
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

    def has_site_options?
      has_task_options?(5, 2, location_options)
    end

    def active_today?
      has_css?('.progress-bar-info',
               text: "#{initial_appointment_title} " \
                     "#{standard_date(today)}")
    end

    def completed_yesterday?
      has_no_list_item? &&
        has_css?('.progress-bar-success',
                 text: "#{initial_appointment_title} " \
                       "#{standard_date(yesterday)}")
    end
  end
end
