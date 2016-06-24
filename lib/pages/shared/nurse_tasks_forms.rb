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

  def enter_task_location(selector_num)
    find('.select2-container', match: :first)
    selector[selector_num].click
    select_list_item(location_options.sample)
  end

  def select_list_item(item)
    find('.select2-result-label', text: item).click
  end

  def select_next_date(num)
    selector[num - 1].click
    select_list_item(tomorrow.strftime('%B'))
    selector[num].click
    tomorrow_int = tomorrow.strftime('%-d').to_i
    if tomorrow_int < 10
      first('.select2-result-label', text: tomorrow_int).click
    else
      select_list_item(tomorrow_int)
    end
  end

  def has_task_form_headings?(num)
    heading = all('.control-label')
    actual_headings = (0..num).map { |i| heading[i].text }
    expect(actual_headings).to eq(expected_headings)
  end

  def has_task_options?(sel, num, opt = options)
    selector[sel].click
    option = all('.select2-result-label')
    actual_options = (0..num).map { |i| option[i].text }
    expect(actual_options).to eq(opt)
  end

  def has_date_selectors?(date, m, d, y)
    month = locale_month(date.strftime('%B'))
    selector[m].has_text?(month) &&
      selector[d].has_text?(date.strftime('%-d')) &&
      selector[y].has_text?(date.strftime('%Y'))
  end

  def has_time_selectors?(hh, mm)
    has_hour_selector?(hh) && selector[mm].has_text?(now.strftime('%M'))
  end

  def has_hour_selector?(hh, time = now)
    selector[hh].has_text? time.strftime('%H')
  end

  def resolve_as_canceled_responses
    @resolve_as_canceled_responses ||= english_cancel_options[1..4]
  end
end
