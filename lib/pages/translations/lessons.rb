require './lib/pages/translations'

module Translations
  # module for Lessons translations
  module Lessons
    include Translations

    def main_button
      locale('Sesiones', 'Sessões', 'Lessons')
    end
  end
end
