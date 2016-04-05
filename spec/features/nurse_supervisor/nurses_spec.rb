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

      expect(nurse_supervisor).to have_home_page_visible
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

  feature 'Nurse Supervisor, Supervision contact' do
    scenario 'Nurse Supervisor cancels filling in supervision contact' do
      nurse_404.create_supervision_contact
      navigation.cancel

      expect(nurse_supervisor).to have_home_page_visible
    end

    scenario 'Nurse Supervisor must select type of contact' do
      nurse_404.create_supervision_contact
      navigation.submit

      expect(nurse_404).to have_supervision_contact_form_visible
    end

    scenario 'Nurse Supervisor completes supervision contact' do
      nurse_404.create_supervision_contact
      nurse_404.select_contact_kind
      navigation.submit

      expect(nurse_supervisor).to have_home_page_visible
    end
  end

  feature 'Nurse Supervisor, Nurse specific tasks and information' do
    scenario 'Nurse Supervisor sees all current tasks for assigned nurses' do
      2.times { navigation.scroll_down }
      nurse_400.select

      expect(nurse_400).to have_your_patients_header

      expect(your_patients).to have_assigned_patients
    end

    scenario 'Nurse Supervisor visits participant clinical summary' do
      3.times { navigation.scroll_down }
      nurse_400.select
      pt_343_nurse_tasks.open
      pt_343_clinical_summary_2.open

      expect(pt_343_clinical_summary_2).to have_messages

      pt_343_clinical_summary_2.show_number_of_logins

      expect(pt_343_clinical_summary_2).to have_correct_logins
    end

    scenario 'Nurse Supervisor sees all Nurse notes' do
      # potential for a dependency issue
      2.times { navigation.scroll_down }
      nurse_400.select
      pt_342_nurse_tasks_4.open
      pt_342_clinical_summary_1.open

      expect(pt_342_clinical_summary_1).to have_notes_headers

      expect(pt_342_clinical_summary_1).to have_contact_dates
    end

    scenario 'Nurse Supervisor sees patient contact information' do
      2.times { navigation.scroll_down }
      nurse_400.select
      pt_300_nurse_tasks.open

      expect(pt_300_contact_info).to be_visible
    end

    scenario 'Nurse Supervisor updates patient contact information' do
      2.times { navigation.scroll_down }
      nurse_400.select
      pt_301_nurse_tasks.open
      pt_301_contact_info_1.select_edit_contact_information
      pt_301_contact_info_1.select_health_unit
      navigation.submit

      # currently redirects to Pending Participant page so this will fail
      expect(pt_301_contact_info_1).to be_on_page
    end
  end
end
