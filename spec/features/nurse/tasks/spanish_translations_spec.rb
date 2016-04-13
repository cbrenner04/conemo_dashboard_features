# filename: ./spec/features/nurse/tasks/spanish_translations_spec.rb

require './spec/support/nurse/tasks_helper.rb'
require './spec/support/nurse/tasks/spanish_translations_helper.rb'

feature 'Spanish nurse, Participant tasks', metadata: :first do
  background do
    spanish_nurse.sign_in
    pt_501_nurse_tasks.open
  end

  scenario 'Spanish nurse sees translations for additional contact' do
    spanish_additional_contact.open

    expect(spanish_additional_contact).to have_contact_title
    expect(spanish_additional_contact).to have_form_headings
    expect(spanish_additional_contact).to have_current_date_selections
    expect(spanish_additional_contact).to have_type_options

    spanish_additional_contact.choose_option
    spanish_navigation.cancel

    expect(spanish_lack_of_connectivity_call).to be_active
  end

  scenario 'Spanish nurse sees translations for confirmation call' do
    expect(spanish_confirmation_call).to be_active
    expect(spanish_confirmation_call).to have_time_ago_in_words

    spanish_confirmation_call.confirm

    expect(spanish_confirmation_call).to have_form_headings
    expect(spanish_confirmation_call).to have_current_date_selections
    expect(spanish_confirmation_call).to have_next_contact_date_selections
    expect(spanish_confirmation_call).to have_site_options

    spanish_confirmation_call.toggle_options_list
    spanish_navigation.cancel
    spanish_confirmation_call.open_reschedule_form

    expect(spanish_reschedule_form).to have_form_headings
    expect(spanish_reschedule_form).to have_current_date_selections
    expect(spanish_reschedule_form).to have_reason_options

    spanish_reschedule_form.toggle_options_list
    spanish_navigation.cancel
    spanish_confirmation_call.cancel

    expect(spanish_cancel_form).to have_form_title
    expect(spanish_cancel_form).to have_form_headings

    spanish_cancel_form.complete

    expect(spanish_confirmation_call).to have_canceled_alert
  end

  scenario 'Spanish nurse sees translations for initial appointment' do
    expect(spanish_initial_appointment).to be_active

    spanish_initial_appointment.confirm

    expect(spanish_initial_appointment).to have_form_headings
    expect(spanish_initial_appointment).to have_current_date_selections
    expect(spanish_initial_appointment).to have_site_options

    spanish_initial_appointment.toggle_options_list

    expect(spanish_initial_appointment).to have_next_contact_date

    spanish_navigation.cancel
    spanish_initial_appointment.open_reschedule_form

    expect(spanish_reschedule_form).to have_form_headings
    expect(spanish_reschedule_form).to have_current_date_selections
    expect(spanish_reschedule_form).to have_reason_options

    spanish_reschedule_form.toggle_options_list
    spanish_navigation.cancel
    spanish_initial_appointment.cancel

    expect(spanish_cancel_form).to have_form_title
    expect(spanish_cancel_form).to have_form_headings

    spanish_cancel_form.complete

    expect(spanish_initial_appointment).to have_canceled_alert
  end

  scenario 'Spanish nurse sees translations for follow up week 1' do
    expect(spanish_follow_up_week_1).to be_active

    spanish_follow_up_week_1.confirm

    expect(spanish_follow_up_week_1).to have_form_headings
    expect(spanish_follow_up_week_1).to have_current_date_selections
    expect(spanish_follow_up_week_1).to have_difficulties_options
    expect(spanish_follow_up_week_1).to have_next_contact_date

    spanish_navigation.cancel
    spanish_follow_up_week_1.open_reschedule_form

    expect(spanish_reschedule_form).to have_form_headings
    expect(spanish_reschedule_form).to have_current_date_selections
    expect(spanish_reschedule_form).to have_reason_options

    spanish_reschedule_form.toggle_options_list
    spanish_navigation.cancel
    spanish_follow_up_week_1.cancel

    expect(spanish_cancel_form).to have_form_title
    expect(spanish_cancel_form).to have_form_headings

    spanish_cancel_form.complete

    expect(spanish_follow_up_week_1).to have_canceled_alert
  end

  scenario 'Spanish nurse sees translations for follow up week 3' do
    expect(spanish_follow_up_week_3).to be_active

    spanish_follow_up_week_3.confirm

    expect(spanish_follow_up_week_3).to have_form_headings
    expect(spanish_follow_up_week_3).to have_current_date_selections
    expect(spanish_follow_up_week_3).to have_difficulties_options
    expect(spanish_follow_up_week_3).to have_next_contact_date

    spanish_navigation.cancel
    spanish_follow_up_week_3.open_reschedule_form

    expect(spanish_reschedule_form).to have_form_headings
    expect(spanish_reschedule_form).to have_current_date_selections
    expect(spanish_reschedule_form).to have_reason_options

    spanish_reschedule_form.toggle_options_list
    spanish_navigation.cancel
    spanish_follow_up_week_3.cancel

    expect(spanish_cancel_form).to have_form_title
    expect(spanish_cancel_form).to have_form_headings

    spanish_cancel_form.complete

    expect(spanish_follow_up_week_3).to have_canceled_alert
  end

  scenario 'Spanish nurse sees translations for call to schedule final appt' do
    expect(spanish_call_to_schedule_final).to be_active

    spanish_call_to_schedule_final.confirm

    expect(spanish_call_to_schedule_final).to have_form_headings
    expect(spanish_call_to_schedule_final).to have_current_date_selections
    expect(spanish_call_to_schedule_final).to have_next_contact_date
    expect(spanish_call_to_schedule_final).to have_location_options

    spanish_call_to_schedule_final.toggle_options_list
    spanish_navigation.cancel
    spanish_call_to_schedule_final.open_reschedule_form

    expect(spanish_reschedule_form).to have_form_headings
    expect(spanish_reschedule_form).to have_current_date_selections
    expect(spanish_reschedule_form).to have_reason_options

    spanish_reschedule_form.toggle_options_list
    spanish_navigation.cancel
    spanish_call_to_schedule_final.cancel

    expect(spanish_cancel_form).to have_form_title
    expect(spanish_cancel_form).to have_form_headings

    spanish_cancel_form.complete

    expect(spanish_call_to_schedule_final).to have_canceled_alert
  end

  scenario 'Spanish nurse sees translations for final appointment' do
    expect(spanish_final_appointment).to be_active

    spanish_final_appointment.confirm

    expect(spanish_final_appointment).to have_form_headings
    expect(spanish_final_appointment).to have_current_date_selections
    expect(spanish_final_appointment).to have_location_options

    spanish_final_appointment.toggle_options_list
    spanish_navigation.cancel
    spanish_final_appointment.open_reschedule_form

    expect(spanish_reschedule_form).to have_form_headings
    expect(spanish_reschedule_form).to have_current_date_selections
    expect(spanish_reschedule_form).to have_reason_options

    spanish_reschedule_form.toggle_options_list
    spanish_navigation.cancel
    spanish_final_appointment.cancel

    expect(spanish_cancel_form).to have_form_title
    expect(spanish_cancel_form).to have_form_headings

    spanish_cancel_form.complete

    expect(spanish_final_appointment).to have_canceled_alert
  end

  scenario 'Spanish nurse sees translations for non-scheduled tasks' do
    expect(spanish_lack_of_connectivity_call).to be_active

    spanish_lack_of_connectivity_call.mark_resolved

    expect(spanish_lack_of_connectivity_call).to have_form_headings
    expect(spanish_lack_of_connectivity_call).to have_reason_options

    spanish_lack_of_connectivity_call.toggle_options_list
    spanish_navigation.cancel

    expect(spanish_help_request).to be_active

    spanish_help_request.mark_resolved

    expect(spanish_help_request).to have_form_headings

    spanish_help_request.complete_resolution_form

    expect(spanish_help_request).to have_resolution_confirmation_alert

    your_patients.return
    pt_502_nurse_tasks.open

    expect(spanish_non_adherence_call).to be_active

    spanish_non_adherence_call.mark_resolved

    expect(spanish_non_adherence_call).to have_form_headings
    expect(spanish_non_adherence_call).to have_reason_options
  end

  scenario 'Spanish nurse sees translations for contact supervisor' do
    spanish_lack_of_connectivity_call.contact_supervisor

    expect(pt_501_nurse_tasks).to have_new_supervisor_contact

    spanish_nurse.sign_out
    spanish_supervisor.sign_in
    nurse_500.select
    pt_501_nurse_tasks.open

    expect(pt_501_nurse_tasks).to have_new_supervisor_contact

    pt_501_nurse_tasks.clear_supervisor_contact

    expect(pt_501_nurse_tasks).to_not have_new_supervisor_contact
  end
end

feature 'Spanish nurse, Participant tasks', metadata: :not_first do
  scenario 'Spanish nurse creates confirmation call' do
    spanish_nurse.sign_in
    pt_504_nurse_tasks.open
    spanish_confirmation_call.confirm
    spanish_confirmation_call.enter_first_appt_location
    spanish_navigation.submit

    expect(pt_504_nurse_tasks).to have_successful_confirmation_call_alert
  end
end
