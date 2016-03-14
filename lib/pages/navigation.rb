require './lib/pages/shared/translations/navigation'

# page object for navigation
class Navigation
  include Capybara::DSL
  include Translations::Navigation

  def initialize(navigation)
    @locale = navigation[:locale]
  end

  def switch_to_english
    click_on 'English'
  end

  def switch_to_spanish
    click_on 'Español'
  end

  def switch_to_portuguese
    click_on 'Português'
  end

  def has_english_admin_buttons?
    has_nav_button?('Pending Participants') &&
      has_nav_button?('Lessons')
  end

  def has_spanish_admin_buttons?
    has_nav_button?('Participantes reclutados') &&
      has_nav_button?('Sesiones')
  end

  def has_portuguese_admin_buttons?
    has_nav_button?('Participantes pendentes') &&
      has_nav_button?('Sessões')
  end

  def cancel
    find('a', text: cancel_button).click
  end

  def submit
    click_on 'Save'
  end

  def return_home
    find('.navbar-brand', text: 'CONEMO').click
  end

  def scroll_down
    execute_script('window.scrollBy(0,500)')
  end

  private

  def has_nav_button?(button)
    has_css?('.navigation', text: button)
  end
end
