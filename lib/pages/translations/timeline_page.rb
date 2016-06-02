# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/timeline_page/localized_timeline.rb'

module Translations
  # module for Contact Information page
  module TimelineTranslations
    include Translations
    include Translations::NurseTaskTitles
    include Translations::TimelineTranslations::LocalizedTimeline

    def timeline_page_title
      localize(
        spanish: 'Todos los contactos realizados',
        portuguese: 'Todos os contatos realizados',
        english: 'All concluded contacts'
      )
    end

    def expected_timeline_titles
      localize(
        spanish: [
          confirmation_call_title, initial_appointment_title,
          follow_up_week_one_title, non_adherence_call_title,
          follow_up_week_three_title, lack_of_connectivity_call_title,
          help_request_title, call_to_schedule_final_title,
          final_appointment_title
        ],
        portuguese: [
          confirmation_call_title, initial_appointment_title,
          follow_up_week_one_title, non_adherence_call_title,
          follow_up_week_three_title, lack_of_connectivity_call_title,
          help_request_title, call_to_schedule_final_title,
          final_appointment_title
        ],
        english: [
          confirmation_call_title, initial_appointment_title,
          "#{follow_up_week_one_title} information", non_adherence_call_title,
          "#{follow_up_week_three_title} information",
          lack_of_connectivity_call_title, help_request_title,
          call_to_schedule_final_title, final_appointment_title
        ]
      )
    end

    def expected_timeline_dates
      localize timeline_dates
    end

    def expected_timeline_headings
      localize timeline_headings
    end
  end
end
