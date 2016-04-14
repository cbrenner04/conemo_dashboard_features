Dir['./lib/pages/nurse_tasks/*.rb'].each { |file| require file }
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
    @locale ||= your_patients[:locale]
  end

  def return
    find('.navbar-brand', text: 'CONEMO').click
  end

  def visible?
    has_css?('h2', text: locale('Tus participantes',
                                'Seus participantes', 'Your Patients'))
  end

  def in_table?
    has_css?('tr', text: @pt_id)
  end

  def has_assigned_patients?
    assigned_participants.all? { |i| has_text? i }
  end

  def has_token?
    expected_text = row_text.gsub("#{@pt_id} #{confirmation_call_title}", '')
    expect(expected_text).to match(/.+/)
  end

  def has_configuration_tokens?
    ids = [338, 300, 326, 318, 305, 337, 308, 322, 325, 339]
    ids.each { |i| find('tr', text: i).has_text? "aBc#{i}XyZ" }
  end

  def has_supervisor_contact_notification?
    patient_row.has_css?('.fa-exclamation-circle')
  end

  def ordered_correctly?
    actual_results = (1..12).map { |i| all('tr')[i].text }
    expect(actual_results).to eq(expected_results)
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
    actual_headers = (0..3).map { |i| all('th')[i].text }
    expect(actual_headers).to eq(expected_headers)
  end

  def has_key?
    key = find('.table-condensed')
    success_text = key.find('.success').text
    expect(success_text).to eq(no_tasks)
    info_text = key.find('.info').text
    expect(info_text).to eq(active_task)
    danger_text = key.find('.danger').text
    expect(danger_text).to eq(overdue_task)
  end

  def english_nurse_patients
    patients = [1000, 480, 490]
    ranges = [(300..340), (342..344), (400..405), (410..412), (414..415),
              (420..428), (430..432), (440..442), (450..452), (460..462),
              (470..472), (700..709), (800..804)]
    ranges.each { |i| patients.concat i.to_a }
    @english_nurse_patients ||= patients.sample(10)
  end

  private

  def patient_row
    find('tr', text: @pt_id)
  end

  def row_text
    @row_text ||= find('tr', text: @pt_id).text
  end

  def assigned_participants
    locale(spanish_nurse_patients, portuguese_nurse_patients,
           english_nurse_patients)
  end

  def spanish_nurse_patients
    @spanish_nurse_patients ||= (500..505).to_a.sample(3)
  end

  def portuguese_nurse_patients
    @portuguese_nurse_patients ||= (600..605).to_a.sample(3)
  end

  def expected_results
    @expected_results ||= [
      "Last-706, First 706 #{confirmation_call_title}, #{help_request_title}",
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
      "Last-303, First 303 #{confirmation_call_title}"
    ]
  end
end
