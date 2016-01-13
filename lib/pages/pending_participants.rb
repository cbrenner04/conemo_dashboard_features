# page object for pending participants
class PendingParticipants
  include Capybara::DSL

  def open
    click_on 'Pending Participants'
  end

  def activate(name)
    within('tr', text: name) { find('.fa-thumbs-up').click }
  end

  def assign_nurse
    click_on 'Save'
  end

  def disqualify(name)
    within('tr', text: name) { find('.fa-thumbs-down').click }
  end

  def confirm_disqualify
    page.accept_alert 'Are you sure you want to mark this person as ineligible?'
  end

  def select_ineligible_tab
    click_on 'Ineligible'
  end

  def create
    click_on 'ADD NEW PARTICIPANT'
  end

  def cancel
    click_on 'Cancel'
  end

  def fill_in_first_name(name)
    fill_in_field('first_name', name)
  end

  def fill_in_last_name(name)
    fill_in_field('last_name', name)
  end

  def fill_in_study_id(id)
    fill_in_field('study_identifier', id)
  end

  def fill_in_health_unit(unit)
    fill_in_field('family_health_unit_name', unit)
  end

  def fill_in_family_record(num)
    fill_in_field('family_record_number', num)
  end

  def fill_in_phone(phone)
    fill_in_field('phone', phone)
  end

  def fill_in_emer_con_name(name)
    fill_in_field('emergency_contact_name', name)
  end

  def fill_in_emer_con_phone(phone)
    fill_in_field('emergency_contact_phone', phone)
  end

  def fill_in_email(email)
    fill_in_field('email', email)
  end

  def select_dob
    dob = Date.today - ((25 * 365) + 143)
    enter_date(dob, 'date_of_birth')
  end

  def fill_in_address(address)
    fill_in_field('address', address)
  end

  def select_enrollment_date(date)
    enter_date(date, 'enrollment_date')
  end

  def choose_gender(gender)
    choose gender
  end

  def choose_chronic_disorder
    int = rand(0..2)
    disorder = ['hypertension', 'diabetes'].sample(int)
    disorder.each { |d| check d }
  end

  def submit
    click_on 'Save'
  end

  private

  def fill_in_field(field, item)
    fill_in "participant[#{field}]", with: item
  end

  def enter_date(date, field)
    select "#{date.strftime('%Y')}", from: "participant[#{field}(1i)]"
    select "#{date.strftime('%B')}", from: "participant[#{field}(2i)]"
    select "#{date.strftime('%-d')}", from: "participant[#{field}(3i)]"
  end
end
