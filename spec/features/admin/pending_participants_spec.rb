# filename: ./spec/features/pending_participants_spec.rb

require './spec/support/admin/pending_participants_helper'

feature 'Admin, Pending Participants' do
  background do
    english_admin.sign_in
    navigation.switch_to_english
    pending_participants.open
  end

  scenario 'Admin can cancel creation form' do
    pending_participants.create
    navigation.cancel

    expect(pending_participants).to have_landing_page_visible
  end

  scenario 'Admin cannot create a participant without filling in first name' do
    pending_participants.create
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_health_unit
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_phone
    new_participant_contact_information.fill_in_emergency_contact_name
    new_participant_contact_information.fill_in_emergency_contact_phone
    new_participant_contact_information.fill_in_email
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.select_dob
    new_participant_contact_information.select_enrollment_date
    new_participant_contact_information.choose_gender
    new_participant_contact_information.choose_chronic_disorder
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible
    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without filling in last name' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_health_unit
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_phone
    new_participant_contact_information.fill_in_emergency_contact_name
    new_participant_contact_information.fill_in_emergency_contact_phone
    new_participant_contact_information.fill_in_email
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.select_dob
    new_participant_contact_information.select_enrollment_date
    new_participant_contact_information.choose_gender
    new_participant_contact_information.choose_chronic_disorder
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible
    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without filling in study id' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_health_unit
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_phone
    new_participant_contact_information.fill_in_emergency_contact_name
    new_participant_contact_information.fill_in_emergency_contact_phone
    new_participant_contact_information.fill_in_email
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.select_dob
    new_participant_contact_information.select_enrollment_date
    new_participant_contact_information.choose_gender
    new_participant_contact_information.choose_chronic_disorder
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible
    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a pt wo filling in family health unit' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_phone
    new_participant_contact_information.fill_in_emergency_contact_name
    new_participant_contact_information.fill_in_emergency_contact_phone
    new_participant_contact_information.fill_in_email
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.select_dob
    new_participant_contact_information.select_enrollment_date
    new_participant_contact_information.choose_gender
    new_participant_contact_information.choose_chronic_disorder
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible
    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without filling in phone' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_health_unit
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_emergency_contact_name
    new_participant_contact_information.fill_in_emergency_contact_phone
    new_participant_contact_information.fill_in_email
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.select_dob
    new_participant_contact_information.select_enrollment_date
    new_participant_contact_information.choose_gender
    new_participant_contact_information.choose_chronic_disorder
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible
    expect(contact_information).to have_form_visible
  end

  # useless as there is a default value in the form
  # scenario 'Admin cannot create a participant  wo filling in date of birth' do
  #   pending_participants.create
  #   new_participant_contact_information.fill_in_first_name
  #   new_participant_contact_information.fill_in_last_name
  #   new_participant_contact_information.fill_in_study_id
  #   new_participant_contact_information.fill_in_health_unit
  #   new_participant_contact_information.fill_in_family_record
  #   new_participant_contact_information.fill_in_phone
  #   new_participant_contact_information.fill_in_emergency_contact_name
  #   new_participant_contact_information.fill_in_emergency_contact_phone
  #   new_participant_contact_information.fill_in_email
  #   new_participant_contact_information.fill_in_address
  #   new_participant_contact_information.select_enrollment_date
  #   new_participant_contact_information.choose_gender
  #   new_participant_contact_information.choose_chronic_disorder
  #   navigation.submit

  #   expect(pending_participants).to_not have_landing_page_visible
  #   expect(contact_information).to have_form_visible
  # end

  # useless as there is a default value in the form
  # scenario 'Admin cannot create a pt wo filling in enrollment date' do
  #   pending_participants.create
  #   new_participant_contact_information.fill_in_first_name
  #   new_participant_contact_information.fill_in_last_name
  #   new_participant_contact_information.fill_in_study_id
  #   new_participant_contact_information.fill_in_health_unit
  #   new_participant_contact_information.fill_in_family_record
  #   new_participant_contact_information.fill_in_phone
  #   new_participant_contact_information.fill_in_emergency_contact_name
  #   new_participant_contact_information.fill_in_emergency_contact_phone
  #   new_participant_contact_information.fill_in_email
  #   new_participant_contact_information.fill_in_address
  #   new_participant_contact_information.select_dob
  #   new_participant_contact_information.choose_gender
  #   new_participant_contact_information.choose_chronic_disorder
  #   navigation.submit

  #   expect(pending_participants).to_not have_landing_page_visible
  #   expect(contact_information).to have_form_visible
  # end

  scenario 'Admin cannot create a participant without choosing gender' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_health_unit
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_phone
    new_participant_contact_information.fill_in_emergency_contact_name
    new_participant_contact_information.fill_in_emergency_contact_phone
    new_participant_contact_information.fill_in_email
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.select_dob
    new_participant_contact_information.choose_chronic_disorder
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible
    expect(contact_information).to have_form_visible
  end

  scenario 'Admin can create a participant wo filling in the optional fields' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_health_unit
    new_participant_contact_information.fill_in_family_record
    new_participant_contact_information.fill_in_phone
    new_participant_contact_information.select_dob
    new_participant_contact_information.select_enrollment_date
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(jane_doe).to be_visible
  end

  scenario 'Admin activates a participant' do
    participant_100.activate
    participant_100.assign_nurse

    expect(participant_100).to_not be_visible

    # check for configuration token
  end

  scenario 'Admin disqualifies a participant' do
    participant_101.disqualify
    participant_101.confirm_disqualify

    expect(participant_101).to_not be_visible

    participant_101.select_ineligible_tab

    expect(participant_101).to be_visible
  end

  scenario 'Admin activates a participant who was previously disqualified' do
    participant_200.select_ineligible_tab
    participant_200.activate
    participant_200.assign_nurse

    expect(participant_200).to_not be_visible
  end

  scenario 'Admin edits pending participant\'s information' do
    participant_102.select_edit

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin edits ineligible participant\'s information' do
    participant_201.select_ineligible_tab
    participant_201.select_edit

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin visits Spanish Pending Participants,' \
     'does not see English participants, sees forms in Spanish'

  scenario 'Admin visits Portuguese Pending Participants,' \
     'does not see English participants, sees forms in Portuguese'
end
