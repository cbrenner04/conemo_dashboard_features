require './lib/pages/translations'

module Translations
  # module for Lessons translations
  module Lessons
    include Translations

    def main_button
      localize(spanish: 'Sesiones', portuguese: 'Sessões', english: 'Lessons')
    end

    def add_lesson_button
      localize(
        spanish: 'Añadir sesión',
        portuguese: 'Adicionar sessão',
        english: 'Add Lesson'
      )
    end
  end
end
