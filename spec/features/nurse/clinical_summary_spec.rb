# filename: ./spec/features/nurse/clinical_summary_spec.rb

require './spec/support/nurse/clinical_summary_helper'

feature 'Nurse, Clinical Summary' do
  background do
    english_nurse.sign_in
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
    pt_300_clinical_summary.create_note

    expect(pt_300_clinical_summary).to have_note

    pt_300_clinical_summary.delete_note

    expect(pt_300_clinical_summary).to_not have_note
  end

  scenario 'Nurse sees lesson numbers, release dates, titles' do
    2.times { navigation.scroll_down }
    pt_300_nurse_tasks.open
    pt_300_clinical_summary.open

    expect(pt_300_clinical_summary).to have_lesson_table_content
  end

  scenario 'Nurse sees current lesson (1st) highlighted' do
    2.times { navigation.scroll_down }
    pt_300_nurse_tasks.open
    pt_300_clinical_summary.open

    expect(pt_300_clinical_summary).to have_current_lesson
  end

  scenario 'Nurse sees current lesson (2nd) highlighted & 1st lesson missed' do
    2.times { navigation.scroll_down }
    pt_401_nurse_tasks.open
    pt_401_clinical_summary.open

    expect(pt_401_clinical_summary).to have_current_lesson

    expect(pt_401_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (3rd) highlighted & 2nd lesson missed' do
    navigation.scroll_down
    pt_312_nurse_tasks.open
    pt_312_clinical_summary.open

    expect(pt_312_clinical_summary).to have_current_lesson

    expect(pt_312_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (4th) highlighted & 3rd lesson missed' do
    2.times { navigation.scroll_down }
    pt_410_nurse_tasks.open
    pt_410_clinical_summary.open

    expect(pt_410_clinical_summary).to have_current_lesson

    expect(pt_410_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (5th) highlighted & 4th lesson missed' do
    navigation.scroll_down
    pt_323_nurse_tasks.open
    pt_323_clinical_summary.open

    expect(pt_323_clinical_summary).to have_current_lesson

    expect(pt_323_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (6th) highlighted & 5th lesson missed' do
    2.times { navigation.scroll_down }
    pt_420_nurse_tasks.open
    pt_420_clinical_summary.open

    expect(pt_420_clinical_summary).to have_current_lesson

    expect(pt_420_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (7th) highlighted & 6th lesson missed' do
    2.times { navigation.scroll_down }
    pt_430_nurse_tasks.open
    pt_430_clinical_summary.open

    expect(pt_430_clinical_summary).to have_current_lesson

    expect(pt_430_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (8th) highlighted & 7th lesson missed' do
    2.times { navigation.scroll_down }
    pt_440_nurse_tasks.open
    pt_440_clinical_summary.open

    expect(pt_440_clinical_summary).to have_current_lesson

    expect(pt_440_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (9th) highlighted & 8th lesson missed' do
    2.times { navigation.scroll_down }
    pt_450_nurse_tasks.open
    pt_450_clinical_summary.open

    expect(pt_450_clinical_summary).to have_current_lesson

    expect(pt_450_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees current lesson (10th) highlighted & 9th lesson missed' do
    2.times { navigation.scroll_down }
    pt_460_nurse_tasks.open
    pt_460_clinical_summary.open

    expect(pt_460_clinical_summary).to have_current_lesson

    expect(pt_460_clinical_summary).to have_unread_lesson
  end

  scenario 'Nurse sees participant accessed the 1st lesson late' do
    2.times { navigation.scroll_down }
    pt_411_nurse_tasks.open
    pt_411_clinical_summary.open

    expect(pt_411_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 2nd lesson late' do
    navigation.scroll_down
    pt_324_nurse_tasks.open
    pt_324_clinical_summary.open

    expect(pt_324_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 3rd lesson late' do
    2.times { navigation.scroll_down }
    pt_428_nurse_tasks.open
    pt_428_clinical_summary.open

    expect(pt_428_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 4th lesson late' do
    2.times { navigation.scroll_down }
    pt_431_nurse_tasks.open
    pt_431_clinical_summary.open

    expect(pt_431_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 5th lesson late' do
    2.times { navigation.scroll_down }
    pt_441_nurse_tasks.open
    pt_441_clinical_summary.open

    expect(pt_441_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 6th lesson late' do
    2.times { navigation.scroll_down }
    pt_451_nurse_tasks.open
    pt_451_clinical_summary.open

    expect(pt_451_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 7th lesson late' do
    navigation.scroll_down
    pt_461_nurse_tasks.open
    pt_461_clinical_summary.open

    expect(pt_461_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 8th lesson late' do
    navigation.scroll_down
    pt_471_nurse_tasks.open
    pt_471_clinical_summary.open

    expect(pt_471_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 9th lesson late' do
    navigation.scroll_down
    pt_480_nurse_tasks.open
    pt_480_clinical_summary.open

    expect(pt_480_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 10th lesson late' do
    2.times { navigation.scroll_down }
    pt_490_nurse_tasks.open
    pt_490_clinical_summary.open

    expect(pt_490_clinical_summary).to have_late_lesson
  end

  scenario 'Nurse sees participant accessed the 1st lesson on time' do
    2.times { navigation.scroll_down }
    pt_400_nurse_tasks.open
    pt_400_clinical_summary.open

    expect(pt_400_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 2nd lesson on time' do
    navigation.scroll_down
    pt_317_nurse_tasks.open
    pt_317_clinical_summary.open

    expect(pt_317_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 3rd lesson on time' do
    2.times { navigation.scroll_down }
    pt_412_nurse_tasks.open
    pt_412_clinical_summary.open

    expect(pt_412_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 4th lesson on time' do
    navigation.scroll_down
    pt_326_nurse_tasks.open
    pt_326_clinical_summary.open

    expect(pt_326_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 5th lesson on time' do
    2.times { navigation.scroll_down }
    pt_422_nurse_tasks.open
    pt_422_clinical_summary.open

    expect(pt_422_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 6th lesson on time' do
    2.times { navigation.scroll_down }
    pt_432_nurse_tasks.open
    pt_432_clinical_summary.open

    expect(pt_432_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 7th lesson on time' do
    2.times { navigation.scroll_down }
    pt_442_nurse_tasks.open
    pt_442_clinical_summary.open

    expect(pt_442_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 8th lesson on time' do
    2.times { navigation.scroll_down }
    pt_452_nurse_tasks.open
    pt_452_clinical_summary.open

    expect(pt_452_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 9th lesson on time' do
    2.times { navigation.scroll_down }
    pt_462_nurse_tasks.open
    pt_462_clinical_summary.open

    expect(pt_462_clinical_summary).to have_ontime_lesson
  end

  scenario 'Nurse sees participant accessed the 10th lesson on time' do
    navigation.scroll_down
    pt_472_nurse_tasks.open
    pt_472_clinical_summary.open

    expect(pt_472_clinical_summary).to have_ontime_lesson
  end
end

feature 'Spanish Nurse, Clinical Summary' do
  scenario 'Spanish nurse sees correct translations'
end

feature 'Portuguese Nurse, Clinical Summary' do
  scenario 'Portuguese nurse sees correct translations'
end
