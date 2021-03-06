# frozen_string_literal: true
# filename: ./spec/features/nurse_supervisor/nurse_table_spec.rb

require './spec/support/nurse_supervisor/nurses_helper'

feature 'Nurse Supervisor, Nurses', metadata: :first do
  background { english_supervisor.sign_in }

  feature 'Nurse Supervisor, Supervision Session' do
    scenario 'Sees 12 day old supervision session' do
      expect(nurse_402_supervision_session).to have_supervision_session_overdue
    end

    scenario 'Sees 8 day old supervision session' do
      expect(nurse_401_supervision_session).to have_supervision_session_late
    end

    scenario 'Completes supervision session' do
      nurse_403_supervision_session.create_supervision_session
      supervision_session_form.enter_session_length
      supervision_session_form.select_meeting_kind
      supervision_session_form.select_contact_kind
      supervision_session_form.choose_topic
      navigation.submit

      expect(supervision_session_form).to have_new_supervision_session

      nurse_supervisor.return_to_home

      expect(nurse_403_supervision_session).to have_last_supervision_session
    end
  end

  feature 'Nurse Supervisor, Contact Supervisor Notifications' do
    scenario 'Nurse Supervisor sees for individual patient' do
      nurse_400.select
      pt_403_tasks.open

      expect(pt_403_supervisor_contact).to have_previous_supervisor_contact
    end

    scenario 'Nurse Supervisor clears contact supervisor notification' do
      nurse_400.select
      pt_423_tasks.open

      expect(pt_423_supervisor_contact).to have_previous_supervisor_contact

      pt_423_supervisor_contact.clear

      expect(pt_423_supervisor_contact).to_not have_previous_supervisor_contact
    end
  end
end

feature 'Nurse Supervisor, Nurses', metadata: :not_first do
  background { english_supervisor.sign_in }

  scenario 'Nurse Supervisor sees nurses assigned to them ordered properly' do
    expect(nurse_supervisor).to have_nurses
  end

  scenario 'Nurse Supervisor sees # of pts, tasks, overdue tasks for nurse' do
    expect(nurse_401).to have_participants_and_tasks
  end

  feature 'Nurse Supervisor, Supervision session' do
    scenario 'Nurse Supervisor reviews previous sessions' do
      nurse_404_supervision_session.review_supervision_sessions

      expect(nurse_404_supervision_session).to have_previous_sessions_listed
    end

    scenario 'Nurse supervisor cancels filling in supervision session' do
      nurse_403_supervision_session.create_supervision_session
      navigation.cancel

      expect(nurse_supervisor).to be_on_home_page
    end

    scenario 'Nurse supervisor must fill in session Length' do
      nurse_403_supervision_session.create_supervision_session
      supervision_session_form.select_meeting_kind
      supervision_session_form.select_contact_kind
      supervision_session_form.choose_topic
      navigation.submit

      expect(supervision_session_form).to have_supervision_session_form_visible
    end

    scenario 'Nurse supervisor must select meeting kind' do
      nurse_403_supervision_session.create_supervision_session
      supervision_session_form.enter_session_length
      supervision_session_form.select_contact_kind
      supervision_session_form.choose_topic
      navigation.submit

      expect(supervision_session_form).to have_supervision_session_form_visible
    end

    scenario 'Nurse supervisor must select contact kind' do
      nurse_403_supervision_session.create_supervision_session
      supervision_session_form.enter_session_length
      supervision_session_form.select_meeting_kind
      supervision_session_form.choose_topic
      navigation.submit

      expect(supervision_session_form).to have_supervision_session_form_visible
    end

    scenario 'Nurse Supervisor creates a Nurse Supervisor note' do
      nurse_404_supervision_session.review_supervision_sessions
      nurse_404_supervision_note.create_supervision_note

      expect(nurse_404_supervision_note).to have_supervision_note
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

    scenario 'Nurse Supervisor sees all Nurse notes' do
      # potential for a dependency issue
      nurse_400.select
      pt_342_nurse_tasks_4.open
      pt_342_clinical_summary_1.open

      expect(pt_342_notes).to have_notes_headers
      expect(pt_342_notes).to have_contact_dates
    end

    scenario 'Nurse Supervisor sees timeline for individual participant' do
      nurse_400.select
      pt_342_nurse_tasks_4.open
      pt_342_clinical_summary_1.open
      pt_342_timeline_4.open

      expect(pt_342_timeline_4).to be_on_page
      expect(pt_342_timeline_4).to have_timeline_titles
    end
  end
end

feature 'Spanish Nurse Supervisor, Nurses', metadata: :very_first do
  background { spanish_supervisor.sign_in }

  scenario 'Sees correct translations for canceled and rescheduled tasks' do
    expect(spanish_supervisor_1).to have_rescheduled_and_canceled_tasks
  end
end

feature 'Spanish Nurse Supervisor, Nurses', metadata: :not_first do
  background { spanish_supervisor.sign_in }

  scenario 'Sees correct translations' do
    expect(spanish_supervisor_nurses).to have_nurses_title
    expect(nurse_500).to have_subheadings
  end

  scenario 'Sees correct translations for supervision session' do
    nurse_500_supervision_session.create_supervision_session

    expect(spanish_supervision_session_form)
      .to have_supervision_session_form_visible
    expect(spanish_supervision_session_form)
      .to have_questions_and_responses

    nurse_supervisor.return_to_home

    expect(nurse_500_supervision_session).to have_supervision_session_late

    nurse_500_supervision_session.review_supervision_sessions

    expect(nurse_500_supervision_session).to have_supervisor_notes_title
    expect(nurse_500_supervision_session).to have_supervision_sessions_title
    expect(nurse_500_supervision_session).to have_supervision_table_headers
  end
end

feature 'Portguese Nurse Supervisor, Nurses', metadata: :very_first do
  background { portuguese_supervisor.sign_in }

  scenario 'Sees correct translations for canceled and rescheduled tasks' do
    expect(portuguese_supervisor_1).to have_rescheduled_and_canceled_tasks
  end
end

feature 'Portguese Nurse Supervisor, Nurses', metadata: :not_first do
  background { portuguese_supervisor.sign_in }

  scenario 'Sees correct translations' do
    expect(portuguese_supervisor_nurses).to have_nurses_title
    expect(nurse_600).to have_subheadings
  end

  scenario 'Sees correct translations for supervision session' do
    nurse_600_supervision_session.create_supervision_session

    expect(portuguese_supervision_session_form)
      .to have_supervision_session_form_visible
    expect(portuguese_supervision_session_form)
      .to have_questions_and_responses

    nurse_supervisor.return_to_home

    expect(nurse_600_supervision_session).to have_supervision_session_late

    nurse_600_supervision_session.review_supervision_sessions

    expect(nurse_600_supervision_session).to have_supervisor_notes_title
    expect(nurse_600_supervision_session).to have_supervision_sessions_title
    expect(nurse_600_supervision_session).to have_supervision_table_headers
  end
end
