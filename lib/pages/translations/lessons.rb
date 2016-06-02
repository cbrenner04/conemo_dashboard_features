# frozen_string_literal: true
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

    def destroy_alert
      localize(
        spanish: 'Sesión eliminada',
        portuguese: 'translation missing: ' \
                    'pt-BR.conemo.controllers.lessons.destroyed',
        english: 'Lesson deleted'
      )
    end
  end
end
