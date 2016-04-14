require './lib/pages/translations/nurse_tasks_titles'

module Translations
  # module for Contact Information page
  module TimelineTranslations
    include Translations
    include Translations::NurseTaskTitles

    def timeline_page_title
      locale('Todos los contactos realizados', 'Todos os contatos realizados',
             'All concluded contacts')
    end

    def expected_timeline_titles
      locale(
        [confirmation_call_title, initial_appointment_title,
         follow_up_week_one_title, non_adherence_call_title,
         follow_up_week_three_title, lack_of_connectivity_call_title,
         help_request_title, call_to_schedule_final_title,
         final_appointment_title],
        [confirmation_call_title, initial_appointment_title,
         follow_up_week_one_title, non_adherence_call_title,
         follow_up_week_three_title, lack_of_connectivity_call_title,
         help_request_title, call_to_schedule_final_title,
         final_appointment_title],
        [confirmation_call_title, initial_appointment_title,
         "#{follow_up_week_one_title} information", non_adherence_call_title,
         "#{follow_up_week_three_title} information",
         lack_of_connectivity_call_title, help_request_title,
         call_to_schedule_final_title, final_appointment_title]
      )
    end

    def expected_contact_info_contact_dates
      locale(spanish_contact_info_contact_dates,
             portuguese_contact_info_contact_dates,
             english_contact_info_contact_dates)
    end

    def expected_timeline_headings
      locale(spanish_timeline_headings, portuguese_timeline_headings,
             english_timeline_headings)
    end
  end
end
