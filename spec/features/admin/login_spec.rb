# filename: ./spec/features/admin/login_spec.rb

require './spec/support/admin/login_helper'

feature 'Admin, Login' do
  scenario 'Admin in English locale logs in' do
    english_admin.sign_in

    expect(navigation).to have_english_admin_buttons
  end

  scenario 'Admin in Spanish locale logs in' do
    spanish_admin.sign_in

    expect(navigation).to have_spanish_admin_buttons
  end

  scenario 'Admin in Portuguese locale logs in' do
    portuguese_admin.sign_in

    expect(navigation).to have_portuguese_admin_buttons
  end

  scenario 'Admin can access appropriate parts of the app' do
    english_admin.sign_in
    lessons.open

    expect(lessons).to be_on_lesson_list_page

    navigation.return_home
    pending_participants.open

    expect(pending_participants).to have_landing_page_visible

    navigation.return_home
    administration.open

    expect(administration).to be_visible
  end
end
