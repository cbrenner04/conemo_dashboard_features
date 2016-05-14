require './lib/pages/translations'

# page object for users
class Users
  include Capybara::DSL
  include Translations

  def initialize(user)
    @email ||= user[:email]
    @password ||= user[:password]
    @patient ||= user[:patient]
    @locale ||= user[:locale]
  end

  def sign_in
    visit ENV['Base_URL']
    fill_in 'user_email', with: @email
    fill_in 'user_password', with: @password
    find('.btn').click
  end

  def sign_out
    find('a', text: sign_out_link).click
    find('h2', text: sign_in_header)
  end

  def has_english_patient?
    find('.table-hover').has_text? '304'
  end

  def has_spanish_patient?
    find('.table-hover').has_text? '504'
  end

  def has_portuguese_patient?
    find('.table-hover').has_text? '604'
  end

  private

  def sign_out_link
    localize(spanish: 'Salir', portuguese: 'Terminar sessão', english: 'Sign out')
  end

  def sign_in_header
    localize(spanish: 'Iniciar sésion', portuguese: 'Login', english: 'Sign in')
  end
end
