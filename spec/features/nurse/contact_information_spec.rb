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
    pt_301_nurse_tasks.return

    expect(pt_301_contact_info).to be_visible
  end

  scenario 'Nurse edits participant information' do
    pt_301_nurse_tasks.open
    pt_301_contact_info.select_edit_contact_information
    navigation.submit
    pt_301_nurse_tasks.return

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
  scenario 'Spanish nurse sees correct translations' do
    spanish_nurse.sign_in
    pt_500_nurse_tasks.open

    expect(pt_500_contact_info).to have_contact_information_title
    # # not yet implemented
    # expect(pt_500_contact_info).to have_contact_information_table_headings
    expect(pt_500_contact_info).to have_smartphone_information_title
  end
end

feature 'Portuguese Nurse, Contact Information', metadata: :not_first do
  scenario 'Portuguese nurse sees correct translations' do
    portuguese_nurse.sign_in
    pt_600_nurse_tasks.open

    expect(pt_600_contact_info).to have_contact_information_title
    # # not yet implemented
    # expect(pt_600_contact_info).to have_contact_information_table_headings
    expect(pt_600_contact_info).to have_smartphone_information_title
  end
end
