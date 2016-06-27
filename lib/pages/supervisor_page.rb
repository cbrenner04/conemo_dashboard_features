# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/supervisor_page'

# page object for Nurse Supervisor landing page
class SupervisorPage
  include RSpec::Matchers
  include Capybara::DSL
  include Translations::NurseTaskTitles
  include Translations::SupervisorPageTranslations

  def initialize(supervisor_page)
    @pt_id ||= supervisor_page[:pt_id]
    @user_id ||= supervisor_page[:user_id]
    @locale ||= supervisor_page.fetch(:locale, 'english')
  end

  def has_nurses?
    # not updated to `array_of_elements_equal?` b/c different implementation
    headings = all('.panel-heading', text: 'Nurse-')
    actual_nurses = (0..4).map do |heading_num|
      headings[heading_num].text[0..17]
    end
    expect(actual_nurses).to eq(EXPECTED_NURSES)
  end

  EXPECTED_NURSES = ['Nurse-400, English', 'Nurse-401, English',
                     'Nurse-403, English', 'Nurse-402, English',
                     'Nurse-404, English'].freeze

  def return_to_home
    first('.navbar-brand').click
  end

  def on_home_page?
    has_css?('h3', text: 'Participants')
  end

  def has_rescheduled_and_canceled_tasks?
    find('button', text: toggle_button).click
    sleep(0.5)
    (0..5).all? do |list_item_id|
      list_item = find('.list-unstyled').all('li')[list_item_id]
      list_item.has_text?(rescheduled_and_canceled_tasks_dates[list_item_id]) &&
        list_item.has_text?(rescheduled_and_canceled_tasks_list[list_item_id])
    end
  end

  def has_task_canceled?(task)
    toggle_canceled_rescheduled_tasks
    nurse_panel.has_css?('.text-warning',
                         text: "Participant #{@pt_id} #{task} cancelled")
  end

  def has_task_rescheduled?(task)
    toggle_canceled_rescheduled_tasks
    nurse_panel.has_css?('.text-info',
                         text: "Participant #{@pt_id} #{task} rescheduled")
  end

  private

  def nurse_panel
    if has_css?('.panel', text: "Nurse-#{@user_id}, English", count: 1)
      find('.panel', text: "Nurse-#{@user_id}, English")
    else
      all('.panel', text: "Nurse-#{@user_id}, English").last
    end
  end

  def toggle_canceled_rescheduled_tasks
    4.times { navigation.scroll_down }
    nurse_panel.find('button', text: toggle_button).click
  end

  def rescheduled_and_canceled_tasks_dates
    now_hour = locale_hour(now)
    ["#{standard_date(today - 4)}#{now_hour}",
     "#{standard_date(today - 8)}#{now_hour}",
     "#{standard_date(today - 10)}#{now_hour}",
     "#{standard_date(today - 11)}#{now_hour}",
     "#{standard_date(today - 16)}#{now_hour}",
     "#{standard_date(today - 20)}#{now_hour}"]
  end

  def rescheduled_and_canceled_tasks_list
    pt_id_initial_digit = localize(spanish: 5, portuguese: 6, english: 1)
    ["#{participants_title} #{pt_id_initial_digit}15 " \
       "#{confirmation_call_title} #{rescheduled}:",
     "#{participants_title} #{pt_id_initial_digit}12 " \
       "#{confirmation_call_title} #{canceled}:",
     "#{participants_title} #{pt_id_initial_digit}11 " \
       "#{confirmation_call_title} #{canceled}:",
     "#{participants_title} #{pt_id_initial_digit}14 " \
       "#{confirmation_call_title} #{rescheduled}:",
     "#{participants_title} #{pt_id_initial_digit}16 " \
       "#{confirmation_call_title} #{rescheduled}:",
     "#{participants_title} #{pt_id_initial_digit}13 " \
       "#{confirmation_call_title} #{canceled}:"]
  end
end
