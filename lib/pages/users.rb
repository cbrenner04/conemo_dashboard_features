# page object for users
class Users
  include Capybara::DSL

  def initialize(user)
    @email ||= user[:email]
    @password ||= user[:password]
  end

  def sign_in
    visit ENV['Base_URL']
    fill_in 'user_email', with: @email
    fill_in 'user_password', with: @password
    find('.btn').click
  end
end
