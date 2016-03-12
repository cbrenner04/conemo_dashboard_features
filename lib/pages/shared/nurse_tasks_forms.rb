require './lib/pages/navigation'

# module for shared methods in nurse task forms
module NurseTasksForms
  include Capybara::DSL

  def mark_task_resolved(type)
    find('.list-group-item', text: type)
      .find('a', text: 'Mark as resolved').click
  end

  def contact_supervisor_for_task(type)
    find('.list-group-item', text: type)
      .find('input[value = "Contact Supervisor"]').click
    accept_alert 'are you sure you want to notify the supervisor that you ' \
                 'need help?'
  end

  def confirm_task(type)
    find('.list-group-item', text: type).find('a', text: 'Confirm').click
  end

  def cancel_task(type)
    find('.list-group-item', text: type).find('input[value = "Cancel"]').click
  end

  def open_reschedule(type)
    find('.list-group-item', text: type).find('a', text: 'Reschedule').click
  end

  def selector
    @selector ||= all('.select2-container')
  end

  def reschedule_task
    sleep(1)
    selector[2].click
    select_list_item((Date.today + 1).strftime('%-d'))
    navigation.submit
  end

  def has_list_item?(text)
    has_css?('.list-group-item', text: text)
  end

  def has_no_list_item?(text)
    has_no_css?('.list-group-item', text: text)
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
    location = ['Patient\'s home', 'Health unit', 'Other location'].sample
    select_list_item(location)
  end

  def select_list_item(item)
    find('.select2-result-label', text: item).click
  end

  def select_next_date(num)
    selector[num].click
    select_list_item((Date.today + 1).strftime('%-d'))
  end

  private

  def navigation
    @navigation ||= Navigation.new
  end
end
