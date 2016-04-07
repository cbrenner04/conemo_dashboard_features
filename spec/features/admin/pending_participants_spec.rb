# filename: ./spec/features/pending_participants_spec.rb

require './spec/support/admin/pending_participants_helper'

feature 'Admin, Pending Participants', metadata: :not_first do
  background do
    english_admin.sign_in
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
    new_participant_contact_information.select_health_unit
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without filling in last name' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.select_health_unit
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without filling in study id' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.select_health_unit
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a pt wo selecting family health unit' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without filling in address' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Cannot create wo contact person when alt phone 1 specified' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.fill_in_alt_phone_1
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Cannot create wo contact person 2 when alt phone 2 specified' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.fill_in_address
    new_participant_contact_information.fill_in_alt_phone_2
    new_participant_contact_information.choose_gender
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin cannot create a participant without choosing gender' do
    pending_participants.create
    new_participant_contact_information.fill_in_first_name
    new_participant_contact_information.fill_in_last_name
    new_participant_contact_information.fill_in_study_id
    new_participant_contact_information.select_health_unit
    new_participant_contact_information.fill_in_address
    navigation.submit

    expect(pending_participants).to_not have_landing_page_visible

    expect(contact_information).to have_form_visible
  end

  scenario 'Admin can create a participant' do
    pending_participants.create
    new_participant_contact_information.complete_form
    navigation.submit

    expect(jane_doe).to be_visible
  end

  scenario 'Admin activates a participant' do
    # creating a participant so config token is auto-generated
    pending_participants.create
    participant_2000_contact_information.complete_form
    navigation.submit
    participant_2000.activate

    expect(participant_2000).to be_activated

    expect(participant_2000).to_not be_visible

    # check supervisor page for existence of participant
    english_admin.sign_out
    english_supervisor.sign_in

    expect(nurse_supervisor_8).to have_patient
  end

  scenario 'Admin edits pending participant\'s information' do
    participant_102.select_edit

    expect(contact_information).to have_form_visible
  end
end

feature 'Spanish Admin, Pending Participants' do
  scenario 'Spanish admin sees correct translations' do
    spanish_admin.sign_in
    spanish_pending_participants.open

    expect(spanish_pending_participants).to have_landing_page_visible

    spanish_pending_participants.create

    expect(spanish_contact_information).to have_form_fields

    expect(spanish_contact_information).to have_health_unit_options

    expect(spanish_contact_information).to have_relationship_options

    expect(spanish_contact_information).to have_gender_options

    navigation.cancel

    expect(spanish_pending_participants).to have_pending_table_headers

    participant_2001.activate

    expect(spanish_pending_participants).to be_activated
  end
end

feature 'Portuguese Admin, Pending Participants', metadata: :not_first do
  scenario 'Portuguese admin sees correct translations' do
    portuguese_admin.sign_in
    portuguese_pending_participants.open

    expect(portuguese_pending_participants).to have_landing_page_visible

    portuguese_pending_participants.create

    expect(portuguese_contact_information).to have_form_fields

    expect(portuguese_contact_information).to have_health_unit_options

    expect(portuguese_contact_information).to have_relationship_options

    expect(portuguese_contact_information).to have_gender_options

    navigation.cancel

    expect(portuguese_pending_participants).to have_pending_table_headers

    participant_3000.activate

    expect(portuguese_pending_participants).to be_activated
  end
end
