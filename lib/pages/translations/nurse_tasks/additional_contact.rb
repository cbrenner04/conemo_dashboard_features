require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for additional contact form
    module AdditionalContact
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def register
        locale('Registrar', 'Registrar', 'Register')
      end

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def spanish_headings
        @spanish_headings ||= ['Fecha y hora de contacto', 'Tipo de contacto']
      end

      def portuguese_headings
        @portuguese_headings ||= ['Data e hora do contato', 'Tipo de contato']
      end

      def english_headings
        @english_headings ||= ['Date and time of contact', 'Type']
      end

      def spanish_options
        @spanish_options ||= ['En persona', 'Llamada telefónica']
      end

      def portuguese_options
        @portuguese_options ||= ['presencial', 'por telefone']
      end

      def english_options
        @english_options ||= ['in person', 'phone call']
      end
    end
  end
end
