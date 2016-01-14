# page object for log in page
class Login
  include Capybara::DSL

  def sign_in(user, password)
    visit ENV['Base_URL']
    fill_in 'user_email', with: user
    fill_in 'user_password', with: password
    find('.btn').click
  end
end
