# frozen_string_literal: true
require './lib/pages/translations/clinical_summary/localized_summary'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  # translations for clinical summary page
  module ClinicalSummaryTranslations
    include Translations::NurseTaskTitles
    include Translations::ClinicalSummaryTranslations::LocalizedSummary

    def clinical_summary_link
      localize(
        spanish: 'Historial de Participación',
        portuguese: 'Histórico do participante',
        english: 'Clinical Summary'
      )
    end

    def clinical_summary_title
      localize(
        spanish: 'Historia del Paciente',
        portuguese: 'Histórico do Participante',
        english: 'Clinical Summary'
      )
    end

    def lesson_table_heading
      localize(spanish: 'Sesión', portuguese: 'Sessão', english: 'Lesson')
    end

    def notes_heading
      localize(spanish: 'Notas', portuguese: 'Anotações', english: 'Notes')
    end

    def expected_headers
      localize headers
    end

    def expected_legend
      localize legend
    end

    def expected_notes_headers
      [final_appointment_title, follow_up_week_three_title,
       follow_up_week_one_title, initial_appointment_title]
    end

    def expected_release_dates_1
      localize(
        spanish: spanish_release_dates_1,
        portuguese: portuguese_release_dates,
        english: english_release_dates
      )
    end

    def expected_release_dates_2
      localize(
        spanish: spanish_release_dates_2,
        portuguese: portuguese_release_dates,
        english: english_release_dates
      )
    end

    def expected_contact_dates
      [0, 14, 35, 42].map { |contact_date| standard_date(today - contact_date) }
    end

    def expected_notes_form_heading
      localize notes_form_headings
    end

    def expected_notes_form_labels
      localize notes_form_labels
    end

    def additional_note_title
      localize(
        spanish: 'Nota adicional',
        portuguese: 'Nota adicional',
        english: 'Additional note'
      )
    end
  end
end
