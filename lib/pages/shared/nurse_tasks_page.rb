# frozen_string_literal: true
require './lib/pages/tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'

# shared functionality for nurse tasks page
module NurseTasksPage
  include Capybara::DSL
  include NurseTasksForms

  def mark_task_resolved(type)
    find('.panel', text: type).find('a', text: mark_resolved_button).click
  end

  def contact_supervisor_for_task(type)
    find('.panel', text: type)
      .find("input[value = \"#{contact_supervisor_button}\"]").click
    accept_alert contact_supervisor_alert
    find('.alert', text: contact_supervisor_confirmation)
  end

  def confirm
    click_panel_button(confirm_button)
    visible?
  end

  def cancel
    click_panel_button(cancel_button)
  end

  def open_reschedule_form
    click_panel_button(reschedule_button)
  end

  def has_no_list_item?
    has_no_css?('.panel', text: @task_title)
  end

  def active?
    check_panel_title = has_css?('.panel', text: @task_title)
    if unscheduled?
      check_panel_title
    else
      check_panel_title && has_css?('.progress-bar-info', text: @task_title)
    end
  end

  def complete?
    has_no_list_item? &&
      has_css?('.progress-bar-success', text: @task_title)
  end

  def canceled?
    has_no_list_item? &&
      has_css?('.progress-bar-error', text: @task_title)
  end

  def overdue?
    has_css?('.panel-danger', text: @task_title) &&
      has_css?('.progress-bar-danger', text: @task_title)
  end

  def rescheduled?
    has_no_list_item? &&
      has_css?('.progress-bar-future',
               text: "#{@task_title} #{standard_date(tomorrow)}")
  end

  def rescheduled_with_time_stamp?
    has_no_list_item? &&
      has_css?('.progress-bar-future',
               text: "#{@task_title} " \
                     "#{(DateTime.now + 1).strftime('%B %d, %Y %H')}")
  end

  def has_canceled_alert?
    cancel_form.has_cancel_alert?(@task_title)
  end

  private

  def cancel_form
    @cancel_form ||= Tasks::CancelForm.new(locale: @locale)
  end

  def click_panel_button(button)
    has_text? @task_title
    execute_script 'window.scrollBy(0,100)'
    find('.panel', text: @task_title).find('a', text: button).click
  end

  def unscheduled?
    return true if @task_title == help_request_title ||
                   lack_of_connectivity_call_title ||
                   non_adherence_call_title
  end
end
