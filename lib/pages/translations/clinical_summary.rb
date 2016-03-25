require './lib/pages/translations/nurse_tasks'
path = './lib/pages/translations/clinical_summary'
Dir["#{path}/*.rb"].each { |file| require file }

module Translations
  # translations for clinical summary page
  module ClinicalSummary
    include Translations::NurseTasks
    include Translations::ClinicalSummary::EnglishSummary
    include Translations::ClinicalSummary::SpanishSummary
    include Translations::ClinicalSummary::PortugueseSummary

    def clinical_summary_link
      locale('Historia del Paciente', 'Histórico do participante',
             'Clinical Summary')
    end

    def lesson_table_heading
      locale('Sesión', 'Sessão', 'Lesson')
    end

    def notes_heading
      locale('Notas', 'Anotações', 'Notes')
    end

    def expected_links
      locale(spanish_links, portuguese_links, english_links)
    end

    def expected_headers
      locale(spanish_headers, portuguese_headers, english_headers)
    end

    def expected_legend
      locale(spanish_legend, portuguese_legend, english_legend)
    end

    def expected_notes_headers
      [final_appointment_title, follow_up_week_three_title,
       follow_up_week_one_title, initial_appointment_title]
    end

    def expected_release_dates_1
      locale(spanish_release_dates_1, portuguese_release_dates,
             english_release_dates)
    end

    def expected_release_dates_2
      locale(spanish_release_dates_2, portuguese_release_dates,
             english_release_dates)
    end

    def expected_contact_dates
      locale(spanish_contact_dates, portuguese_contact_dates,
             english_contact_dates)
    end

    def expected_notes_form_heading
      locale(spanish_notes_form_heading, portuguese_notes_form_heading,
             english_notes_form_heading)
    end

    def expected_notes_form_labels
      locale(spanish_notes_form_labels, portuguese_notes_form_labels,
             english_notes_form_labels)
    end

    def expected_notes_reason_options
      locale(spanish_notes_reason_options, portuguese_notes_reason_options,
             english_notes_reason_options)
    end
  end
end
