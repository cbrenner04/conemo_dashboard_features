# filename: ./spec/features/nurse_supervisor/nurse_table_spec.rb

require './spec/support/nurse_supervisor/nurses_helper'

feature 'Nurse Supervisor, Nurses', metadata: :first do
  background { english_supervisor.sign_in }

  feature 'Nurse Supervisor, Supervision Session' do
    scenario 'Sees 12 day old supervision session' do
      expect(nurse_402).to have_supervision_session_overdue
    end

    scenario 'Sees 8 day old supervision session' do
      expect(nurse_401).to have_supervision_session_late
    end

    scenario 'Completes supervision session' do
      nurse_403.create_supervision_session
      nurse_403.enter_session_length
      nurse_403.select_meeting_kind
      nurse_403.select_contact_kind
      nurse_403.choose_topic
      navigation.submit

      expect(nurse_403).to have_supervision_session
    end
  end

  feature 'Nurse Supervisor, Contact Supervisor Notifications' do
    scenario 'Nurse Supervisor sees for individual patient' do
      nurse_400.select
      pt_403_tasks.open

      expect(pt_403_tasks).to have_previous_supervisor_contact
    end

    scenario 'Nurse Supervisor clears contact supervisor notification' do
      nurse_400.select
      pt_412_tasks.open

      expect(pt_412_tasks).to have_previous_supervisor_contact

      pt_412_tasks.clear_supervisor_contact

      expect(pt_412_tasks).to_not have_previous_supervisor_contact
    end
  end
end

feature 'Nurse Supervisor, Nurses', metadata: :not_first do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor sees all nurses assigned to them' do
    expect(nurse_supervisor).to have_nurses
  end

  scenario 'Nurse Supervisor sees # of pts, tasks, overdue tasks for nurse' do
    expect(nurse_401).to have_participants_and_tasks
  end

  feature 'Nurse Supervisor, Supervision session' do
    scenario 'Nurse Supervisor reviews previous sessions' do
      nurse_404.review_supervision_sessions

      expect(nurse_404).to have_previous_sessions_listed
    end

    scenario 'Nurse supervisor cancels filling in supervision session' do
      nurse_403.create_supervision_session
      navigation.cancel
      sleep(1)
      expect(nurse_supervisor).to be_on_home_page
    end

    scenario 'Nurse supervisor must fill in session Length' do
      nurse_403.create_supervision_session
      nurse_403.select_meeting_kind
      nurse_403.select_contact_kind
      nurse_403.choose_topic
      navigation.submit

      expect(nurse_403).to have_supervision_session_form_visible
    end

    scenario 'Nurse supervisor must select meeting kind' do
      nurse_403.create_supervision_session
      nurse_403.enter_session_length
      nurse_403.select_contact_kind
      nurse_403.choose_topic
      navigation.submit

      expect(nurse_403).to have_supervision_session_form_visible
    end

    scenario 'Nurse supervisor must select contact kind' do
      nurse_403.create_supervision_session
      nurse_403.enter_session_length
      nurse_403.select_meeting_kind
      nurse_403.choose_topic
      navigation.submit

      expect(nurse_403).to have_supervision_session_form_visible
    end
  end

  feature 'Nurse Supervisor, Contact Supervisor Notifications' do
    scenario 'Nurse Supervisor sees for nurse' do
      expect(nurse_400).to have_contact_notification
    end

    scenario 'Nurse Supervisor sees across patients' do
      nurse_400.select

      expect(patient_402).to have_supervisor_contact_notification
    end
  end

  feature 'Nurse Supervisor, Nurse specific tasks and information' do
    scenario 'Nurse Supervisor sees all current tasks for assigned nurses' do
      nurse_400.select

      expect(nurse_400).to have_your_patients_header

      expect(your_patients).to have_assigned_patients
    end

    scenario 'Nurse Supervisor sees tasks for individual participant' do
      nurse_400.select
      pt_1000_nurse_tasks.open

      expect(pt_1000_nurse_tasks).to have_multiple_tasks_in_count

      expect(confirmation_call).to be_active

      expect(help_request).to be_active

      expect(lack_of_connectivity_call).to be_active
    end

    scenario 'Nurse Supervisor sees patient contact information' do
      nurse_400.select
      pt_300_nurse_tasks.open

      expect(pt_300_contact_info).to be_visible
    end

    scenario 'Nurse Supervisor updates patient contact information' do
      nurse_400.select
      pt_301_nurse_tasks.open
      pt_301_contact_info_1.select_edit_contact_information
      pt_301_contact_info_1.select_health_unit
      navigation.submit

      expect(pt_301_contact_info_1).to be_updated
    end

    scenario 'Nurse Supervisor visits participant clinical summary' do
      nurse_400.select
      pt_343_nurse_tasks.open
      pt_343_clinical_summary_2.open

      expect(pt_343_clinical_summary_2).to have_messages

      pt_343_clinical_summary_2.show_number_of_logins

      expect(pt_343_clinical_summary_2).to have_correct_logins
    end

    scenario 'Nurse Supervisor sees all Nurse notes' do
      # potential for a dependency issue
      nurse_400.select
      pt_342_nurse_tasks_4.open
      pt_342_clinical_summary_1.open

      expect(pt_342_clinical_summary_1).to have_notes_headers

      expect(pt_342_clinical_summary_1).to have_contact_dates
    end

    scenario 'Nurse Supervisor sees timeline for individual participant' do
      nurse_400.select
      pt_342_nurse_tasks_4.open
      pt_342_clinical_summary_1.open
      pt_342_contact_info_4.open

      expect(pt_342_contact_info_4).to be_on_page

      expect(pt_342_contact_info_4).to have_timeline_titles
    end
  end
end
