require './lib/pages/shared/translations'
Dir['./lib/pages/your_patients/nurse_tasks/*.rb'].each { |file| require file }

# page object for active participants
class YourPatients
  include RSpec::Matchers
  include Capybara::DSL
  include Translations

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

  def in_table?
    has_css?('tr', text: @pt_id)
  end

  def has_assigned_patients?
    assigned_participants.all? { |i| has_text? i }
  end

  def has_token?
    expected_text = row_text.gsub("#{@pt_id} Confirmation call", '')
    expect(expected_text).to match(/.+/)
  end

  def has_configuration_tokens?
    ids = [338, 300, 326, 318, 305, 337, 308, 322, 325, 339]
    ids.each { |i| find('tr', text: i).has_text? "aBc#{i}XyZ" }
  end

  def ordered_correctly?
    # these just cover overdue and do not confirm styling
    actual_results = (0..8).map { |i| all('tr')[i].text }
    expected_results = []
    conditionals = [expected_results_1, expected_results_2, expected_results_3]
    conditionals.each { |i| expected_results.concat i }

    expect(actual_results).to eq(expected_results)
  end

  def has_tasks_ordered_correctly?
    expected_text = row_text.gsub("#{@pt_id} ", '')
    expect(expected_text)
      .to eq 'Confirmation call, Help request, ' \
             "#{lack_of_connectivity_call.title}"
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
    patient_row.has_text? initial_in_person_appointment.title
  end

  def has_follow_up_week_1?
    patient_row.has_text? follow_up_call_week_one.title
  end

  def has_follow_up_week_3?
    patient_row.has_text? follow_up_call_week_three.title
  end

  def has_call_to_schedule_final_appt?
    patient_row.has_text? call_to_schedule_final_appointment.title
  end

  def has_final_appointment?
    patient_row.has_text? 'Final in person appointment'
  end

  def has_help_request?
    patient_row.has_text? 'Help request'
  end

  def has_lack_of_connectivity_task?
    patient_row.has_text? lack_of_connectivity_call.title
  end

  def has_non_adherence_task?
    patient_row.has_text? 'Non-adherence call'
  end

  private

  def initial_in_person_appointment
    @initial_in_person_appointment ||=
      YourPatients::NurseTasks::InitialInPersonAppointment.new(
        locale: 'english'
      )
  end

  def follow_up_call_week_one
    @follow_up_call_week_one ||=
      YourPatients::NurseTasks::FollowUpCallWeekOne.new(locale: 'english')
  end

  def follow_up_call_week_three
    @follow_up_call_week_three ||=
      YourPatients::NurseTasks::FollowUpCallWeekThree.new(locale: 'english')
  end

  def call_to_schedule_final_appointment
    @call_to_schedule_final_appointment ||=
      YourPatients::NurseTasks::CallToScheduleFinalAppointment.new(
        locale: 'english'
      )
  end

  def lack_of_connectivity_call
    @lack_of_connectivity_call ||=
      YourPatients::NurseTasks::LackOfConnectivityCall.new(locale: 'english')
  end

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

  def english_nurse_patients
    patients = [1000, 200, 201, 480, 490]
    ranges = [(100..102), (300..344), (430..432), (440..442),
              (450..452), (460..462), (470..472), (400..405),
              (410..415), (420..428), (700..709), (800..804)]
    ranges.each { |i| patients.concat i.to_a }
    @english_nurse_patients ||= patients.sample(10)
  end

  def spanish_nurse_patients
    @spanish_nurse_patients ||= (500..505).to_a.sample(3)
  end

  def portuguese_nurse_patients
    @portuguese_nurse_patients ||= (600..605).to_a.sample(3)
  end

  def expected_results_1
    @expected_results_1 ||= if all('tr')[1].has_text? 'Initial'
                              ['706 Confirmation call',
                               '707 Initial in person appointment',
                               '708 Follow up call week one',
                               '709 Follow up call week three']
                            else
                              ['706 Confirmation call',
                               '708 Follow up call week one',
                               '707 Initial in person appointment',
                               '709 Follow up call week three']
                            end
  end

  def expected_results_2
    @expected_results_2 ||= if all('tr')[3].has_text? 'Call'
                              ['800 Call to schedule final appointment',
                               '801 Final in person appointment']
                            else
                              ['801 Final in person appointment',
                               '800 Call to schedule final appointment']
                            end
  end

  def expected_results_3
    @expected_results_3 ||= if last_rows_1
                              ['802 Help request',
                               '803 Call due to no connectivity',
                               '804 Non-adherence call']
                            elsif last_rows_2
                              ['802 Help request', '804 Non-adherence call',
                               '803 Call due to no connectivity']
                            elsif last_rows_3
                              ['803 Call due to no connectivity',
                               '804 Non-adherence call', '802 Help request']
                            elsif last_rows_4
                              ['803 Call due to no connectivity',
                               '802 Help request', '804 Non-adherence call']
                            elsif last_rows_5
                              ['804 Non-adherence call', '802 Help request',
                               '803 Call due to no connectivity']
                            else
                              ['804 Non-adherence call',
                               '803 Call due to no connectivity',
                               '802 Help request']
                            end
  end

  def last_rows_1
    @last_rows_1 ||= all('tr')[6].has_text?('Help') &&
                     all('tr')[7].has_text?('due')
  end

  def last_rows_2
    @last_rows_2 ||= all('tr')[6].has_text?('Help') &&
                     all('tr')[7].has_text?('Non')
  end

  def last_rows_3
    @last_rows_3 ||= all('tr')[6].has_text?('due') &&
                     all('tr')[7].has_text?('Non')
  end

  def last_rows_4
    @last_rows_4 ||= all('tr')[6].has_text?('due') &&
                     all('tr')[7].has_text?('Help')
  end

  def last_rows_5
    @last_rows_5 ||= all('tr')[6].has_text?('Non') &&
                     all('tr')[7].has_text?('Help')
  end
end
