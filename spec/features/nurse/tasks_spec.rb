# filename: ./spec/features/nurse/tasks_spec.rb

require './spec/support/nurse/tasks_helper'

feature 'Nurse, Participant Tasks', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participant id and name in header' do
    pt_1000_nurse_tasks.open

    expect(pt_1000_nurse_tasks).to have_participant_in_header
  end

  scenario 'Nurse sees correct task count with multiple due' do
    pt_1000_nurse_tasks.open

    expect(pt_1000_nurse_tasks).to have_multiple_tasks_in_count
  end

  scenario 'Nurse sees empty progress bar' do
    pt_300_nurse_tasks.open

    expect(pt_300_nurse_tasks).to have_nothing_in_progress_bar
  end

  feature 'Nurse, Additional Contact' do
    scenario 'Nurse cancels creation of additional contact form' do
      pt_451_nurse_tasks.open
      additional_contact.open
      navigation.cancel

      expect(pt_451_nurse_tasks).to have_no_tasks_in_count
    end

    scenario 'Nurse creates phone additional contact' do
      pt_451_nurse_tasks.open
      additional_contact.create_for_call

      expect(pt_451_nurse_tasks).to have_no_tasks_in_count

      # check contact information for completed task
      contact_information.open

      expect(contact_information).to have_phone_additional_contact
    end

    scenario 'Nurse creates in person additional contact' do
      pt_313_nurse_tasks.open
      additional_contact.create_for_in_person

      # check contact information for completed task
      contact_information.open

      expect(contact_information).to have_in_person_additional_contact
    end
  end
end
