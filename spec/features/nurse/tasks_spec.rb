# filename: ./spec/features/nurse/tasks_spec.rb

require './spec/support/nurse/tasks_helper'

feature 'Nurse, Participant Tasks' do
  background { english_nurse.sign_in }

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

    scenario 'Nurse creates additional contact' do
      pt_451_nurse_tasks.open
      additional_contact.create

      expect(pt_451_nurse_tasks).to have_no_tasks_in_count

      # check contact information for completed task
      contact_information.open

      expect(contact_information).to have_additional_contact
    end
  end
end
