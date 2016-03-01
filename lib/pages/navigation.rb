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

  def english_admin_buttons
    ['ADMIN', 'Pending Participants', 'Active Participants', 'Lessons']
  end

  def spanish_admin_buttons
    ['ADMIN', 'Participantes reclutados', 'Participantes activos', 'Sesiones']
  end

  def portuguese_admin_buttons
    ['ADMIN', 'Participantes pendentes', 'Participantes ativos', 'Sessões']
  end

  def cancel
    click_on 'Cancel'
  end

  def submit
    click_on 'Save'
  end

  def act_buttons
    all('.btn').map(&:text)
  end
end
