require './lib/pages/translations'

module Translations
  # module for supervisor page translations
  module SupervisorPageTranslations
    include Translations

    def participants_title
      locale('participante', 'Participante', 'Participants')
    end

    def nurse_title
      locale('Enfermera', 'Auxiliar de Engfermagem', 'Nurse')
    end
  end
end
