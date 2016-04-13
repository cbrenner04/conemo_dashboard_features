# filename: ./spec/features/nurse/timeline_page_spec.rb

require './spec/support/nurse/timeline_page_helper'

feature 'Nurse, Timeline', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participant id and name in header' do
    pt_342_nurse_tasks_1.open
    pt_342_clinical_summary.open
    pt_342_timeline_1.open

    expect(pt_342_timeline_1).to be_on_page
    expect(pt_342_nurse_tasks_1).to have_participant_in_header
  end

  scenario 'Nurse cancels edit of confirmation call' do
    pt_342_nurse_tasks_1.open
    pt_342_clinical_summary.open
    pt_342_timeline_1.open
    pt_342_timeline_1.edit_confirmation_call

    expect(confirmation_call).to be_visible

    navigation.cancel

    expect(confirmation_call).to be_visible_on_timeline
  end

  scenario 'Nurse edits confirmation call' do
    pt_342_nurse_tasks_1.open
    pt_342_clinical_summary.open
    pt_342_timeline_1.open
    pt_342_timeline_1.edit_confirmation_call

    expect(confirmation_call).to be_visible

    confirmation_call.enter_first_appt_location
    navigation.submit
    # pt_342_clinical_summary.open
    # pt_342_timeline_1.open

    expect(confirmation_call).to be_visible_on_timeline
  end

  scenario 'Nurse edits initial in person appointment' do
    pt_342_nurse_tasks_1.open
    pt_342_clinical_summary.open
    pt_342_timeline_1.open
    pt_342_timeline_1.edit_initial_appointment
    pt_342_nurse_tasks_1.enter_session_length
    initial_appointment.enter_location
    navigation.submit
    # pt_342_clinical_summary.open
    # pt_342_timeline_1.open

    expect(pt_342_timeline_1).to have_updated_session_length
  end

  scenario 'Nurse edits follow up call week 1' do
    pt_342_nurse_tasks_2.open
    pt_342_clinical_summary.open
    pt_342_timeline_2.open
    pt_342_timeline_2.edit_follow_up_week_1
    pt_342_nurse_tasks_2.enter_session_length
    follow_up_week_1.enter_difficulties
    navigation.submit
    pt_342_clinical_summary.open
    pt_342_timeline_2.open

    expect(pt_342_timeline_2).to have_updated_call_length
  end

  scenario 'Nurse edits follow up call week 3' do
    pt_342_nurse_tasks_3.open
    pt_342_clinical_summary.open
    pt_342_timeline_3.open
    sleep(0.25)
    navigation.scroll_down
    pt_342_timeline_3.edit_follow_up_week_3
    pt_342_nurse_tasks_3.enter_session_length
    follow_up_week_3.enter_difficulties
    navigation.submit
    # pt_342_clinical_summary.open
    # pt_342_timeline_3.open

    expect(pt_342_timeline_3).to have_updated_call_length
  end

  scenario 'Nurse edits call to schedule final appointment' do
    pt_343_nurse_tasks.open
    pt_343_clinical_summary_1.open
    pt_343_timeline.open
    pt_343_timeline.edit_call_to_schedule_final_appt
    call_to_schedule_final_appointment.update_contact_at_to_today
    call_to_schedule_final_appointment.select_location
    navigation.submit
    # pt_343_clinical_summary_1.open
    # pt_343_timeline.open

    expect(pt_343_timeline).to have_updated_contact_at
  end

  scenario 'Nurse edits final appointment' do
    pt_342_nurse_tasks_1.open
    pt_342_clinical_summary.open
    pt_342_timeline_1.open
    pt_342_timeline_1.edit_final_appointment
    final_appointment.enter_location
    final_appointment.choose_phone_returned_negative
    navigation.submit
    # pt_342_clinical_summary.open
    # pt_342_timeline_1.open

    expect(pt_342_timeline_1).to have_updated_phone_return
  end
end

feature 'Spanish Nurse, Timeline', metadata: :not_first do
  scenario 'Spanish nurse sees correct translations' do
    spanish_nurse.sign_in
    pt_500_nurse_tasks.open
    pt_500_clinical_summary_1.open
    pt_500_timeline.open

    expect(pt_500_timeline).to be_on_page
    expect(pt_500_timeline).to have_timeline_titles
    # # not yet implemented
    # expect(pt_500_timeline).to have_contact_dates
    # # not completed
    # expect(pt_500_timeline).to have_timeline_headings
  end
end

feature 'Portuguese Nurse, Timeline', metadata: :not_first do
  scenario 'Portuguese nurse sees correct translations' do
    portuguese_nurse.sign_in
    pt_600_nurse_tasks.open
    pt_600_clinical_summary_1.open
    pt_600_timeline.open

    expect(pt_600_timeline).to be_on_page
    expect(pt_600_timeline).to have_timeline_titles
    # # not yet implemented
    # expect(pt_600_timeline).to have_contact_dates
    # # not completed
    # expect(pt_600_timeline).to have_timeline_headings
  end
end
