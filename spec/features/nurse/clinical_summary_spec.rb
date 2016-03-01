# filename: ./spec/features/nurse/clinical_summary_spec.rb

require './spec/support/nurse/clinical_summary_helper'

feature 'Nurse, Clinical Summary' do
  background do
    english_nurse.sign_in
  end

  scenario 'Nurse sees correct messages & logins' do
    pt_343_clinical_summary.open

    expect(pt_343_clinical_summary).to have_messages

    clinical_summary.show_number_of_logins

    expect(pt_343_clinical_summary).to have_correct_logins
  end

  scenario 'Nurse sees current lesson (1st) highlighted' do
    2.times { navigation.scroll_down }
    pt_300_clinical_summary.open

    expect(pt_300_clinical_summary).to have_current_lesson
  end

  scenario 'Nurse sees current lesson (2nd) highlighted & 1st lesson missed' do
    4.times { navigation.scroll_down }
    reports.open_for('401')
    expect(reports).to have_current_lesson_at('2')

    expect(reports).to have_unread_lesson_at('1')
  end

  scenario 'Nurse sees current lesson (3rd) highlighted & 2nd lesson missed' do
    navigation.scroll_down
    reports.open_for('312')
    expect(reports).to have_current_lesson_at('3')

    expect(reports).to have_unread_lesson_at('2')
  end

  scenario 'Nurse sees current lesson (4th) highlighted & 3rd lesson missed' do
    4.times { navigation.scroll_down }
    reports.open_for('410')
    expect(reports).to have_current_lesson_at('4')

    expect(reports).to have_unread_lesson_at('3')
  end

  scenario 'Nurse sees current lesson (5th) highlighted & 4th lesson missed' do
    2.times { navigation.scroll_down }
    reports.open_for('323')
    expect(reports).to have_current_lesson_at('5')

    expect(reports).to have_unread_lesson_at('4')
  end

  scenario 'Nurse sees current lesson (6th) highlighted & 5th lesson missed' do
    5.times { navigation.scroll_down }
    reports.open_for('420')
    expect(reports).to have_current_lesson_at('6')

    expect(reports).to have_unread_lesson_at('5')
  end

  scenario 'Nurse sees current lesson (7th) highlighted & 6th lesson missed' do
    5.times { navigation.scroll_down }
    reports.open_for('430')
    expect(reports).to have_current_lesson_at('7')

    expect(reports).to have_unread_lesson_at('6')
  end

  scenario 'Nurse sees current lesson (8th) highlighted & 7th lesson missed' do
    5.times { navigation.scroll_down }
    reports.open_for('440')
    expect(reports).to have_current_lesson_at('8')

    expect(reports).to have_unread_lesson_at('7')
  end

  scenario 'Nurse sees current lesson (9th) highlighted & 8th lesson missed' do
    5.times { navigation.scroll_down }
    reports.open_for('450')
    expect(reports).to have_current_lesson_at('9')

    expect(reports).to have_unread_lesson_at('8')
  end

  scenario 'Nurse sees current lesson (10th) highlighted & 9th lesson missed' do
    6.times { navigation.scroll_down }
    reports.open_for('460')
    expect(reports).to have_current_lesson_at('10')

    expect(reports).to have_unread_lesson_at('9')
  end

  scenario 'Nurse sees participant accessed the 1st lesson late' do
    4.times { navigation.scroll_down }
    reports.open_for('411')

    expect(reports).to have_late_lesson_at('1')
  end

  scenario 'Nurse sees participant accessed the 2nd lesson late' do
    2.times { navigation.scroll_down }
    reports.open_for('324')

    expect(reports).to have_late_lesson_at('2')
  end

  scenario 'Nurse sees participant accessed the 3rd lesson late' do
    5.times { navigation.scroll_down }
    reports.open_for('421')

    expect(reports).to have_late_lesson_at('3')
  end

  scenario 'Nurse sees participant accessed the 4th lesson late' do
    5.times { navigation.scroll_down }
    reports.open_for('431')

    expect(reports).to have_late_lesson_at('4')
  end

  scenario 'Nurse sees participant accessed the 5th lesson late' do
    5.times { navigation.scroll_down }
    reports.open_for('441')

    expect(reports).to have_late_lesson_at('5')
  end

  scenario 'Nurse sees participant accessed the 6th lesson late' do
    5.times { navigation.scroll_down }
    reports.open_for('451')

    expect(reports).to have_late_lesson_at('6')
  end

  scenario 'Nurse sees participant accessed the 7th lesson late' do
    6.times { navigation.scroll_down }
    reports.open_for('461')

    expect(reports).to have_late_lesson_at('7')
  end

  scenario 'Nurse sees participant accessed the 8th lesson late' do
    6.times { navigation.scroll_down }
    reports.open_for('471')

    expect(reports).to have_late_lesson_at('8')
  end

  scenario 'Nurse sees participant accessed the 9th lesson late' do
    6.times { navigation.scroll_down }
    reports.open_for('480')

    expect(reports).to have_late_lesson_at('9')
  end

  scenario 'Nurse sees participant accessed the 10th lesson late' do
    6.times { navigation.scroll_down }
    reports.open_for('490')

    expect(reports).to have_late_lesson_at('10')
  end

  scenario 'Nurse sees participant accessed the 1st lesson on time' do
    2.times { navigation.scroll_down }
    reports.open_for('313')

    expect(reports).to have_ontime_lesson_at('1')
  end

  scenario 'Nurse sees participant accessed the 2nd lesson on time' do
    2.times { navigation.scroll_down }
    reports.open_for('317')

    expect(reports).to have_ontime_lesson_at('2')
  end

  scenario 'Nurse sees participant accessed the 3rd lesson on time' do
    4.times { navigation.scroll_down }
    reports.open_for('412')

    expect(reports).to have_ontime_lesson_at('3')
  end

  scenario 'Nurse sees participant accessed the 4th lesson on time' do
    2.times { navigation.scroll_down }
    reports.open_for('326')

    expect(reports).to have_ontime_lesson_at('4')
  end

  scenario 'Nurse sees participant accessed the 5th lesson on time' do
    5.times { navigation.scroll_down }
    reports.open_for('422')

    expect(reports).to have_ontime_lesson_at('5')
  end

  scenario 'Nurse sees participant accessed the 6th lesson on time' do
    5.times { navigation.scroll_down }
    reports.open_for('432')

    expect(reports).to have_ontime_lesson_at('6')
  end

  scenario 'Nurse sees participant accessed the 7th lesson on time' do
    5.times { navigation.scroll_down }
    reports.open_for('442')

    expect(reports).to have_ontime_lesson_at('7')
  end

  scenario 'Nurse sees participant accessed the 8th lesson on time' do
    6.times { navigation.scroll_down }
    reports.open_for('452')

    expect(reports).to have_ontime_lesson_at('8')
  end

  scenario 'Nurse sees participant accessed the 9th lesson on time' do
    6.times { navigation.scroll_down }
    reports.open_for('462')

    expect(reports).to have_ontime_lesson_at('9')
  end

  scenario 'Nurse sees participant accessed the 10th lesson on time' do
    6.times { navigation.scroll_down }
    reports.open_for('472')

    expect(reports).to have_ontime_lesson_at('10')
  end
end
