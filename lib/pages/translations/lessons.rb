require './lib/pages/translations'

module Translations
  # module for Lessons translations
  module Lessons
    include Translations

    def main_button
      locale('Sesiones', 'Sessões', 'Lessons')
    end

    def add_lesson_button
      locale('Añadir sesión', 'Adicionar sessão', 'Add Lesson')
    end
  end
end
