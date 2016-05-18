# filename: ./spec/features/admin/administration_spec.rb

require './lib/pages/administration'

def administration
  @administration ||= Administration.new(locale: 'english')
end

feature 'Admin, Administration', metadata: :last do
  background do
    english_admin.sign_in
    administration.open

    expect(administration).to be_visible
  end

  scenario 'Admin creates an admin' do
    administration.open_admin_table
    administration.add_new_admin

    expect(administration).to have_new_admin
  end

  scenario 'Admin creates a nurse supervisor' do
    administration.open_supervisor_table
    administration.add_new_supervisor

    expect(administration).to have_new_supervisor
  end

  scenario 'Admin creates a nurse' do
    administration.open_nurse_table
    administration.add_new_nurse

    expect(administration).to have_new_nurse
  end

  scenario 'Admin sees phone id under Participants' do
    administration.open_participants_table
    administration.order_by_participant_id

    expect(administration).to have_phone_id
  end

  scenario 'Admin sees devices are scoped by locale' do
    administration.open_devices_table

    expect(administration).to have_only_one_device
  end
end
