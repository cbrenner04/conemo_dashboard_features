# page object for active participants
class YourPatients
  include Capybara::DSL

  def initialize(your_patients)
    @pt_id ||= your_patients[:pt_id]
  end

  def visible?
    has_css?('h2', text: 'Your Patients')
  end

  def has_patient?
    has_css?('tr', text: @pt_id)
  end

  def return
    find('.navbar-brand').click
  end

  def has_tasks_completed?
    has_css?('.success', text: @pt_id)
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

  def has_final_appointment?
    patient_row.has_text? 'Final in person appointment'
  end

  private

  def patient_row
    find('tr', text: @pt_id)
  end
end
