require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/navigation'
require './lib/pages/translations/clinical_summary'

# page object for nurse tasks page
class NurseTasks
  include Capybara::DSL
  include NurseTasksForms
  include Translations::NurseTasksTranslations
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
    navigation.scroll_up
    tries += 1
    retry unless tries > 10
  end

  def return
    find('a', text: 'Tasks').click
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

  def has_empty_progress_bar?
    sched_tasks = [confirmation_call_title, initial_appointment_title,
                   follow_up_week_one_title, follow_up_week_three_title,
                   call_to_schedule_final_title, final_appointment_title]
    sched_tasks.all? { |task| has_css?('.progress-bar-future', text: task) }
  end

  def has_participant_in_header?
    has_css?('.navbar-brand',
             text: "Participant #{@pt_id}: Last-#{@pt_id}, First")
  end

  def has_key?
    has_scheduled? && has_confirmed? && has_active? && has_canceled? &&
      has_overdue?
  end

  private

  def navigation
    @navigation ||= Navigation.new(locale: 'english')
  end

  def dst_time(time)
    if Time.now.dst? && time.dst?
      time
    elsif !Time.now.dst? && time.dst?
      time + (1 * 60 * 60)
    else
      (time - (1 * 60 * 60))
    end
  end

  def has_supervisor_contact?(time)
    has_text? 'last supervisor contact sent ' \
              "#{Date.today.strftime('%B %d, %Y')} " \
              "#{dst_time(time).strftime('%H')}"
  end

  def key
    find('.table-condensed')
  end

  def has_scheduled?
    key.has_css?('tr', text: locale('scheduled but not due',
                                    'scheduled but not due',
                                    'scheduled but not due'))
  end

  def has_confirmed?
    key.has_css?('.success',
                 text: locale('confirmed', 'confirmed', 'confirmed'))
  end

  def has_active?
    key.has_css?('.info',
                 text: locale('active due', 'active due', 'active due'))
  end

  def has_canceled?
    key.has_css?('.warning',
                 text: locale('cancelled', 'cancelled', 'cancelled'))
  end

  def has_overdue?
    key.has_css?('.danger', text: locale('overdue', 'overdue', 'overdue'))
  end
end
