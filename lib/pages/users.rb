# page object for users
class Users
  include Capybara::DSL

  def initialize(user)
    @email ||= user[:email]
    @password ||= user[:password]
    @patient ||= user[:patient]
  end

  def sign_in
    visit ENV['Base_URL']
    fill_in 'user_email', with: @email
    fill_in 'user_password', with: @password
    find('.btn').click
  end

  def has_english_patient?
    find('.table').has_text? '304'
  end

  def has_spanish_patient?
    find('.table').has_text? '504'
  end

  def has_portuguese_patient?
    find('.table').has_text? '604'
  end
end
