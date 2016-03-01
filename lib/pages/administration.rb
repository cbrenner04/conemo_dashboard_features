# page object for the administration page
class Administration
  include Capybara::DSL

  def open
    find('.btn', text: 'ADMIN').click
  end

  def visible?
    has_css?('h1', text: 'Site Administration')
  end
end
