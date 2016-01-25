# filename: ./spec/features/active_participants/contacts_spec.rb

# require page objects, these are instantiated in the feature_helper.rb
require './lib/pages/login'
require './lib/pages/navigation'
require './lib/pages/contact_information'

# require helper file with active_participant pages required and instantiated
require './spec/support/active_pt_helper'

describe 'An authorized admin signs in', type: :feature do
  before do
    login.sign_in(ENV['EN_Admin_Email'], ENV['EN_Admin_Password'])
    navigation.switch_to_english
    active_participants.open
    active_participants.assert_on_page
  end

  it 'views participant profile' do
    profile.go_to_profile_of('Last-300, First')
    expect(profile).to be_visible_with_id('300')
  end

  it 'cancels out of edit of participant information'

  it 'edits participant information from the profile page' do
    profile.go_to_profile_of('Last-301, First')
    profile.select_edit_contact_information
    contact_information.fill_in_email('participant301@example.com')
    navigation.submit

    expect(page).to have_content 'Email: participant301@example.com'
  end

  it 'views smartphone information'

  it 'cancels out of edit of smartphone information' do
    scroll_by('500')
    profile.go_to_profile_of('Last-310, First')
    profile.select_edit_smartphone_information
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'enters smartphone information' do
    profile.go_to_profile_of('Last-302, First')
    profile.select_edit_smartphone_information
    profile.enter_smartphone_number('1234567890')
    profile.select_all_smartphone_radios
    navigation.submit
    profile.go_to_profile_of('Last-302, First')

    expect(page).to have_content 'Smartphone Information: 1234567890'
  end

  it 'cancels out of edit nurse form' do
    nurse.open('309')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'updates nurse' do
    nurse.edit('303', '401')
    nurse.assert_new_nurse('303', '401')
  end

  it 'cancels add note' do
    notes.open_for('308')
    navigation.cancel

    expect(reports).to be_visible
  end

  it 'adds a note' do
    datetime = DateTime.now - 2
    notes.add_notes('304', datetime)
    active_participants.open
    notes.open_for('304')

    expect(notes).to be_visible
  end

  it 'deletes a note' do
    notes.open_for('305')
    notes.delete
    active_participants.open
    notes.open_for('305')

    expect(notes).to_not have_any_note
  end

  it 'cancels out of first contact form' do
    active_participants.create_contact_for('307')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'creates first contact' do
    active_participants.create_contact_for('306')
    first_contact.record_date_and_schedule_next
    first_contact.enter_first_appt_location
    navigation.submit

    within active_participants.pt_row('306') do
      expect(first_contact).to be_visible
    end

    # check profile page for completeness
    profile.go_to_profile_of('Last-306, First')
    expect(profile).to have_first_contact_information
  end

  it 'cancels out of a first appointment reschedule form' do
    scroll_by('500')
    active_participants.reschedule_appt_for('311')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'reschedules a first appointment' do
    scroll_by('500')
    active_participants.reschedule_appt_for('312')
    active_participants.reschedule('first_appointment')

    expect(active_participants).to be_rescheduled_for('312')
  end

  it 'cancels out of a first appointment creation form' do
    scroll_by('500')
    active_participants.create_contact_for('313')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'must enter a integer in session length field' do
    scroll_by('500')
    active_participants.create_contact_for('314')
    first_appointment.enter_time_and_location_and_schedule_next
    active_participants.enter_session_length('first_appointment', 'asdf')
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  it 'cannot submit first appointment form without entering session length' do
    scroll_by('500')
    active_participants.create_contact_for('315')
    first_appointment.enter_time_and_location_and_schedule_next
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  it 'cannot submit first appointment form without entering comfort' do
    scroll_by('500')
    active_participants.create_contact_for('316')
    first_appointment.enter_time_and_location_and_schedule_next
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  it 'cannot submit first appointment form without selecting engagement' do
    scroll_by('500')
    active_participants.create_contact_for('317')
    first_appointment.enter_time_and_location_and_schedule_next
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  it 'cannot submit first appointment form without selecting chances' do
    scroll_by('500')
    active_participants.create_contact_for('318')
    first_appointment.enter_time_and_location_and_schedule_next
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.enter_general_notes
    navigation.submit

    expect(profile).to_not have_phone_form_present
  end

  it 'creates a first appointment' do
    scroll_by('500')
    active_participants.create_contact_for('319')
    first_appointment.enter_time_and_location_and_schedule_next
    active_participants.enter_session_length('first_appointment', '120')
    first_appointment.select_pt_comfort_with_phone
    first_appointment.enter_phone_note
    first_appointment.select_engagement
    first_appointment.select_chances
    first_appointment.enter_general_notes
    navigation.submit

    profile.enter_smartphone_number('1234567890')
    profile.select_all_smartphone_radios
    navigation.submit

    expect(first_appointment).to be_created_for_participant('319')

    # check profile page for completeness
    scroll_by('500')
    profile.go_to_profile_of('Last-319, First')

    expect(profile).to have_first_appointment_information

    # check reports page for notes
    active_participants.open
    active_participants.assert_on_page
    scroll_by('500')
    reports.open_for('319')

    expect(reports).to have_first_appt_notes_visible
  end

  it 'cancels out of  second contact creation form' do
    scroll_by('1000')
    active_participants.reschedule_appt_for('320')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'reschedules a second contact' do
    scroll_by('1000')
    active_participants.reschedule_appt_for('321')
    active_participants.reschedule('second_contact')

    expect(active_participants).to be_rescheduled_for('321')
  end

  it 'cancels out of second contact creation form' do
    scroll_by('1000')
    active_participants.create_contact_for('322')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'must enter integer into length of call' do
    scroll_by('1000')
    active_participants.create_contact_for('323')
    active_participants.enter_session_length('second_contact', 'asdf')
    navigation.submit

    expect(active_participants).to_not be be_visible
  end

  it 'cannot submit second contact without selecting ability' do
    scroll_by('1000')
    active_participants.create_contact_for('324')
    second_contact.record_date_and_fill_in_questions
    active_participants.select_motivation
    second_contact.select_chances
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit second contact without selecting motivation' do
    scroll_by('1000')
    active_participants.create_contact_for('325')
    second_contact.record_date_and_fill_in_questions
    active_participants.select_ability
    second_contact.select_chances
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit second contact without selecting chances' do
    scroll_by('1000')
    active_participants.create_contact_for('326')
    second_contact.record_date_and_fill_in_questions
    active_participants.select_ability
    active_participants.select_motivation
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit second contact without entering length of call' do
    scroll_by('1000')
    active_participants.create_contact_for('327')
    second_contact.record_date_and_fill_in_questions
    active_participants.select_ability
    active_participants.select_motivation
    second_contact.select_chances
    second_contact.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'creates a second contact' do
    scroll_by('1000')
    active_participants.create_contact_for('328')
    second_contact.record_date_and_fill_in_questions
    active_participants.select_ability
    active_participants.select_motivation
    second_contact.select_chances
    active_participants.enter_session_length('second_contact', '60')
    second_contact.enter_notes
    navigation.submit

    expect(second_contact)
      .to be_created_for_participant('328', THREE_WEEKS)

    # check profile page for completeness
    scroll_by('1000')
    profile.go_to_profile_of('Last-328, First')
    expect(profile).to have_second_contact_information

    # check reports page for notes
  end

  it 'reschedules third contact' do
    scroll_by('1500')
    active_participants.reschedule_appt_for('329')
    active_participants.reschedule('third_contact')

    expect(active_participants).to be_rescheduled_for('329')
  end

  it 'cancels third contact creation' do
    scroll_by('1500')
    active_participants.create_contact_for('330')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'must enter an integer for length of call' do
    scroll_by('1500')
    active_participants.create_contact_for('331')
    third_contact.assert_on_page
    active_participants.record_time
    active_participants.enter_session_length('third_contact', 'asdf')
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit third contact form without entering length of call' do
    scroll_by('1500')
    active_participants.create_contact_for('332')
    third_contact.assert_on_page
    active_participants.record_time
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit third contact form w/o entering final appt location' do
    scroll_by('1500')
    active_participants.create_contact_for('333')
    third_contact.assert_on_page
    active_participants.record_time
    active_participants.enter_session_length('third_contact', '60')
    third_contact.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit third contact form without selecting ability' do
    scroll_by('1500')
    active_participants.create_contact_for('334')
    third_contact.assert_on_page
    active_participants.record_time
    active_participants.enter_session_length('third_contact', '60')
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit third contact form without selecting motivation' do
    scroll_by('1500')
    active_participants.create_contact_for('335')
    third_contact.assert_on_page
    active_participants.record_time
    active_participants.enter_session_length('third_contact', '60')
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_ability
    third_contact.enter_general_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'creates a third contact' do
    scroll_by('1500')
    active_participants.create_contact_for('336')
    third_contact.assert_on_page
    active_participants.record_time
    active_participants.enter_session_length('third_contact', '60')
    third_contact.enter_final_appt_location
    third_contact.respond_to_questions
    active_participants.select_ability
    active_participants.select_motivation
    third_contact.enter_general_notes
    navigation.submit

    expect(third_contact).to be_created_for_participant('336', TWO_WEEKS)

    # check profile page for completeness
    scroll_by('1500')
    profile.go_to_profile_of('Last-336, First')
    expect(profile).to have_third_contact_information

    # check reports page for notes
  end

  it 'reschedules final appointment' do
    scroll_by('1500')
    active_participants.reschedule_appt_for('337')
    active_participants.reschedule('final_appointment')

    expect(active_participants).to be_rescheduled_for('337')
  end

  it 'cancels final appointment form' do
    scroll_by('2000')
    active_participants.create_contact_for('338')
    navigation.cancel

    expect(active_participants).to be_visible
  end

  it 'cannot submit final appointment without location' do
    scroll_by('2000')
    active_participants.create_contact_for('339')
    final_appointment.assert_on_page
    active_participants.record_time
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'cannot submit final appointment without responding to phone return' do
    scroll_by('2000')
    active_participants.create_contact_for('340')
    final_appointment.assert_on_page
    active_participants.record_time
    final_appointment.enter_location
    final_appointment.enter_notes
    navigation.submit

    expect(active_participants).to_not be_visible
  end

  it 'creates a final appointment' do
    scroll_by('2000')
    active_participants.create_contact_for('341')
    final_appointment.assert_on_page
    active_participants.record_time
    final_appointment.enter_location
    final_appointment.enter_notes
    final_appointment.choose_phone_returned
    navigation.submit

    expect(final_appointment).to be_created_for_participant('341')

    # check profile page for completeness
    scroll_by('2000')
    profile.go_to_profile_of('Last-341, First')
    expect(profile).to have_final_appointment_information

    # check reports page for notes
  end

  it 'edits first contact from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    profile.edit_session('First Contact')
    first_contact.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  it 'edits first appointment from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    sleep(1)
    scroll_by('100')
    profile.edit_session('First Appointment')
    first_appointment.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  it 'edits second contact from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    profile.edit_session('Second Contact')
    second_contact.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  it 'edits third contact from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-343, First')
    profile.edit_session('Third Contact')
    third_contact.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end

  it 'edits final appointment from profile page' do
    scroll_by('2000')
    profile.go_to_profile_of('Last-342, First')
    profile.edit_session('Final Appointment')
    final_appointment.assert_on_page
    navigation.submit

    expect(active_participants).to be_visible
  end
end
