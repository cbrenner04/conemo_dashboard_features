# frozen_string_literal: true
# filename: ./spec/features/nurse/clinical_summary_spec.rb

require './spec/support/nurse/clinical_summary_helper'

feature 'Nurse, Clinical Summary', metadata: :first do
  scenario 'Nurse sees lesson #, release dates, titles' do
    english_nurse.sign_in
    pt_300_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_300_lessons_table).to have_lesson_table_content
  end

  scenario 'Spanish nurse sees correct status for lesson' do
    spanish_nurse.sign_in
    pt_516_nurse_tasks.open
    pt_516_clinical_summary.open

    expect(pt_516_clinical_summary).to be_visible
    expect(pt_516_ontime_lesson).to have_ontime_lesson
    expect(pt_516_late_lesson).to have_late_lesson
    expect(pt_516_incomplete_lesson).to have_incomplete_late_lesson
    expect(pt_516_unread_lesson).to have_unread_lesson
  end

  scenario 'Nurse sees correct number of non-connectivity symbols' do
    english_nurse.sign_in
    pt_318_nurse_tasks.open
    pt_318_clinical_summary.open

    expect(pt_318_clinical_summary).to have_last_seen_timestamp
    expect(pt_318_clinical_summary)
      .to have_one_non_connectivity_icon_in_current_lesson

    navigation.return_home
    pt_319_nurse_tasks.open
    pt_319_clinical_summary.open

    expect(pt_319_clinical_summary).to have_last_seen_timestamp
    expect(pt_319_clinical_summary).to have_no_non_connectivity_icon

    navigation.return_home
    pt_1000_nurse_tasks.open
    pt_1000_clinical_summary.open

    expect(pt_1000_clinical_summary).to have_last_seen_timestamp
    expect(pt_1000_clinical_summary).to have_three_non_connectivity_icons
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

    expect(pt_343_clinical_summary).to have_legend
  end

  scenario 'Nurse creates and deletes a note' do
    pt_300_nurse_tasks.open
    clinical_summary.open
    pt_300_notes.open_form
    pt_300_notes.create_note

    expect(pt_300_notes).to have_note

    pt_300_notes.delete_note

    expect(pt_300_notes).to_not have_note
  end

  scenario 'Nurse sees current lesson (1st) highlighted' do
    pt_300_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_300_lessons_table).to have_current_lesson
  end

  scenario 'Nurse sees current lesson (2nd) highlighted & 1st lesson missed' do
    pt_401_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_401_lessons_table).to have_current_lesson
    expect(pt_401_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (3rd) highlighted & 2nd lesson missed' do
    pt_312_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_312_lessons_table).to have_current_lesson
    expect(pt_312_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (4th) highlighted & 3rd lesson missed' do
    pt_410_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_410_lessons_table).to have_current_lesson
    expect(pt_410_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (5th) highlighted & 4th lesson missed' do
    pt_323_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_323_lessons_table).to have_current_lesson
    expect(pt_323_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (6th) highlighted & 5th lesson missed' do
    pt_420_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_420_lessons_table).to have_current_lesson
    expect(pt_420_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (7th) highlighted & 6th lesson missed' do
    pt_430_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_430_lessons_table).to have_current_lesson
    expect(pt_430_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (8th) highlighted & 7th lesson missed' do
    pt_440_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_440_lessons_table).to have_current_lesson
    expect(pt_440_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (9th) highlighted & 8th lesson missed' do
    pt_450_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_450_lessons_table).to have_current_lesson
    expect(pt_450_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (10th) highlighted & 9th lesson missed' do
    pt_460_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_460_lessons_table).to have_current_lesson
    expect(pt_460_lessons_table).to have_unread_lesson
  end

  scenario 'Nurse sees participant completed the 1st lesson late' do
    pt_411_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_411_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 2nd lesson late' do
    pt_324_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_324_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 3rd lesson late' do
    pt_428_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_428_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 4th lesson late' do
    pt_431_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_431_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 5th lesson late' do
    pt_441_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_441_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 6th lesson late' do
    pt_451_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_451_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 7th lesson late' do
    pt_461_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_461_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 8th lesson late' do
    pt_471_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_471_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 9th lesson late' do
    pt_480_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_480_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant completed the 10th lesson late' do
    pt_490_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_490_lessons_table).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 1st lesson late' do
    pt_324_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_324_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 2nd lesson late' do
    pt_428_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_428_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 3rd lesson late' do
    pt_431_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_431_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 4th lesson late' do
    pt_441_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_441_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 5th lesson late' do
    pt_451_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_451_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 6th lesson late' do
    pt_461_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_461_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 7th lesson late' do
    pt_471_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_471_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 8th lesson late' do
    pt_480_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_480_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 9th lesson late' do
    pt_490_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_490_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 10th lesson late' do
    pt_700_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_700_lessons_table).to have_incomplete_late_lesson
  end

  scenario 'Nurse sees participant accessed the 1st lesson on time' do
    pt_400_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_400_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 2nd lesson on time' do
    pt_317_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_317_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 3rd lesson on time' do
    pt_412_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_412_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 4th lesson on time' do
    pt_326_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_326_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 5th lesson on time' do
    pt_422_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_422_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 6th lesson on time' do
    pt_432_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_432_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 7th lesson on time' do
    pt_442_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_442_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 8th lesson on time' do
    pt_452_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_452_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 9th lesson on time' do
    pt_462_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_462_lessons_table).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 10th lesson on time' do
    pt_472_nurse_tasks.open
    clinical_summary.open

    expect(clinical_summary).to be_visible
    expect(pt_472_lessons_table).to have_ontime_lesson
  end
end

feature 'Spanish Nurse, Clinical Summary', metadata: :very_first do
  scenario 'Spanish nurse sees correct translations' do
    spanish_nurse.sign_in
    pt_500_nurse_tasks.open
    pt_500_clinical_summary.open

    expect(pt_500_clinical_summary).to have_last_seen_timestamp
    expect(pt_500_clinical_summary).to have_headers
    expect(pt_500_clinical_summary).to have_legend
    expect(pt_500_notes).to have_notes_headers
    expect(pt_500_notes).to have_contact_dates
    expect(pt_500_lessons_table).to have_lesson_release_dates

    pt_500_notes.open_form

    expect(pt_500_notes).to have_form_heading
    expect(pt_500_notes).to have_form_labels
    expect(pt_500_notes).to have_notes_headers
    expect(pt_500_notes).to have_contact_dates

    pt_500_notes.create_note

    expect(pt_500_notes).to have_note
  end
end

feature 'Portuguese Nurse, Clinical Summary', metadata: :very_first do
  scenario 'Portuguese nurse sees correct translations' do
    portuguese_nurse.sign_in
    pt_600_nurse_tasks.open
    pt_600_clinical_summary.open

    expect(pt_600_clinical_summary).to have_last_seen_timestamp
    expect(pt_600_clinical_summary).to have_headers
    expect(pt_600_clinical_summary).to have_legend
    expect(pt_600_notes).to have_notes_headers
    expect(pt_600_notes).to have_contact_dates
    expect(pt_600_lessons_table).to have_lesson_release_dates

    pt_600_notes.open_form

    expect(pt_600_notes).to have_form_heading
    expect(pt_600_notes).to have_form_labels
    expect(pt_600_notes).to have_notes_headers
    expect(pt_600_notes).to have_contact_dates

    pt_600_notes.create_note

    expect(pt_600_notes).to have_note
  end
end
