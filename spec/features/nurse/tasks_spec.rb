# frozen_string_literal: true
# filename: ./spec/features/nurse/tasks_spec.rb

require './spec/support/nurse/tasks_helper'

feature 'Nurse, Participant Tasks', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participant id and name in header' do
    pt_1000_nurse_tasks.open

    expect(pt_1000_nurse_tasks).to have_participant_in_header
  end

  scenario 'Nurse sees key' do
    pt_1000_nurse_tasks.open

    expect(pt_1000_nurse_tasks).to have_key
  end

  scenario 'Nurse sees correct task count with multiple due' do
    pt_1000_nurse_tasks.open

    expect(pt_1000_nurse_tasks).to have_multiple_tasks_in_count
  end

  scenario 'Nurse sees empty progress bar' do
    pt_300_nurse_tasks.open

    expect(pt_300_nurse_tasks).to have_empty_progress_bar
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

      # check timeline for completed task
      timeline.open

      expect(timeline).to have_phone_additional_contact
    end

    scenario 'Nurse creates in person additional contact' do
      pt_313_nurse_tasks.open
      additional_contact.create_for_in_person

      # check contact information for completed task
      timeline.open

      expect(timeline).to have_in_person_additional_contact
    end
  end
end

feature 'Spanish Nurse, Tasks' do
  background { spanish_nurse.sign_in }

  scenario 'Spanish Nurse sees section headings and key' do
    pt_500_nurse_tasks.open
    expect(pt_500_nurse_tasks).to have_progress_bar_heading
    expect(pt_500_nurse_tasks).to have_tasks_heading
    expect(pt_500_nurse_tasks).to have_key
  end

  scenario 'Spanish Nurse creates an additional contact' do
    pt_504_nurse_tasks.open
    spanish_additional_contact.create_for_call

    expect(pt_500_nurse_tasks).to have_additional_contact_alert
  end
end

feature 'Portuguese Nurse, Tasks' do
  background { portuguese_nurse.sign_in }

  scenario 'Portuguese Nurse sees section headings and key' do
    pt_600_nurse_tasks.open
    expect(pt_600_nurse_tasks).to have_progress_bar_heading
    expect(pt_600_nurse_tasks).to have_tasks_heading
    expect(pt_600_nurse_tasks).to have_key
  end

  scenario 'Portuguese Nurse creates an additional contact' do
    pt_604_nurse_tasks.open
    portuguese_additional_contact.create_for_call

    expect(pt_600_nurse_tasks).to have_additional_contact_alert
  end
end
