require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for additional contact form
    module AdditionalContact
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def register
        localize(
          spanish: 'Registrar',
          portuguese: 'Registrar',
          english: 'Register'
        )
      end

      def expected_headings
        localize(
          spanish: ['Fecha y hora de contacto', 'Tipo de contacto'],
          portuguese: ['Data e hora do contato', 'Tipo de contato'],
          english: ['Date and time of contact', 'Type']
        )
      end

      def options
        localize(
          spanish: ['En persona', 'Llamada telefónica'],
          portuguese: ['presencial', 'por telefone'],
          english: ['in person', 'phone call']
        )
      end
    end
  end
end
