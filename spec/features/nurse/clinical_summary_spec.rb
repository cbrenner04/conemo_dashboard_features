# filename: ./spec/features/nurse/clinical_summary_spec.rb

require './spec/support/nurse/clinical_summary_helper'

feature 'Nurse, Clinical Summary', metadata: :first do
  scenario 'Nurse sees lesson #, release dates, titles' do
    english_nurse.sign_in
    pt_300_nurse_tasks.open
    pt_300_clinical_summary.open

    expect(pt_300_clinical_summary).to have_lesson_table_content
  end
end

feature 'Nurse, Clinical Summary', metadata: :not_first do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participant id and name in header' do
    pt_343_nurse_tasks.open
    pt_343_clinical_summary.open

    expect(pt_343_clinical_summary).to be_visible
    expect(pt_343_nurse_tasks).to have_participant_in_header
  end

  scenario 'Nurse sees key' do
    pt_343_nurse_tasks.open
    pt_343_clinical_summary.open

    expect(pt_343_clinical_summary).to be_visible
    expect(pt_343_clinical_summary).to have_legend
  end

  scenario 'Nurse sees correct messages & logins' do
    pt_343_nurse_tasks.open
    pt_343_clinical_summary.open

    expect(pt_343_clinical_summary).to have_messages

    clinical_summary.show_number_of_logins

    expect(pt_343_clinical_summary).to have_correct_logins
  end

  scenario 'Nurse creates and deletes a note' do
    pt_300_nurse_tasks.open
    pt_300_clinical_summary.open
    pt_300_notes_form.open
    pt_300_notes_form.create_note

    expect(pt_300_clinical_summary).to have_note

    pt_300_clinical_summary.delete_note

    expect(pt_300_clinical_summary).to_not have_note
  end

  scenario 'Nurse sees current lesson (1st) highlighted' do
    pt_300_nurse_tasks.open
    pt_300_clinical_summary.open

    expect(pt_300_clinical_summary).to have_current_lesson
  end

  scenario 'Nurse sees current lesson (2nd) highlighted & 1st lesson missed' do
    pt_401_nurse_tasks.open
    pt_401_clinical_summary.open

    expect(pt_401_clinical_summary).to have_current_lesson
    expect(pt_401_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (3rd) highlighted & 2nd lesson missed' do
    pt_312_nurse_tasks.open
    pt_312_clinical_summary.open

    expect(pt_312_clinical_summary).to have_current_lesson
    expect(pt_312_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (4th) highlighted & 3rd lesson missed' do
    pt_410_nurse_tasks.open
    pt_410_clinical_summary.open

    expect(pt_410_clinical_summary).to have_current_lesson

    expect(pt_410_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (5th) highlighted & 4th lesson missed' do
    pt_323_nurse_tasks.open
    pt_323_clinical_summary.open

    expect(pt_323_clinical_summary).to have_current_lesson
    expect(pt_323_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (6th) highlighted & 5th lesson missed' do
    pt_420_nurse_tasks.open
    pt_420_clinical_summary.open

    expect(pt_420_clinical_summary).to have_current_lesson
    expect(pt_420_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (7th) highlighted & 6th lesson missed' do
    pt_430_nurse_tasks.open
    pt_430_clinical_summary.open

    expect(pt_430_clinical_summary).to have_current_lesson

    expect(pt_430_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (8th) highlighted & 7th lesson missed' do
    pt_440_nurse_tasks.open
    pt_440_clinical_summary.open

    expect(pt_440_clinical_summary).to have_current_lesson
    expect(pt_440_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (9th) highlighted & 8th lesson missed' do
    pt_450_nurse_tasks.open
    pt_450_clinical_summary.open

    expect(pt_450_clinical_summary).to have_current_lesson
    expect(pt_450_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (10th) highlighted & 9th lesson missed' do
    pt_460_nurse_tasks.open
    pt_460_clinical_summary.open

    expect(pt_460_clinical_summary).to have_current_lesson
    expect(pt_460_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees participant completed the 1st lesson late' do
    pt_411_nurse_tasks.open
    pt_411_clinical_summary.open

    expect(pt_411_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 2nd lesson late' do
    pt_324_nurse_tasks.open
    pt_324_clinical_summary.open

    expect(pt_324_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 3rd lesson late' do
    pt_428_nurse_tasks.open
    pt_428_clinical_summary.open

    expect(pt_428_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 4th lesson late' do
    pt_431_nurse_tasks.open
    pt_431_clinical_summary.open

    expect(pt_431_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 5th lesson late' do
    pt_441_nurse_tasks.open
    pt_441_clinical_summary.open

    expect(pt_441_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 6th lesson late' do
    pt_451_nurse_tasks.open
    pt_451_clinical_summary.open

    expect(pt_451_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 7th lesson late' do
    pt_461_nurse_tasks.open
    pt_461_clinical_summary.open

    expect(pt_461_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 8th lesson late' do
    pt_471_nurse_tasks.open
    pt_471_clinical_summary.open

    expect(pt_471_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 9th lesson late' do
    pt_480_nurse_tasks.open
    pt_480_clinical_summary.open

    expect(pt_480_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 10th lesson late' do
    pt_490_nurse_tasks.open
    pt_490_clinical_summary.open

    expect(pt_490_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 1st lesson late' do
    pt_324_nurse_tasks.open
    pt_324_clinical_summary.open

    expect(pt_324_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 2nd lesson late' do
    pt_428_nurse_tasks.open
    pt_428_clinical_summary.open

    expect(pt_428_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 3rd lesson late' do
    pt_431_nurse_tasks.open
    pt_431_clinical_summary.open

    expect(pt_431_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 4th lesson late' do
    pt_441_nurse_tasks.open
    pt_441_clinical_summary.open

    expect(pt_441_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 5th lesson late' do
    pt_451_nurse_tasks.open
    pt_451_clinical_summary.open

    expect(pt_451_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 6th lesson late' do
    pt_461_nurse_tasks.open
    pt_461_clinical_summary.open

    expect(pt_461_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 7th lesson late' do
    pt_471_nurse_tasks.open
    pt_471_clinical_summary.open

    expect(pt_471_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 8th lesson late' do
    pt_480_nurse_tasks.open
    pt_480_clinical_summary.open

    expect(pt_480_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 9th lesson late' do
    pt_490_nurse_tasks.open
    pt_490_clinical_summary.open

    expect(pt_490_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 10th lesson late' do
    pt_700_nurse_tasks.open
    pt_700_clinical_summary.open

    expect(pt_700_clinical_summary).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 1st lesson on time' do
    pt_400_nurse_tasks.open
    pt_400_clinical_summary.open

    expect(pt_400_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 2nd lesson on time' do
    pt_317_nurse_tasks.open
    pt_317_clinical_summary.open

    expect(pt_317_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 3rd lesson on time' do
    pt_412_nurse_tasks.open
    pt_412_clinical_summary.open

    expect(pt_412_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 4th lesson on time' do
    pt_326_nurse_tasks.open
    pt_326_clinical_summary.open

    expect(pt_326_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 5th lesson on time' do
    pt_422_nurse_tasks.open
    pt_422_clinical_summary.open

    expect(pt_422_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 6th lesson on time' do
    pt_432_nurse_tasks.open
    pt_432_clinical_summary.open

    expect(pt_432_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 7th lesson on time' do
    pt_442_nurse_tasks.open
    pt_442_clinical_summary.open

    expect(pt_442_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 8th lesson on time' do
    pt_452_nurse_tasks.open
    pt_452_clinical_summary.open

    expect(pt_452_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 9th lesson on time' do
    pt_462_nurse_tasks.open
    pt_462_clinical_summary.open

    expect(pt_462_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 10th lesson on time' do
    pt_472_nurse_tasks.open
    pt_472_clinical_summary.open

    expect(pt_472_clinical_summary).to have_ontime_lesson
  end
end

feature 'Spanish Nurse, Clinical Summary' do
  scenario 'Spanish nurse sees correct translations' do
    spanish_nurse.sign_in
    pt_500_nurse_tasks.open
    pt_500_clinical_summary.open

    expect(pt_500_clinical_summary).to have_links
    expect(pt_500_clinical_summary).to have_headers
    expect(pt_500_clinical_summary).to have_legend
    expect(pt_500_clinical_summary).to have_notes_headers
    expect(pt_500_clinical_summary).to have_lesson_release_dates
    expect(pt_500_clinical_summary).to have_contact_dates
    expect(pt_500_clinical_summary).to have_messages_title

    pt_500_clinical_summary.read_help_message

    expect(pt_500_clinical_summary).to have_read_message_alert

    pt_500_notes_form.open

    expect(pt_500_notes_form).to have_form_heading
    expect(pt_500_notes_form).to have_form_labels
    expect(pt_500_notes_form).to have_notes_headers
    expect(pt_500_notes_form).to have_contact_dates

    pt_500_notes_form.create_note

    expect(pt_500_clinical_summary).to have_note
  end
end

feature 'Portuguese Nurse, Clinical Summary' do
  scenario 'Portuguese nurse sees correct translations' do
    portuguese_nurse.sign_in
    pt_600_nurse_tasks.open
    pt_600_clinical_summary.open

    expect(pt_600_clinical_summary).to have_links
    expect(pt_600_clinical_summary).to have_headers
    expect(pt_600_clinical_summary).to have_legend
    expect(pt_600_clinical_summary).to have_notes_headers
    expect(pt_600_clinical_summary).to have_lesson_release_dates
    expect(pt_600_clinical_summary).to have_contact_dates
    expect(pt_600_clinical_summary).to have_messages_title

    pt_600_clinical_summary.read_help_message

    expect(pt_600_clinical_summary).to have_read_message_alert

    pt_600_notes_form.open

    expect(pt_600_notes_form).to have_form_heading
    expect(pt_600_notes_form).to have_form_labels
    expect(pt_600_notes_form).to have_notes_headers
    expect(pt_600_notes_form).to have_contact_dates

    pt_600_notes_form.create_note

    expect(pt_600_clinical_summary).to have_note
  end
end
