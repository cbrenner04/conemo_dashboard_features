# filename: ./spec/features/admin/login_spec.rb

require './spec/support/admin/login_helper'

feature 'Admin, Login' do
  scenario 'Admin in English locale cannot access Spanish or Portuguese' do
    english_admin.sign_in

    expect(navigation).to have_english_admin_buttons

    navigation.switch_to_spanish

    expect(navigation).to_not have_spanish_admin_buttons

    navigation.switch_to_portuguese

    expect(navigation).to_not have_portuguese_admin_buttons
  end

  scenario 'Admin in Spanish locale cannot access English or Portuguese' do
    spanish_admin.sign_in

    expect(navigation).to have_spanish_admin_buttons

    navigation.switch_to_english

    expect(navigation).to_not have_english_admin_buttons

    navigation.switch_to_portuguese

    expect(navigation).to_not have_portuguese_admin_buttons
  end

  scenario 'Admin in Portuguese locale cannot access English or Spanish' do
    portuguese_admin.sign_in

    expect(navigation).to have_portuguese_admin_buttons

    navigation.switch_to_spanish

    expect(navigation).to_not have_spanish_admin_buttons

    navigation.switch_to_english

    expect(navigation).to_not have_english_admin_buttons
  end

  scenario 'Admin can access appropriate parts of the app' do
    english_admin.sign_in
    lessons.open

    expect(lessons).to be_on_lesson_list_page

    navigation.return_home
    pending_participants.open

    expect(pending_participants).to be_visible

    navigation.return_home
    administration.open

    expect(administration).to be_visible
  end
end
