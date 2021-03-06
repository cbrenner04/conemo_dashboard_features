# frozen_string_literal: true
Dir['./lib/pages/tasks/*.rb'].each { |file| require file }
require './lib/pages/translations'
require './lib/pages/translations/nurse_tasks_titles'
require './lib/pages/translations/your_patients'

# page object for active participants
class YourPatients
  include RSpec::Matchers
  include Capybara::DSL
  include Translations
  include Translations::NurseTaskTitles
  include Translations::YourPatientsTranslations

  def initialize(your_patients)
    @pt_id ||= your_patients[:pt_id]
    @locale ||= your_patients.fetch(:locale, 'english')
  end

  def visible?
    has_css?('h2', text: localize(spanish: 'Tus pacientes',
                                  portuguese: 'Seus Pacientes',
                                  english: 'Your patients'))
  end

  def in_table?
    has_css?('tr', text: @pt_id)
  end

  def has_assigned_patients?
    assigned_participants.all? { |participant| has_text? participant }
  end

  def has_configuration_tokens?
    ids = [338, 300, 326, 318, 305, 337, 308, 322, 325, 339]
    ids.each { |id| find('tr', text: id).has_text? "aBc#{id}XyZ" }
  end

  def has_supervisor_contact_notification?
    patient_row.has_css?('.fa-exclamation-circle')
  end

  def ordered_correctly?
    array_of_elements_equal?(
      elements: all('tr'),
      ids: (1..12),
      expectation: expected_order_of_patients
    )
  end

  def has_tasks_ordered_correctly?
    expected_text = row_text.gsub("Last-#{@pt_id}, First #{@pt_id} ", '')
    expect(expected_text)
      .to eq "#{confirmation_call_title}, #{help_request_title}, " \
             "#{lack_of_connectivity_call_title}"
  end

  def has_tasks_completed?
    has_css?('.success', text: @pt_id)
  end

  def has_tasks_active?
    has_css?('.info', text: @pt_id)
  end

  def has_tasks_overdue?
    has_css?('.danger', text: @pt_id)
  end

  def has_confirmation_call?
    patient_row.has_text? confirmation_call_title
  end

  def has_initial_appointment?
    patient_row.has_text? initial_appointment_title
  end

  def has_follow_up_week_1?
    patient_row.has_text? follow_up_week_one_title
  end

  def has_follow_up_week_3?
    patient_row.has_text? follow_up_week_three_title
  end

  def has_call_to_schedule_final_appt?
    patient_row.has_text? call_to_schedule_final_title
  end

  def has_final_appointment?
    patient_row.has_text? final_appointment_title
  end

  def has_help_request?
    patient_row.has_text? help_request_title
  end

  def has_lack_of_connectivity_task?
    patient_row.has_text? lack_of_connectivity_call_title
  end

  def has_non_adherence_task?
    patient_row.has_text? non_adherence_call_title
  end

  def has_table_headers?
    array_of_elements_equal?(
      elements: all('th'),
      ids: (0..3),
      expectation: expected_headers
    )
  end

  def has_key?
    has_no_tasks_key? && has_tasks_key? && has_overdue_task_key?
  end

  def english_nurse_patients
    patients = [1000, 405, 480, 490]
    ranges = [(300..340), (342..344), (410..412), (414..415), (420..428),
              (430..432), (440..442), (450..452), (460..462), (470..472),
              (700..709), (800..804)]
    ranges.each { |range| patients.concat range.to_a }
    @english_nurse_patients ||= patients.sample(10)
  end

  private

  def patient_row
    find('tr', text: @pt_id)
  end

  def row_text
    find('tr', text: @pt_id).text
  end

  def assigned_participants
    localize(
      spanish: (500..505).to_a.sample(3),
      portuguese: (600..605).to_a.sample(3),
      english: english_nurse_patients
    )
  end

  def expected_order_of_patients
    ["Last-706, First 706 #{confirmation_call_title}, #{help_request_title}",
     "Last-707, First 707 #{initial_appointment_title}",
     "Last-708, First 708 #{follow_up_week_one_title}",
     "Last-709, First 709 #{follow_up_week_three_title}",
     "Last-800, First 800 #{call_to_schedule_final_title}",
     "Last-801, First 801 #{final_appointment_title}, #{help_request_title}",
     "Last-802, First 802 #{help_request_title}",
     "Last-803, First 803 #{lack_of_connectivity_call_title}",
     "Last-804, First 804 #{non_adherence_call_title}",
     "Last-1000, First 1000 #{confirmation_call_title}, " \
     "#{help_request_title}, #{lack_of_connectivity_call_title}",
     "Last-322, First 322 #{follow_up_week_one_title} aBc322XyZ",
     "Last-303, First 303 #{confirmation_call_title}"]
  end

  def key
    find('.table-condensed')
  end

  def has_no_tasks_key?
    success_text = key.find('.success').text
    expect(success_text).to eq(no_tasks)
  end

  def has_tasks_key?
    info_text = key.find('.info').text
    expect(info_text).to eq(active_task)
  end

  def has_overdue_task_key?
    danger_text = key.find('.danger').text
    expect(danger_text).to eq(overdue_task)
  end
end
