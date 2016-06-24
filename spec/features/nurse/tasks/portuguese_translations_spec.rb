# frozen_string_literal: true
# filename: ./spec/features/nurse/tasks/portuguese_translations_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/portuguese_translations_helper'

feature 'Portuguese nurse, Participant tasks', metadata: :first do
  background do
    portuguese_nurse.sign_in
    pt_601_nurse_tasks.open
  end

  scenario 'Portuguese nurse sees translations for additional contact' do
    portuguese_additional_contact.open

    expect(portuguese_additional_contact).to have_contact_title
    expect(portuguese_additional_contact).to have_form_headings
    expect(portuguese_additional_contact).to have_current_date_selections
    expect(portuguese_additional_contact).to have_type_options

    portuguese_additional_contact.choose_option
    portuguese_navigation.cancel

    expect(portuguese_lack_of_connectivity_call).to be_active
  end

  scenario 'Portuguese nurse sees translations for confirmation call' do
    expect(portuguese_confirmation_call).to be_active

    # poltergeist does not see the timestamp
    unless ENV['driver'] == 'poltergeist'
      expect(portuguese_confirmation_call).to have_time_ago_in_words
    end

    portuguese_confirmation_call.confirm

    expect(portuguese_confirmation_call).to have_form_headings
    expect(portuguese_confirmation_call).to have_current_date_selections
    expect(portuguese_confirmation_call).to have_next_contact_date_selections
    expect(portuguese_confirmation_call).to have_site_options

    portuguese_confirmation_call.toggle_options_list
    portuguese_navigation.cancel
    portuguese_confirmation_call.open_reschedule_form

    expect(portuguese_reschedule_form).to have_form_headings
    expect(portuguese_reschedule_form).to have_alt_date_selections
    expect(portuguese_reschedule_form).to have_reason_options

    portuguese_reschedule_form.toggle_options_list
    portuguese_navigation.cancel
    portuguese_confirmation_call.cancel

    expect(portuguese_cancel_form).to have_form_title
    expect(portuguese_cancel_form).to have_form_headings

    portuguese_cancel_form.complete

    expect(portuguese_confirmation_call).to have_canceled_alert
  end

  scenario 'Portuguese nurse sees translations for initial appointment' do
    expect(portuguese_initial_appointment).to be_active

    portuguese_initial_appointment.confirm

    expect(portuguese_initial_appointment).to have_form_headings
    expect(portuguese_initial_appointment).to have_current_date_selections
    expect(portuguese_initial_appointment).to have_site_options

    portuguese_initial_appointment.toggle_options_list
    portuguese_navigation.cancel
    portuguese_initial_appointment.open_reschedule_form

    expect(portuguese_reschedule_form).to have_form_headings
    expect(portuguese_reschedule_form).to have_current_date_selections
    expect(portuguese_reschedule_form).to have_reason_options

    portuguese_reschedule_form.toggle_options_list
    portuguese_navigation.cancel
    portuguese_initial_appointment.cancel

    expect(portuguese_cancel_form).to have_form_title
    expect(portuguese_cancel_form).to have_form_headings

    portuguese_cancel_form.complete

    expect(portuguese_initial_appointment).to have_canceled_alert
  end

  scenario 'Portuguese nurse sees translations for follow up week 1' do
    expect(portuguese_follow_up_week_1).to be_active

    portuguese_follow_up_week_1.confirm

    expect(portuguese_follow_up_week_1).to have_form_headings
    expect(portuguese_follow_up_week_1).to have_current_date_selections
    expect(portuguese_follow_up_week_1).to have_difficulties_options
    expect(portuguese_follow_up_week_1).to have_difficulties_directions

    portuguese_navigation.cancel
    portuguese_follow_up_week_1.open_reschedule_form

    expect(portuguese_reschedule_form).to have_form_headings
    expect(portuguese_reschedule_form).to have_current_date_selections
    expect(portuguese_reschedule_form).to have_reason_options

    portuguese_reschedule_form.toggle_options_list
    portuguese_navigation.cancel
    portuguese_follow_up_week_1.cancel

    expect(portuguese_cancel_form).to have_form_title
    expect(portuguese_cancel_form).to have_form_headings

    portuguese_cancel_form.complete

    expect(portuguese_follow_up_week_1).to have_canceled_alert
  end

  scenario 'Portuguese nurse sees translations for follow up week 3' do
    expect(portuguese_follow_up_week_3).to be_active

    portuguese_follow_up_week_3.confirm

    expect(portuguese_follow_up_week_3).to have_form_headings
    expect(portuguese_follow_up_week_3).to have_current_date_selections
    expect(portuguese_follow_up_week_3).to have_difficulties_options
    expect(portuguese_follow_up_week_3).to have_difficulties_directions

    portuguese_navigation.cancel
    portuguese_follow_up_week_3.open_reschedule_form

    expect(portuguese_reschedule_form).to have_form_headings
    expect(portuguese_reschedule_form).to have_current_date_selections
    expect(portuguese_reschedule_form).to have_reason_options

    portuguese_reschedule_form.toggle_options_list
    portuguese_navigation.cancel
    portuguese_follow_up_week_3.cancel

    expect(portuguese_cancel_form).to have_form_title
    expect(portuguese_cancel_form).to have_form_headings

    portuguese_cancel_form.complete

    expect(portuguese_follow_up_week_3).to have_canceled_alert
  end

  scenario 'Portuguese nurse sees translations for call to schedule final' do
    expect(portuguese_call_to_schedule_final).to be_active

    portuguese_call_to_schedule_final.confirm

    expect(portuguese_call_to_schedule_final).to have_form_headings
    expect(portuguese_call_to_schedule_final).to have_current_date_selections
    expect(portuguese_call_to_schedule_final).to have_next_contact_date
    expect(portuguese_call_to_schedule_final).to have_location_options

    portuguese_call_to_schedule_final.toggle_options_list
    portuguese_navigation.cancel
    portuguese_call_to_schedule_final.open_reschedule_form

    expect(portuguese_reschedule_form).to have_form_headings
    expect(portuguese_reschedule_form).to have_current_date_selections
    expect(portuguese_reschedule_form).to have_reason_options

    portuguese_reschedule_form.toggle_options_list
    portuguese_navigation.cancel
    portuguese_call_to_schedule_final.cancel

    expect(portuguese_cancel_form).to have_form_title
    expect(portuguese_cancel_form).to have_form_headings

    portuguese_cancel_form.complete

    expect(portuguese_call_to_schedule_final).to have_canceled_alert
  end

  scenario 'Portuguese nurse sees translations for final appointment' do
    expect(portuguese_final_appointment).to be_active

    portuguese_final_appointment.confirm

    expect(portuguese_final_appointment).to have_form_headings
    expect(portuguese_final_appointment).to have_current_date_selections
    expect(portuguese_final_appointment).to have_location_options

    portuguese_final_appointment.toggle_options_list
    portuguese_navigation.cancel
    portuguese_final_appointment.open_reschedule_form

    expect(portuguese_reschedule_form).to have_form_headings
    expect(portuguese_reschedule_form).to have_current_date_selections
    expect(portuguese_reschedule_form).to have_reason_options

    portuguese_reschedule_form.toggle_options_list
    portuguese_navigation.cancel
    portuguese_final_appointment.cancel

    expect(portuguese_cancel_form).to have_form_title
    expect(portuguese_cancel_form).to have_form_headings

    portuguese_cancel_form.complete

    expect(portuguese_final_appointment).to have_canceled_alert
  end

  scenario 'Portuguese nurse sees translations for non-scheduled tasks' do
    expect(portuguese_lack_of_connectivity_call).to be_active

    portuguese_lack_of_connectivity_call.mark_resolved

    expect(portuguese_lack_of_connectivity_call).to have_helper_text
    expect(portuguese_lack_of_connectivity_call).to have_form_headings
    expect(portuguese_lack_of_connectivity_call).to have_reason_options

    portuguese_lack_of_connectivity_call.toggle_options_list
    portuguese_navigation.cancel

    expect(portuguese_help_request).to be_active

    portuguese_help_request.mark_resolved

    expect(portuguese_help_request).to have_helper_text
    expect(portuguese_help_request).to have_form_headings

    portuguese_help_request.complete_resolution_form

    expect(portuguese_help_request).to have_resolution_confirmation_alert

    navigation.return_home

    pt_602_nurse_tasks.open

    expect(portuguese_non_adherence_call).to be_active

    portuguese_non_adherence_call.mark_resolved

    expect(portuguese_non_adherence_call).to have_helper_text
    expect(portuguese_non_adherence_call).to have_form_headings
    expect(portuguese_non_adherence_call).to have_reason_options
  end

  scenario 'Portuguese nurse sees translations for contact supervisor' do
    portuguese_lack_of_connectivity_call.contact_supervisor

    expect(pt_601_supervisor_contact).to have_new_supervisor_contact

    portuguese_nurse.sign_out
    portuguese_supervisor.sign_in
    nurse_600.select
    pt_601_nurse_tasks.open

    expect(pt_601_supervisor_contact).to have_new_supervisor_contact

    pt_601_supervisor_contact.clear

    expect(pt_601_supervisor_contact).to_not have_new_supervisor_contact
  end
end

feature 'Portuguese nurse, Participant tasks', metadata: :not_first do
  background { portuguese_nurse.sign_in }

  scenario 'Portuguese nurse creates confirmation call' do
    pt_604_nurse_tasks.open
    portuguese_confirmation_call.confirm
    portuguese_confirmation_call.enter_first_appt_location
    portuguese_navigation.submit

    expect(pt_604_nurse_tasks).to have_successful_confirmation_call_alert
  end

  scenario 'Portuguese nurse confirms final appointment, sees proper alert' do
    pt_617_nurse_tasks.open
    portuguese_final_appointment.confirm
    portuguese_final_appointment.enter_location
    portuguese_final_appointment.enter_notes
    portuguese_final_appointment.choose_phone_returned
    portuguese_navigation.submit

    expect(portuguese_final_appointment).to have_success_alert
  end
end
