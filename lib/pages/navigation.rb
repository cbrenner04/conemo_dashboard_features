require './lib/pages/translations/navigation'

# page object for navigation
class Navigation
  include Capybara::DSL
  include Translations::NavigationTranslations

  def initialize(navigation)
    @locale ||= navigation.fetch(:locale, 'english')
  end

  def has_admin_buttons?
    buttons.all? { |button| has_nav_button? button }
  end

  def cancel
    find('a', text: cancel_button).click
  end

  def submit
    click_on submit_button
  end

  def return_home
    first('.navbar-brand').click
  end

  def scroll_down
    sleep(0.25)
    execute_script('window.scrollBy(0,500)')
  end

  def scroll_up
    sleep(0.25)
    execute_script('window.scrollBy(0,-250)')
  end

  private

  def has_nav_button?(button)
    has_css?('.navbar-nav', text: button)
  end

  def buttons
    @buttons ||= localize(
      spanish: ['Participantes pendientes', 'Sesiones'],
      portuguese: ['Participantes pendentes', 'Sessões'],
      english: ['Pending Participants', 'Lessons']
    )
  end
end
