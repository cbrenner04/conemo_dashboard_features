# frozen_string_literal: true
require './lib/pages/translations/clinical_summary'

# page object for the reports page of active participants
class ClinicalSummary
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::ClinicalSummaryTranslations

  def initialize(clinical_summary)
    @locale ||= clinical_summary.fetch(:locale, 'english')
    @start_date_offset ||= clinical_summary[:start_date_offset]
    @last_seen ||= clinical_summary[:last_seen]
  end

  def open
    find('#participant-menu').click
    find('a', text: clinical_summary_link).click
  end

  def visible?
    has_css?('h2', text: clinical_summary_title)
  end

  def return_to_tasks
    find('a', text: 'Tasks').click
  end

  def has_headers?
    find('th', match: :first)
    array_of_elements_match?(
      elements: all('th'),
      ids: [1, 2, 4],
      expectation: expected_headers
    )
  end

  def has_legend?
    visible?
    array_of_elements_match?(
      elements: find('.table-condensed').all('td'),
      ids: (0..5),
      expectation: expected_legend
    )
  end

  def has_no_non_connectivity_icon?
    has_no_css?('.fa-wifi')
  end

  def has_two_non_connectivity_icons?
    has_css?('.fa-wifi', count: 2)
  end

  def has_three_non_connectivity_icons?
    has_css?('.fa-wifi', count: 3)
  end

  def has_last_seen_timestamp?
    heading = localize(
      spanish: 'Conectado/a por última vez',
      portuguese: 'Última conexão à(s)',
      english: 'Last connection at'
    )
    has_text? "#{heading} #{standard_date(@last_seen)}" \
              "#{locale_hour(@last_seen)}"
  end
end
