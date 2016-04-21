# filename: ./spec/features/nurse/contact_information_spec.rb

require './spec/support/nurse/contact_information_helper'

feature 'Nurse, Contact Information', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participant contact information' do
    pt_300_nurse_tasks.open

    expect(pt_300_contact_info).to be_visible
  end

  scenario 'Nurse cancels out of edit of participant information' do
    pt_301_nurse_tasks.open
    pt_301_contact_info.select_edit_contact_information
    sleep(0.25)
    navigation.cancel

    expect(pt_301_contact_info).to be_visible
  end

  scenario 'Nurse edits participant information' do
    pt_301_nurse_tasks.open
    pt_301_contact_info.select_edit_contact_information
    navigation.submit

    expect(pt_301_contact_info).to be_visible
  end

  scenario 'Nurse cancels out of edit of smartphone information' do
    pt_310_nurse_tasks.open
    pt_310_contact_info.select_edit_smartphone_information
    navigation.cancel

    expect(pt_310_contact_info).to be_visible
    expect(pt_310_contact_info).to_not have_smartphone_information
  end

  scenario 'Nurse enters smartphone information' do
    pt_302_nurse_tasks.open
    pt_302_contact_info.select_edit_smartphone_information
    pt_302_contact_info.enter_smartphone_number
    pt_302_contact_info.enter_phone_id
    navigation.submit

    expect(pt_302_contact_info).to have_smartphone_information
  end
end

feature 'Spanish Nurse, Contact Information', metadata: :not_first do
  background { spanish_nurse.sign_in }

  scenario 'Spanish nurse sees correct translations' do
    pt_500_nurse_tasks.open

    expect(pt_500_contact_info).to have_contact_information_title
    expect(pt_500_contact_info).to have_contact_information_table_headings
    expect(pt_500_contact_info).to have_smartphone_information_title
    expect(pt_500_contact_info).to have_smartphone_sub_headings

    pt_500_contact_info.select_edit_contact_information
    spanish_navigation.submit

    expect(pt_500_contact_info).to have_saved_contact_information_alert
  end

  scenario 'Spanish Nurse creates a smartphone' do
    pt_504_nurse_tasks.open
    pt_504_contact_info.select_edit_smartphone_information
    pt_504_contact_info.enter_smartphone_number
    pt_504_contact_info.enter_phone_id
    spanish_navigation.submit

    expect(pt_504_contact_info).to have_successful_smartphone_creation_alert
  end
end

feature 'Portuguese Nurse, Contact Information', metadata: :not_first do
  background { portuguese_nurse.sign_in }

  scenario 'Portuguese nurse sees correct translations' do
    pt_600_nurse_tasks.open

    expect(pt_600_contact_info).to have_contact_information_title
    expect(pt_600_contact_info).to have_contact_information_table_headings
    expect(pt_600_contact_info).to have_smartphone_information_title
    expect(pt_600_contact_info).to have_smartphone_sub_headings

    pt_600_contact_info.select_edit_contact_information
    portuguese_navigation.submit

    expect(pt_600_contact_info).to have_saved_contact_information_alert
  end

  scenario 'Spanish Nurse creates a smartphone' do
    pt_604_nurse_tasks.open
    pt_604_contact_info.select_edit_smartphone_information
    pt_604_contact_info.enter_smartphone_number
    pt_604_contact_info.enter_phone_id
    portuguese_navigation.submit

    expect(pt_604_contact_info).to have_successful_smartphone_creation_alert
  end
end
