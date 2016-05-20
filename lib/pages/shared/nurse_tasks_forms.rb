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

  def mark_task_resolved(type)
    panel(type).find('a', text: mark_resolved_button).click
  end

  def contact_supervisor_for_task(type)
    panel(type).find("input[value = \"#{contact_supervisor_button}\"]").click
    accept_alert contact_supervisor_alert
    find('.alert', text: contact_supervisor_confirmation)
  end

  def confirm_task(type)
    panel(type).find('a', text: confirm_button).click
  end

  def cancel_task(type)
    panel(type).find('a', text: cancel_button).click
  end

  def open_reschedule(type)
    panel(type).find('a', text: reschedule_button).click
  end

  def selector
    @selector ||= all('.select2-container')
  end

  def has_list_item?(text)
    has_css?('.panel', text: text)
  end

  def has_no_list_item?(text)
    has_no_css?('.panel', text: text)
  end

  def has_active_progress_bar_item?(text)
    has_css?('.progress-bar-info', text: text)
  end

  def has_complete_progress_bar_item?(text)
    has_css?('.progress-bar-success', text: text)
  end

  def has_canceled_progress_bar_item?(text)
    has_css?('.progress-bar-error', text: text)
  end

  def has_overdue_progress_bar_item?(text)
    has_css?('.progress-bar-danger', text: text)
  end

  def has_scheduled_progress_bar_item?(text)
    has_css?('.progress-bar-future',
             text: "#{text} #{standard_date(tomorrow)}")
  end

  def has_scheduled_progress_bar_item_with_time?(text)
    has_css?('.progress-bar-future',
             text: "#{text} #{(DateTime.now + 1).strftime('%B %d, %Y %H')}")
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
    actual_headings = (0..num).map { |i| all('.control-label')[i].text }
    expect(actual_headings).to eq(expected_headings)
  end

  def has_task_options?(sel, num, opt = options)
    selector[sel].click
    actual_options = (0..num).map { |i| all('.select2-result-label')[i].text }
    expect(actual_options).to eq(opt)
  end

  def has_date_selectors?(date, m, d, y)
    month = locale_month(date.strftime('%B'))
    selector[m].has_text?(month) &&
      selector[d].has_text?(date.strftime('%-d')) &&
      selector[y].has_text?(date.strftime('%Y'))
  end

  def has_time_selectors?(hh, mm)
    has_hour_selector?(hh) && selector[mm].has_text?(Time.now.strftime('%M'))
  end

  def has_hour_selector?(hh, time = Time.now)
    selector[hh].has_text? time.strftime('%H')
  end

  def resolve_as_canceled_responses
    english_cancel_options.delete('Not done / CANCEL task')
    english_cancel_options.delete('Other')
    @resolve_as_canceled_responses ||= english_cancel_options
  end

  private

  def panel(type)
    find('.panel', text: type)
  end
end
