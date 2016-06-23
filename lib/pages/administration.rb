# frozen_string_literal: true
require './lib/pages/translations'

# page object for the administration page
class Administration
  include RSpec::Matchers
  include Capybara::DSL
  include Translations

  def initialize(administration)
    @locale ||= administration.fetch(:locale, 'english')
  end

  def open
    find('.btn', text: 'ADMIN').click
  end

  def visible?
    has_css?('h1', text: localize(spanish: 'Administración del sitio',
                                  portuguese: 'Administração do Site',
                                  english: 'Site Administration'))
  end

  def english_version
    "#{ENV['Base_URL']}/admin?locale=en"
  end

  def lessons_page
    locale = localize(spanish: 'es-PE', portuguese: 'pt-BR', english: 'en')
    "#{ENV['Base_URL']}/#{locale}/lessons"
  end

  def on_lessons_page?
    has_text? localize(
      spanish: '¡Bienvenido a CONEMO!',
      portuguese: 'Bem-vindo ao CONEMO!',
      english: 'Lesson 1'
    )
  end
end
