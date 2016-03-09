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
end
