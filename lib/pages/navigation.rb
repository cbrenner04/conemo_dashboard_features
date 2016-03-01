# page object for navigation
class Navigation
  include Capybara::DSL

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
    has_nav_button?('Pending Participants')
    has_nav_button?('Lessons')
  end

  def has_spanish_admin_buttons?
    has_nav_button?('Participantes reclutados')
    has_nav_button?('Sesiones')
  end

  def has_portuguese_admin_buttons?
    has_nav_button?('Participantes pendentes')
    has_nav_button?('Sessões')
  end

  def cancel
    click_on 'Cancel'
  end

  def submit
    click_on 'Save'
  end

  def return_home
    find('.navbar-brand', text: 'CONEMO').click
  end

  def scroll_by(pixels)
    execute_script("window.scrollBy(0,#{pixels})")
  end

  private

  def has_nav_button?(button)
    has_css?('.navigation', text: button)
  end
end
