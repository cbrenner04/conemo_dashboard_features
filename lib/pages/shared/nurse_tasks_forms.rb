# frozen_string_literal: true
require './lib/pages/translations/navigation'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/nurse_tasks_unscheduled'

# module for shared methods in nurse task forms
module NurseTasksForms
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::NavigationTranslations
  include Translations::NurseTaskTitles
  include Translations::NurseTasksUnscheduled

  def visible?
    has_css?('h1', text: @task_title)
  end

  def selector
    @selector ||= all('.select2-container')
  end

  def enter_task_location(selector_id)
    find('.select2-container', match: :first)
    selector[selector_id].click
    select_list_item(location_options.sample)
  end

  def select_list_item(item)
    find('.select2-result-label', text: item).click
  end

  def select_next_date(day_selector_id)
    selector[day_selector_id - 1].click
    select_list_item(tomorrow.strftime('%B'))

    selector[day_selector_id].click
    tomorrow_int = tomorrow.strftime('%-d').to_i

    if tomorrow_int < 10
      first('.select2-result-label', text: tomorrow_int).click
    else
      select_list_item(tomorrow_int)
    end
  end

  def has_task_form_headings?(number_of_labels)
    array_of_elements_equal?(
      elements: all('.control-label'),
      ids: (0..number_of_labels),
      expectation: expected_headings
    )
  end

  def has_task_options?(selector_id, number_of_labels,
                        expected_options = options)
    selector[selector_id].click
    array_of_elements_equal?(
      elements: all('.select2-result-label'),
      ids: (0..number_of_labels),
      expectation: expected_options
    )
  end

  def has_current_date_selections?
    hour_selector_id = 3

    has_current_date_selectors? &&
      has_hour_selector?(hour_selector_id)
  end

  def has_alt_date_selections?
    hour_selector_id = 3
    time = (now - (2 * one_hour))

    has_current_date_selectors? &&
      has_hour_selector?(hour_selector_id, time)
  end

  def has_next_contact_date?
    hour_selector_id = 8
    minute_selector_id = 9

    has_next_date_selectors? &&
      has_hour_selector?(hour_selector_id) &&
      selector[minute_selector_id].has_text?(now.strftime('%M'))
  end

  def resolve_as_canceled_responses
    @resolve_as_canceled_responses ||= english_cancel_options[1..4]
  end

  private

  def has_current_date_selectors?
    selector[1].has_text?(locale_month(today.strftime('%B'))) &&
      selector[current_date_day_selector_id].has_text?(today.strftime('%-d')) &&
      selector[current_date_year_selector_id].has_text?(today.strftime('%Y'))
  end

  def has_next_contact_selectors?
    selector[6].has_text?(locale_month(today.strftime('%B'))) &&
      selector[next_date_day_selector_id].has_text?(today.strftime('%-d')) &&
      selector[next_date_year_selector_id].has_text?(today.strftime('%Y'))
  end

  def has_hour_selector?(hour_selector_id, time = now)
    selector[hour_selector_id].has_text? time.strftime('%H')
  end

  def current_date_day_selector_id
    localize(spanish: 0, portuguese: 0, english: 2)
  end

  def current_date_year_selector_id
    localize(spanish: 2, portuguese: 2, english: 0)
  end

  def next_date_day_selector_id
    localize(spanish: 5, portuguese: 5, english: 7)
  end

  def next_date_year_selector_id
    localize(spanish: 7, portuguese: 7, english: 5)
  end
end
