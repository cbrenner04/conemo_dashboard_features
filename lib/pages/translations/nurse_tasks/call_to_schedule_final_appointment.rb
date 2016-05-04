require './lib/pages/translations/nurse_tasks'
require './lib/pages/translations/nurse_tasks_titles'

module Translations
  module NurseTaskTitles
    # translations for Call to schedule final appointment
    module CallToScheduleFinalAppointment
      include Translations::NurseTasksTranslations
      include Translations::NurseTaskTitles

      def expected_headings
        locale(spanish_headings, portuguese_headings, english_headings)
      end

      def options
        locale(spanish_options, portuguese_options, english_options)
      end

      private

      def spanish_headings
        @spanish_headings ||= [
          'Fecha y hora de contacto',
          'Cita final para',
          'Lugar de cita final'
        ]
      end

      def portuguese_headings
        @portuguese_headings ||= [
          'Data da ligação',
          'Encontro Final em',
          'Local do Encontro Final'
        ]
      end

      def english_headings
        @english_options ||= [
          'Date/time of phone call',
          'Final in person appointment date and time',
          'Final appointment location'
        ]
      end

      def spanish_options
        @spanish_options ||= (1..10).map { |i| "Centro de salud #{i}" }
      end

      def portuguese_options
        @portuguese_options ||= [
          'Adão Manoel',
          'Celso Daniel',
          'Dom João Nery',
          'Jardim Campos',
          'Jardim Copa',
          'Jardim Rubro II',
          'Profeta Jeremias',
          'Santo Estevão',
          'Silva Teles',
          'Vila Ramos'
        ]
      end

      def english_options
        @english_options ||= (1..10).map { |i| "unit #{i}" }
      end
    end
  end
end
