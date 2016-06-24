# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/clinical_summary'
require './lib/pages/translations/contact_information'
require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

# page object for nurse tasks page
class NurseTasks
  include Capybara::DSL
  include NurseTasksForms
  include Translations::NurseTaskTitles
  include Translations::NurseTasksTranslations
  include Translations::ClinicalSummaryTranslations
  include Translations::ContactInformation

  def initialize(nurse_task)
    @pt_id ||= nurse_task[:pt_id]
    @session ||= nurse_task[:session]
    @session_length ||= nurse_task[:session_length]
    @days_since_due ||= nurse_task[:days_since_due]
    @contact_type ||= nurse_task[:contact_type]
    @tasks_count ||= nurse_task[:tasks_count]
    @locale ||= nurse_task.fetch(:locale, 'english')
  end

  def open
    tries ||= 2
    find('tr', text: @pt_id).click
    find('h3', text: tasks_heading)
  rescue Capybara::ElementNotFound, Selenium::WebDriver::Error::UnknownError
    navigation.scroll_up
    retry unless (tries -= 1).zero?
  end

  def return
    find('a', text: 'Tasks').click
  end

  def enter_session_length
    fill_in "#{@session}[session_length]", with: @session_length
  end

  def has_number_of_days_since_due?
    find('.panel', text: @contact_type).
      has_text? "#{@days_since_due} ago"
  end

  def has_overdue_tasks?
    has_text? "#{@tasks_count} #{singular_overdue_task}"
  end

  def has_one_task_in_count?
    has_text? "1 #{singular_active_task}"
  end

  def has_no_tasks_in_count?
    has_text? "0 #{plural_active_task}"
  end

  def has_multiple_tasks_in_count?
    has_text? "#{@tasks_count} #{plural_active_task}"
  end

  def has_participant_in_header?
    has_css?('.navbar-brand', text: "#{@pt_id}: First Last-#{@pt_id}")
  end

  def has_key?
    css_selectors = ['tr', '.success', '.info', '.warning', '.danger']
    labels = [scheduled_key_label, confirmed_key_label, active_key_label,
              canceled_key_label, overdue_key_label]
    css_selectors.zip(labels).all? do |selector, label|
      find('.table-condensed').has_css?(selector, text: label)
    end
  end

  def has_tasks_heading?
    has_css?('h3', text: tasks_heading)
  end

  def has_additional_contact_alert?
    has_css?('.alert', text: "#{additional_contact_title} " \
                             "#{masculine_success_alert}")
  end

  def has_successful_confirmation_call_alert?
    has_css?('.alert', text: "#{confirmation_call_title} " \
                             "#{feminine_success_alert}")
  end

  private

  def navigation
    Navigation.new(locale: @locale)
  end
end
