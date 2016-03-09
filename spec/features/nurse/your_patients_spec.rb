# filename: ./spec/features/nurse/your_patients_spec.rb

require './spec/support/nurse/your_patients_helper'

feature 'English Nurse, Your Patients' do
  background { english_nurse.sign_in }

  scenario 'Nurse sees Your Patients upon login' do
    expect(your_patients).to be_visible
  end

  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    expect(your_patients).to have_assigned_patients
  end

  scenario 'Nurse sees configuration token' do
    expect(your_patients).to have_configuration_tokens
  end

  scenario 'Nurse sees participants ordered correctly' do
    expect(your_patients).to be_ordered_correctly
  end

  scenario 'Nurse sees no adherence task for pt w connectivity task active' do
    expect(patient_427).to_not have_non_adherence_task
  end

  scenario 'Nurse sees all tasks resolved' do
    expect(patient_300).to have_tasks_completed
  end

  feature 'Active, tasks scheduled before noon' do
    scenario 'Nurse sees confirmation call'
    scenario 'Nurse sees initial in person appointment'
    scenario 'Nurse sees follow up call week 1'
    scenario 'Nurse sees follow up call week 3'
    scenario 'Nurse sees call to schedule final appointment'
    scenario 'Nurse sees final appointment'
    scenario 'Nurse sees help request'
    scenario 'Nurse sees non-connectivity call'
    scenario 'Nurse sees non-adherence call'
  end

  feature 'Active, tasks scheduled after noon' do
    scenario 'Nurse sees confirmation call'
    scenario 'Nurse sees initial in person appointment'
    scenario 'Nurse sees follow up call week 1'
    scenario 'Nurse sees follow up call week 3'
    scenario 'Nurse sees call to schedule final appointment'
    scenario 'Nurse sees final appointment'
    scenario 'Nurse sees help request'
    scenario 'Nurse sees non-connectivity call'
    scenario 'Nurse sees non-adherence call'
  end

  feature 'Overdue, tasks assigned before noon' do
    scenario 'Nurse sees confirmation call'
    scenario 'Nurse sees initial in person appointment'
    scenario 'Nurse sees follow up call week 1'
    scenario 'Nurse sees follow up call week 3'
    scenario 'Nurse sees call to schedule final appointment'
    scenario 'Nurse sees final appointment'
    scenario 'Nurse sees help request'
    scenario 'Nurse sees non-connectivity call'
    scenario 'Nurse sees non-adherence call'
  end

  feature 'Overdue, tasks assigned after noon' do
    scenario 'Nurse sees confirmation call'
    scenario 'Nurse sees initial in person appointment'
    scenario 'Nurse sees follow up call week 1'
    scenario 'Nurse sees follow up call week 3'
    scenario 'Nurse sees call to schedule final appointment'
    scenario 'Nurse sees final appointment'
    scenario 'Nurse sees help request'
    scenario 'Nurse sees non-connectivity call'
    scenario 'Nurse sees non-adherence call'
  end
end

feature 'Spanish Nurse, Your Patients' do
  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    spanish_nurse.sign_in

    expect(spanish_patients).to have_assigned_patients
  end
end

feature 'Portuguese Nurse, Your Patients' do
  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    portuguese_nurse.sign_in

    expect(portuguese_patients).to have_assigned_patients
  end
end
