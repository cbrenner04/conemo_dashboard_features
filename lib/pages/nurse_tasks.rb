require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/translations/clinical_summary'

# page object for nurse tasks page
class NurseTasks
  include Capybara::DSL
  include NurseTasksForms
  include Translations::ClinicalSummaryTranslations

  def initialize(nurse_task)
    @pt_id ||= nurse_task[:pt_id]
    @session ||= nurse_task[:session]
    @session_length ||= nurse_task[:session_length]
    @time_of_contact ||= nurse_task[:time_of_contact]
    @days_since_due ||= nurse_task[:days_since_due]
    @contact_type ||= nurse_task[:contact_type]
    @tasks_count ||= nurse_task[:tasks_count]
    @locale ||= nurse_task[:locale]
  end

  def open
    tries ||= 1
    find('tr', text: @pt_id).click
    find('a', text: clinical_summary_link)
  rescue Capybara::ElementNotFound
    execute_script('window.scrollBy(0, -10000)')
    tries.times { navigation.scroll_down }
    tries += 1
    retry unless tries > 5
  end

  def clear_supervisor_contact
    find('input[value = "clear"]').click
    accept_alert 'are you sure you want to clear this?'
  end

  def enter_session_length
    fill_in "#{@session}[session_length]", with: @session_length
  end

  def has_new_supervisor_contact?
    has_supervisor_contact?(Time.now)
  end

  def has_previous_supervisor_contact?
    has_supervisor_contact?(@time_of_contact)
  end

  def has_no_previous_supervisor_contact?
    has_no_css?('p', text: 'last')
  end

  def has_number_of_days_since_due?
    find('.panel', text: @contact_type).
      has_text? "#{@days_since_due} ago"
  end

  def has_overdue_tasks?
    has_text? "#{@tasks_count} overdue"
  end

  def has_one_task_in_count?
    has_text? '1 Task'
  end

  def has_no_tasks_in_count?
    has_text? '0 Tasks'
  end

  def has_multiple_tasks_in_count?
    has_text? "#{@tasks_count} Tasks"
  end

  def has_nothing_in_progress_bar?
    has_css?('.progress') &&
      has_no_css?('.progress-bar-future') &&
      has_no_css?('.progress-bar-success') &&
      has_no_css?('.progress-bar-warning') &&
      has_no_css?('.progress-bar-danger')
  end

  private

  def navigation
    @navigation ||= Navigation.new(locale: 'english')
  end

  def has_supervisor_contact?(time)
    p_text = "last supervisor contact sent #{Date.today.strftime('%B %d, %Y')}"
    text = find('p', text: 'last').text
    actual_time = text.gsub("#{p_text} ", '')
    actual_hour = actual_time.gsub(/:\w+/, '')
    expected_hour = time.strftime('%H')
    comparison = expected_hour.to_i - actual_hour.to_i
    new_time = comparison == 0 ? expected_hour : (expected_hour.to_i - 1)
    has_text? "#{p_text} #{new_time}"
  end
end
