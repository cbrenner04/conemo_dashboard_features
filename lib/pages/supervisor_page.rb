# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/supervisor_page'
require './lib/pages/your_patients'

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

  def has_pending_participants?
    within(pending_panel) do
      rows = find('tbody').all('tr')
      actual_rows = (0..3).map { |row_number| rows[row_number].text }
      expect(actual_rows).to eq(PENDING_PT_EXPECTED_ROWS)
    end
  end

  def has_nurses?
    headings = all('.panel-heading', text: 'Nurse-')
    actual_nurses = (0..4).map do |heading_num|
      headings[heading_num].text[0..17]
    end
    expect(actual_nurses).to eq(EXPECTED_NURSES)
  end

  def return_to_home
    first('.navbar-brand').click
  end

  def on_home_page?
    has_css?('h3', text: 'Participants')
  end

  def has_patient?
    pending_panel
      .has_text? "Last-#{@pt_id}, First #{@pt_id} #{standard_date(today)}"
  end

  def has_active_patient?
    active_panel.find('input[type = search]').set('300')
    active_panel
      .has_text? "Last-300, First 300 #{standard_date(today)}"
  end

  def has_total_active?
    has_panel_heading?('157 Active')
  end

  def has_total_completed?
    has_panel_heading?('12 Completed')
  end

  def has_total_dropped_out?
    has_panel_heading?('14 Dropped out')
  end

  def has_updated_completed?
    has_panel_heading?('13 Completed')
  end

  def has_active_participant_information?
    your_patients.english_nurse_patients.all? do |patient|
      active_panel.find('input[type = search]').set(patient)
      has_css?('tr',
               text: 'Edit Information Nurse-400, English Edit Information ' \
                     "Last-#{patient}, First #{patient}")
    end
  end

  def has_new_completed_participant_information?
    date = standard_date(today - 39)
    completed_panel.find('input[type = search]').set('341')
    has_css?('tr', text: "Nurse-400, English Last-341, First 341 #{date}")
  end

  def has_completed_participant_information?
    2.times { navigation.scroll_down }
    # updated to use `select...` for Poltergeist
    within(completed_panel) { select '25', from: 'DataTables_Table_2_length' }
    within(completed_panel.find('.table')) do
      rows = all('tr')
      actual_rows = (1..12).map { |row_number| rows[row_number].text }
      actual_rows.should =~ COMPLETED_PT_EXPECTED_ROWS
    end
  end

  def has_dropped_participant_information?
    3.times { navigation.scroll_down }
    dropped_panel = find('.panel', text: 'Dropped')
    # updated to use `select...` for Poltergeist
    within(dropped_panel) { select '25', from: 'DataTables_Table_3_length' }
    within(dropped_panel.find('.table')) do
      rows = all('tr')
      actual_rows = (1..14).map { |row_number| rows[row_number].text }
      actual_rows.should =~ DROPPED_PT_EXPECTED_ROWS
    end
  end

  def has_call_to_schedule_final_canceled?
    canceled? 'Call to schedule final in person appointment'
  end

  def has_confirmation_call_canceled?
    canceled? 'Confirmation call'
  end

  def has_final_appointment_canceled?
    canceled? 'Final in person appointment'
  end

  def has_follow_up_week_1_canceled?
    canceled? 'Follow up call week 1'
  end

  def has_follow_up_week_3_canceled?
    canceled? 'Follow up call week 3'
  end

  def has_help_request_canceled?
    canceled? 'Help request'
  end

  def has_non_connectivity_call_canceled?
    canceled? 'Call due to no connectivity'
  end

  def has_non_adherence_call_canceled?
    canceled? 'Non-adherence call'
  end

  def has_initial_appointment_canceled?
    canceled? 'Initial in person appointment'
  end

  def has_call_to_schedule_final_rescheduled?
    rescheduled? 'Call to schedule final in person appointment'
  end

  def has_confirmation_call_rescheduled?
    rescheduled? 'Confirmation call'
  end

  def has_final_appointment_rescheduled?
    rescheduled? 'Final in person appointment'
  end

  def has_follow_up_week_1_rescheduled?
    rescheduled? 'Follow up call week 1'
  end

  def has_follow_up_week_3_rescheduled?
    rescheduled? 'Follow up call week 3'
  end

  def has_initial_appointment_rescheduled?
    rescheduled? 'Initial in person appointment'
  end

  def has_rescheduled_and_canceled_tasks?
    find('button', text: toggle_button).click
    sleep(0.5)
    all_list_items = find('.list-unstyled').all('li')
    (0..5).all? do |list_item_id|
      all_list_items[list_item_id]
        .has_text?(rescheduled_and_canceled_tasks_dates[list_item_id]) &&
        all_list_items[list_item_id]
          .has_text?(rescheduled_and_canceled_tasks_list[list_item_id])
    end
  end

  def select_completed_pt
    completed_panel.find('input[type = search]').set('341')
    completed_panel.find('tr', text: 'Last-341').click
  end

  private

  def your_patients
    YourPatients.new(locale: @locale)
  end

  def active_panel
    find('.panel', text: 'Active')
  end

  def completed_panel
    find('.panel', text: 'Completed')
  end

  def pending_panel
    find('.panel', text: 'Pending')
  end

  def has_panel_heading?(heading)
    has_css?('.panel-heading', text: heading)
  end

  EXPECTED_NURSES = ['Nurse-400, English', 'Nurse-401, English',
                     'Nurse-403, English', 'Nurse-402, English',
                     'Nurse-404, English'].freeze

  COMPLETED_PT_EXPECTED_ROWS = [
    "Nurse-401, English Last-4041, First 4041 #{standard_date(today - 14)}",
    "Nurse-401, English Last-4042, First 4042 #{standard_date(today - 15)}",
    "Nurse-401, English Last-4043, First 4043 #{standard_date(today - 16)}",
    "Nurse-401, English Last-4044, First 4044 #{standard_date(today - 17)}",
    "Nurse-401, English Last-4045, First 4045 #{standard_date(today - 18)}",
    "Nurse-401, English Last-4046, First 4046 #{standard_date(today - 19)}",
    "Nurse-403, English Last-4047, First 4047 #{standard_date(today - 20)}",
    "Nurse-403, English Last-4048, First 4048 #{standard_date(today - 21)}",
    "Nurse-403, English Last-4049, First 4049 #{standard_date(today - 22)}",
    "Nurse-403, English Last-4050, First 4050 #{standard_date(today - 23)}",
    "Nurse-403, English Last-4051, First 4051 #{standard_date(today - 24)}",
    "Nurse-403, English Last-4052, First 4052 #{standard_date(today - 25)}"
  ].freeze

  DROPPED_PT_EXPECTED_ROWS = [
    "Nurse-402, English Last-202, First 202 #{standard_date(today - 5)}",
    "Nurse-402, English Last-203, First 203 #{standard_date(today - 6)}",
    "Nurse-402, English Last-204, First 204 #{standard_date(today - 7)}",
    "Nurse-402, English Last-205, First 205 #{standard_date(today - 8)}",
    "Nurse-402, English Last-206, First 206 #{standard_date(today - 10)}",
    "Nurse-402, English Last-207, First 207 #{standard_date(today - 11)}",
    "Nurse-402, English Last-208, First 208 #{standard_date(today - 12)}",
    "Nurse-402, English Last-209, First 209 #{standard_date(today - 13)}",
    "Nurse-402, English Last-210, First 210 #{standard_date(today - 14)}",
    "Nurse-402, English Last-211, First 211 #{standard_date(today - 15)}",
    "Nurse-402, English Last-212, First 212 #{standard_date(today - 16)}",
    "Nurse-402, English Last-213, First 213 #{standard_date(today - 17)}",
    "Nurse-400, English Last-200, First 200 #{standard_date(today)}",
    "Nurse-400, English Last-201, First 201 #{standard_date(today)}"
  ].freeze

  PENDING_PT_EXPECTED_ROWS = [
    "Edit Information Last-495, First 495 #{standard_date(today)} Activate",
    "Edit Information Last-496, First 496 #{standard_date(today)} Activate",
    "Edit Information Last-497, First 497 #{standard_date(today)} Activate",
    "Edit Information Last-498, First 498 #{standard_date(today)} Activate"
  ].freeze

  def canceled?(title)
    toggle_canceled_rescheduled_tasks
    nurse_panel.has_css?('.text-warning',
                         text: "Participant #{@pt_id} #{title} cancelled")
  end

  def rescheduled?(title)
    toggle_canceled_rescheduled_tasks
    nurse_panel.has_css?('.text-info',
                         text: "Participant #{@pt_id} #{title} rescheduled")
  end

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
