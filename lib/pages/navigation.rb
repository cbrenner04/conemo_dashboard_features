require './lib/pages/translations/navigation'

# page object for navigation
class Navigation
  include Capybara::DSL
  include Translations::NavigationTranslations

  def initialize(navigation)
    @locale ||= navigation[:locale]
  end

  def has_english_admin_buttons?
    ['Pending Participants', 'Lessons']
      .all? { |button| has_nav_button? button }
  end

  def has_spanish_admin_buttons?
    ['Participantes pendientes', 'Sesiones']
      .all? { |button| has_nav_button? button }
  end

  def has_portuguese_admin_buttons?
    ['Participantes pendentes', 'Sessões']
      .all? { |button| has_nav_button? button }
  end

  def cancel
    find('a', text: cancel_button).click
  end

  def submit
    click_on submit_button
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
