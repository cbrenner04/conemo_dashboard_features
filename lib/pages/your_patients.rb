# page object for active participants
class YourPatients
  include RSpec::Matchers
  include Capybara::DSL

  def initialize(your_patients)
    @pt_id ||= your_patients[:pt_id]
    @locale ||= your_patients[:locale]
  end

  def return
    find('.navbar-brand').click
  end

  def visible?
    has_css?('h2', text: 'Your Patients')
  end

  def has_patient?
    has_css?('tr', text: @pt_id)
  end

  def has_assigned_patients?
    assigned_participants.each { |i| has_text? i }
  end

  def has_configuration_tokens?
    ids = [338, 300, 326, 318, 305, 337, 308, 322, 325, 339]
    ids.each { |i| find('tr', text: i).has_text? "aBc#{i}XyZ" }
  end

  def ordered_correctly?
    expected_results = [
      '706 Confirmation call',
      '707 Initial in person appointment',
      '708 Follow up call week one',
      '709 Follow up call week three',
      '800 Call to schedule final appointment',
      '801 Final in person appointment',
      '802 Help request',
      '803 Lack of connectivity call',
      '804 Non adherence call'
    ]
    actual_results = (0..8).map { |i| all('tr')[i].text }

    expect(actual_results).to match_array(expected_results)
  end

  def has_tasks_completed?
    has_css?('.success', text: @pt_id)
  end

  def has_tasks_active?
    has_css?('.warning', text: @pt_id)
  end

  def has_tasks_overdue?
    has_css?('.danger', text: @pt_id)
  end

  def has_confirmation_call?
    patient_row.has_text? 'Confirmation call'
  end

  def has_initial_appointment?
    patient_row.has_text? 'Initial in person appointment'
  end

  def has_follow_up_week_1?
    patient_row.has_text? 'Follow up call week one'
  end

  def has_follow_up_week_3?
    patient_row.has_text? 'Follow up call week three'
  end

  def has_call_to_schedule_final_appt?
    patient_row.has_text? 'Call to schedule final appointment'
  end

  def has_non_adherence_task?
    patient_row.has_text? 'Non adherence call'
  end

  def has_final_appointment?
    patient_row.has_text? 'Final in person appointment'
  end

  private

  def patient_row
    find('tr', text: @pt_id)
  end

  def assigned_participants
    if @locale == 'spanish'
      spanish_nurse_patients
    elsif @locale == 'portuguese'
      portuguese_nurse_patients
    else
      english_nurse_patients
    end
  end

  def english_nurse_patients
    patients = [1000, 200, 201, 480, 490]
    ranges = [(100..102), (430..432), (440..442), (450..452), (460..462),
              (470..472), (300..343), (400..405), (410..415), (420..428),
              (700..709), (800..804)]
    ranges.each { |i| patients.concat i.to_a }
    @english_nurse_patients ||= patients.sample(10)
  end

  def spanish_nurse_patients
    @spanish_nurse_patients ||= (500..505).to_a.sample(3)
  end

  def portuguese_nurse_patients
    @portuguese_nurse_patients ||= (600..605).to_a.sample(3)
  end
end
