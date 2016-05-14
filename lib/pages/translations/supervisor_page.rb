require './lib/pages/translations'

module Translations
  # module for supervisor page translations
  module SupervisorPageTranslations
    include Translations

    def participants_title
      localize(
        spanish: 'participante',
        portuguese: 'Participante',
        english: 'Participants'
      )
    end

    def nurse_title
      localize(
        spanish: 'Enfermera',
        portuguese: 'Auxiliar de Engfermagem',
        english: 'Nurse'
      )
    end
  end
end
