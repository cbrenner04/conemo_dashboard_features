# filename: ./spec/features/nurse/your_patients_spec.rb

require './spec/support/nurse/your_patients_helper'

feature 'English Nurse, Your Patients' do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    expect(your_patients).to have_assigned_patients
  end

  scenario 'Nurse sees configuration token' do
    expect(your_patients).to have_configuration_tokens
  end

  scenario 'Nurse sees participants ordered correctly' do
    expect(your_patients).to be_ordered_correctly
  end

  scenario 'Nurse sees multiple tasks for one patient ordered correctly' do
    expect(patient_1000).to have_tasks_ordered_correctly
  end

  scenario 'Nurse sees no non_adherence for pt w connectivity task active' do
    expect(patient_427).to_not have_non_adherence_task
  end

  scenario 'Nurse sees all tasks resolved' do
    expect(patient_300).to have_tasks_completed
  end

  feature 'Active tasks' do
    scenario 'Nurse sees confirmation call' do
      expect(patient_302).to have_tasks_active

      expect(patient_302).to have_confirmation_call
    end

    scenario 'Nurse sees initial in person appointment' do
      expect(patient_312).to have_tasks_active

      expect(patient_312).to have_initial_appointment
    end

    scenario 'Nurse sees follow up call week 1' do
      expect(patient_322).to have_tasks_active

      expect(patient_322).to have_follow_up_week_1
    end

    scenario 'Nurse sees follow up call week 3' do
      expect(patient_330).to have_tasks_active

      expect(patient_330).to have_follow_up_week_3
    end

    scenario 'Nurse sees call to schedule final appointment' do
      expect(patient_703).to have_tasks_active

      expect(patient_703).to have_call_to_schedule_final_appt
    end

    scenario 'Nurse sees final appointment' do
      expect(patient_344).to have_tasks_active

      expect(patient_344).to have_final_appointment
    end

    scenario 'Nurse sees help request' do
      expect(patient_404).to have_tasks_active

      expect(patient_404).to have_help_request
    end

    scenario 'Nurse sees non-connectivity call' do
      expect(patient_414).to have_tasks_active

      expect(patient_414).to have_lack_of_connectivity_task
    end

    scenario 'Nurse sees non-adherence call' do
      expect(patient_421).to have_tasks_active

      expect(patient_421).to have_non_adherence_task
    end
  end

  feature 'Overdue tasks' do
    scenario 'Nurse sees confirmation call' do
      expect(patient_706).to have_tasks_overdue

      expect(patient_706).to have_confirmation_call
    end

    scenario 'Nurse sees initial in person appointment' do
      expect(patient_707).to have_tasks_overdue

      expect(patient_707).to have_initial_appointment
    end

    scenario 'Nurse sees follow up call week 1' do
      expect(patient_708).to have_tasks_overdue

      expect(patient_708).to have_follow_up_week_1
    end

    scenario 'Nurse sees follow up call week 3' do
      expect(patient_709).to have_tasks_overdue

      expect(patient_709).to have_follow_up_week_3
    end

    scenario 'Nurse sees call to schedule final appointment' do
      expect(patient_800).to have_tasks_overdue

      expect(patient_800).to have_call_to_schedule_final_appt
    end

    scenario 'Nurse sees final appointment' do
      expect(patient_801).to have_tasks_overdue

      expect(patient_801).to have_final_appointment
    end

    scenario 'Nurse sees help request' do
      expect(patient_802).to have_tasks_overdue

      expect(patient_802).to have_help_request
    end

    scenario 'Nurse sees non-connectivity call' do
      expect(patient_803).to have_tasks_overdue

      expect(patient_803).to have_lack_of_connectivity_task
    end

    scenario 'Nurse sees non-adherence call' do
      expect(patient_804).to have_tasks_overdue

      expect(patient_804).to have_non_adherence_task
    end
  end

  # will need to use something to manipulate the server time
  # otherwise just have the above set of examples testing css

  feature 'Conditional statuses' do
    scenario 'Nurse sees change in tasks order within one patient ' \
             'when second task becomes overdue first'
    # day 1 - confirmation call, day 2 help request - order is same
    # day 3 - help request overdue, confirmation call active - reverse order
    # day 5 - both overdue, reverse order stays

    scenario 'Nurse sees non-adherence task disappear after session is ' \
             'accessed late'
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
  background { spanish_nurse.sign_in }

  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    expect(spanish_patients).to have_assigned_patients
  end

  scenario 'Nurse sees correct translations'
end

feature 'Portuguese Nurse, Your Patients' do
  background { portuguese_nurse.sign_in }

  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    expect(portuguese_patients).to have_assigned_patients
  end

  scenario 'Nurse sees correct translations'
end
