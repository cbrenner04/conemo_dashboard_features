require './lib/pages/navigation'
require './lib/pages/translations/navigation'

# module for shared methods in nurse task forms
module NurseTasksForms
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::NavigationTranslations

  def mark_task_resolved(type)
    panel(type).find('a', text: 'Mark as resolved').click
  end

  def contact_supervisor_for_task(type)
    panel(type).find('input[value = "Contact Supervisor"]').click
    accept_alert 'are you sure you want to notify the supervisor that you ' \
                 'need help?'
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

  def has_scheduled_progress_bar_item?(text)
    has_css?('.progress-bar-future', text: text)
  end

  def has_active_progress_bar_item?(text)
    has_css?('.progress-bar-warning', text: text)
  end

  def has_complete_progress_bar_item?(text)
    has_css?('.progress-bar-success', text: text)
  end

  def has_canceled_progress_bar_item?(text)
    has_css?('.progress-bar-danger', text: text)
  end

  def enter_task_location(selector_num)
    sleep(1)
    selector[selector_num].click
    select_list_item(options.sample)
  end

  def select_list_item(item)
    find('.select2-result-label', text: item).click
  end

  def select_next_date(num)
    selector[num].click
    select_list_item((Date.today + 1).strftime('%-d'))
  end

  def has_task_form_headings?(num)
    actual_headings = (0..num).map { |i| all('.control-label')[i].text }
    expect(actual_headings).to eq(expected_headings)
  end

  def has_task_options?(sel, num)
    selector[sel].click
    actual_options = (0..num).map { |i| all('.select2-result-label')[i].text }
    expect(actual_options).to eq(options)
  end

  def has_date_selectors?(date, m, d, y)
    selector[m].has_text?(locale(spanish_months(date), portuguese_months(date),
                                 date.strftime('%B'))) &&
      selector[d].has_text?(date.strftime('%-d')) &&
      selector[y].has_text?(date.strftime('%Y'))
  end

  def has_time_selectors?(hh, mm)
    has_hour_selector?(hh) &&
      selector[mm].has_text?(Time.now.strftime('%M'))
  end

  def has_hour_selector?(hh)
    selector[hh].has_text? Time.now.strftime('%H')
  end

  private

  def navigation
    @navigation ||= Navigation.new(locale: 'english')
  end

  def panel(type)
    find('.panel', text: type)
  end
end
