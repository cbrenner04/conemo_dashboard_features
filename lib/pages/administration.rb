require './lib/pages/translations'

# page object for the administration page
class Administration
  include RSpec::Matchers
  include Capybara::DSL
  include Translations

  def initialize(administration)
    @locale ||= administration.fetch(:locale, 'english')
  end

  def open
    find('.btn', text: 'ADMIN').click
  end

  def english_version
    "#{ENV['Base_URL']}/admin?locale=en"
  end

  def lessons_page
    locale = localize(spanish: 'es-PE', portuguese: 'pt-BR', english: 'en')
    "#{ENV['Base_URL']}/#{locale}/lessons"
  end

  def on_lessons_page?
    has_text? localize(
      spanish: '¡Bienvenido a CONEMO!',
      portuguese: 'Bem-vindo ao CONEMO!',
      english: 'Lesson 1'
    )
  end

  def visible?
    has_css?('h1', text: localize(spanish: 'Administración del sitio',
                                  portuguese: 'Administração do Site',
                                  english: 'Site Administration'))
  end

  def open_participants_table
    first('a', text: localize(spanish: 'Participantes',
                              portuguese: 'Participantes',
                              english: 'Participants')).click
  end

  def order_by_participant_id
    find('th', text: localize(spanish: 'Código del participante',
                              portuguese: 'Identificação do participante (ID)',
                              english: 'Participant ID')).click
  end

  def open_admin_table
    first('a', text: 'Admins').click
  end

  def add_new_admin
    click_on 'Add new'
    fill_in 'Email', with: 'new_admin@example.com'
    fill_in 'Phone', with: '202-555-0149'
    fill_in 'First name', with: 'New'
    fill_in 'Last name', with: 'Admin'
    find('.ra-filtering-select-input').set('en')
    click_on 'Save'
  end

  def has_new_admin?
    has_css?('.alert', text: 'Admin successfully created') &&
      has_css?('.admin_row', text: 'new_admin@example.com')
  end

  def open_supervisor_table
    first('a', text: 'Nurse supervisors').click
  end

  def add_new_supervisor
    click_on 'Add new'
    fill_in 'Email', with: 'new_supervisor@example.com'
    fill_in 'Phone', with: '202-555-0149'
    fill_in 'First name', with: 'New'
    fill_in 'Last name', with: 'Supervisor'
    click_on 'Save'
  end

  def has_new_supervisor?
    has_css?('.alert', text: 'Nurse supervisor successfully created') &&
      has_css?('.nurse_supervisor_row', text: 'new_supervisor@example.com')
  end

  def open_nurse_table
    first('a', text: 'Nurses').click
  end

  def add_new_nurse
    click_on 'Add new'
    fill_in 'Email', with: 'new_nurse@example.com'
    fill_in 'Phone', with: '202-555-0149'
    fill_in 'First name', with: 'New'
    fill_in 'Last name', with: 'Nurse'
    click_on 'Save'
  end

  def has_new_nurse?
    has_css?('.alert', text: 'Nurse successfully created') &&
      has_css?('.nurse_row', text: 'new_nurse@example.com')
  end

  def has_phone_id?
    has_css?('th', text: 'Phone identifier') &&
      first('tr', text: 'Last-100')
        .has_css?('.phone_identifier_field', text: '1234')
  end

  def open_devices_table
    first('a', text: 'Devices').click
  end

  def has_only_one_device?
    has_css?('tr', text: 'XT1032', count: 1) &&
      has_css?('.participant_field', text: '1000')
  end

  def open_inactive_devices_table
    first('a', text: 'Past device assignments').click
  end

  def has_one_inactive_device?
    has_css?('tr', text: 'XT1032', count: 1)
  end
end
