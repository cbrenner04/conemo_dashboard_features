# filename: ./spec/features/nurse/patient_contact_information_spec.rb

require './spec/support/nurse/contact_information_helper'

feature 'Nurse, Participant Contact Information' do
  background do
    english_nurse.sign_in
  end

  scenario 'Nurse visits participant contact information' do
    2.times { navigation.scroll_down }
    pt_300_nurse_tasks.open
    pt_300_contact_info.open

    expect(pt_300_contact_info).to be_visible
  end

  scenario 'Nurse cancels out of edit of participant information' do
    2.times { navigation.scroll_down }
    pt_301_nurse_tasks.open
    pt_301_contact_info.open
    pt_301_contact_info.select_edit_contact_information
    navigation.cancel

    expect(pt_301_contact_info).to be_visible
  end

  scenario 'Nurse edits participant information' do
    2.times { navigation.scroll_down }
    pt_301_nurse_tasks.open
    pt_301_contact_info.open
    pt_301_contact_info.select_edit_contact_information
    pt_301_contact_info.fill_in_email
    navigation.submit

    expect(pt_301_contact_info).to have_email_visible
  end

  scenario 'Nurse cancels out of edit of smartphone information' do
    2.times { navigation.scroll_down }
    pt_310_nurse_tasks.open
    pt_310_contact_info.open
    pt_310_contact_info.select_edit_smartphone_information
    navigation.cancel
    pt_310_contact_info.open

    expect(pt_310_contact_info).to be_visible

    expect(pt_310_contact_info).to_not have_smartphone_information
  end

  scenario 'Nurse enters smartphone information' do
    2.times { navigation.scroll_down }
    pt_302_nurse_tasks.open
    pt_302_contact_info.open
    pt_302_contact_info.select_edit_smartphone_information
    pt_302_contact_info.enter_smartphone_number
    pt_302_contact_info.enter_phone_id
    navigation.submit
    pt_302_contact_info.open

    expect(pt_302_contact_info).to have_smartphone_information
  end

  scenario 'Nurse edits confirmation call' do
    pt_342_nurse_tasks_1.open
    pt_342_contact_info_1.open
    pt_342_contact_info_1.edit_confirmation_call

    expect(confirmation_call).to be_visible

    confirmation_call.enter_first_appt_location
    navigation.submit
    pt_342_contact_info_1.open

    expect(pt_342_contact_info_1).to be_on_page
  end

  scenario 'Nurse edits initial in person appointment' do
    pt_342_nurse_tasks_1.open
    pt_342_contact_info_1.open
    pt_342_contact_info_1.edit_initial_appointment
    pt_342_nurse_tasks_1.enter_session_length
    initial_appointment.enter_location
    navigation.submit
    pt_342_contact_info_1.open

    expect(pt_342_contact_info_1).to have_updated_session_length
  end

  scenario 'Nurse edits follow up call week 1' do
    pt_342_nurse_tasks_2.open
    pt_342_contact_info_2.open
    pt_342_contact_info_2.edit_follow_up_week_1
    pt_342_nurse_tasks_2.enter_session_length
    navigation.submit
    pt_342_contact_info_2.open

    expect(pt_342_contact_info_2).to have_updated_call_length
  end

  scenario 'Nurse edits follow up call week 3' do
    pt_342_nurse_tasks_3.open
    pt_342_contact_info_3.open
    pt_342_contact_info_3.edit_follow_up_week_3
    pt_342_nurse_tasks_3.enter_session_length
    pt_342_nurse_tasks_3.select_ability
    pt_342_nurse_tasks_3.select_motivation
    navigation.submit
    pt_342_contact_info_3.open

    expect(pt_342_contact_info_3).to have_updated_call_length
  end

  scenario 'Nurse edits call to schedule final appointment' do
    pt_343_nurse_tasks.open
    pt_343_contact_info.open
    pt_343_contact_info.edit_call_to_schedule_final_appt
    call_to_schedule_final_appointment.update_contact_at_to_today
    call_to_schedule_final_appointment.select_location
    navigation.submit
    pt_343_contact_info.open

    expect(pt_343_contact_info).to have_updated_contact_at
  end

  scenario 'Nurse edits final appointment' do
    pt_342_nurse_tasks_1.open
    pt_342_contact_info_1.open
    pt_342_contact_info_1.edit_final_appointment
    final_appointment.choose_phone_returned_negative
    navigation.submit
    pt_342_contact_info_1.open

    expect(pt_342_contact_info_1).to have_updated_phone_return
  end
end

feature 'Spanish Nurse, Participant Contact Information' do
  scenario 'Spanish nurse sees correct translations' do
    spanish_nurse.sign_in
    pt_500_nurse_tasks.open
    pt_500_contact_info.open

    expect(pt_500_contact_info).to be_on_page

    expect(pt_500_contact_info).to have_contact_information_table_headings

    expect(pt_500_contact_info).to have_timeline_titles

    expect(pt_500_contact_info).to have_contact_dates

    expect(pt_500_contact_info).to have_timeline_headings
  end
end

feature 'Portuguese Nurse, Participant Contact Information' do
  scenario 'Portuguese nurse sees correct translations' do
    portuguese_nurse.sign_in
    pt_600_nurse_tasks.open
    pt_600_contact_info.open

    expect(pt_600_contact_info).to be_on_page

    expect(pt_600_contact_info).to have_contact_information_table_headings

    expect(pt_600_contact_info).to have_timeline_titles

    expect(pt_600_contact_info).to have_contact_dates

    expect(pt_600_contact_info).to have_timeline_headings
  end
end
