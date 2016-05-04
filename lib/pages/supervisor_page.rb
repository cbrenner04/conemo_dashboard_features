require './lib/pages/your_patients'

# page object for Nurse Supervisor landing page
class SupervisorPage
  include RSpec::Matchers
  include Capybara::DSL

  def initialize(supervisor_page)
    @pt_id ||= supervisor_page[:pt_id]
    @user_id ||= supervisor_page[:user_id]
  end

  def has_pending_participants?
    within(pending_panel) do
      actual_rows = (0..3).map { |i| find('tbody').all('tr')[i].text }
      expect(actual_rows).to eq(expected_rows)
    end
  end

  def has_nurses?
    actual_nurses = (0..4).map do |i|
      all('.panel-heading', text: 'Nurse-')[i].text[0..17]
    end
    expected_nurses = [400, 401, 403, 402, 404].map do |i|
      "Nurse-#{i}, English"
    end
    expect(actual_nurses).to eq(expected_nurses)
  end

  def on_home_page?
    has_css?('h3', text: 'Participants')
  end

  def has_patient?
    pending_panel
      .has_text? "Last-#{@pt_id}, First #{@pt_id} " \
                 "#{Date.today.strftime('%B %d, %Y')} " \
                 "#{Date.today.strftime('%B %d, %Y')}"
  end

  def has_active_patient?
    active_panel.find('input[type = search]').set('300')
    active_panel
      .has_text? 'Last-300, First 300 ' \
                 "#{Date.today.strftime('%B %d, %Y')} " \
                 "#{Date.today.strftime('%B %d, %Y')}"
  end

  def has_total_active?
    has_panel_heading?('156 Active')
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
    date = (Date.today - 39).strftime('%B %d, %Y')
    completed_panel.find('input[type = search]').set('341')
    has_css?('tr',
             text: "Nurse-400, English Last-341, First 341 #{date} #{date}")
  end

  def has_completed_participant_information?
    2.times { navigation.scroll_down }
    completed_panel.first('.input-sm').click
    all('option', text: '25')[2].click
    completed_table = completed_panel.find('.table')
    within completed_table do
      actual_rows = (1..12).map { |i| all('tr')[i].text }
      expected_rows_1 = (1..6).map do |i|
        "Nurse-401, English Last-#{4040 + i}, First #{4040 + i} " \
        "#{(Date.today - (13 + i)).strftime('%B %d, %Y')}"
      end
      expected_rows_2 = (7..12).map do |i|
        "Nurse-403, English Last-#{4040 + i}, First #{4040 + i} " \
        "#{(Date.today - (13 + i)).strftime('%B %d, %Y')}"
      end
      expected_rows = expected_rows_1.concat expected_rows_2
      actual_rows.should =~ expected_rows
    end
  end

  def has_dropped_participant_information?
    3.times { navigation.scroll_down }
    find('.panel', text: 'Dropped').first('.input-sm').click
    all('option', text: '25')[3].click
    dropped_table = find('.panel', text: 'Dropped out').find('.table')
    within dropped_table do
      actual_rows = (1..14).map { |i| all('tr')[i].text }
      expected_rows_1 = (1..12).map do |i|
        "Nurse-402, English Last-#{201 + i}, First #{201 + i} " \
        "#{(Date.today - (4 + i)).strftime('%B %d, %Y')}"
      end
      today = Date.today.strftime('%B %d, %Y')
      expected_rows_2 = [
        "Nurse-400, English Last-200, First 200 #{today}",
        "Nurse-400, English Last-201, First 201 #{today}"
      ]
      expected_rows = expected_rows_1.concat expected_rows_2
      actual_rows.should =~ expected_rows
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

  private

  def your_patients
    @your_patients ||= YourPatients.new(locale: 'english')
  end

  def active_panel
    @active_panel ||= find('.panel', text: 'Active')
  end

  def completed_panel
    @completed_panel ||= find('.panel', text: 'Completed')
  end

  def pending_panel
    @pending_panel ||= find('.panel', text: 'Pending')
  end

  def has_panel_heading?(heading)
    has_css?('.panel-heading', text: heading)
  end

  def expected_rows
    today = Date.today.strftime('%B %d, %Y')
    @expected_rows ||= [
      "Edit Information Last-495, First 495 #{today} Activate",
      "Edit Information Last-496, First 496 #{today} Activate",
      "Edit Information Last-497, First 497 #{today} Activate",
      "Edit Information Last-498, First 498 #{today} Activate"
    ]
  end

  def canceled?(title)
    toggle_canceled_rescheduled_tasks
    nurse_panel
      .has_css?('.text-warning',
                text: "Participant #{@pt_id} #{title} cancelled")
  end

  def rescheduled?(title)
    toggle_canceled_rescheduled_tasks
    nurse_panel
      .has_css?('.text-info',
                text: "Participant #{@pt_id} #{title} rescheduled")
  end

  def nurse_panel
    @nurse_panel ||= if has_css?('.panel',
                                 text: "Nurse-#{@user_id}, English", count: 1)
                       find('.panel', text: "Nurse-#{@user_id}, English")
                     else
                       all('.panel', text: "Nurse-#{@user_id}, English").last
                     end
  end

  def toggle_canceled_rescheduled_tasks
    4.times { navigation.scroll_down }
    nurse_panel
      .find('button', text: 'Toggle cancelled / rescheduled tasks').click
  end
end
