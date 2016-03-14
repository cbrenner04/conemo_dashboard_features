module Translations
  module PendingParticipants
    # Spanish content for contact information form
    module SpanishContactForm
      def spanish_form
        @spanish_form ||= [
          'Nombres',
          'Apellidos',
          'Código del participante',
          'Fecha de inclusión',
          'Centro de salud',
          'Dirección actual',
          'Telefóno fijo',
          'Celular (propio)',
          'Teléfono alternativo 1',
          'Nombre de persona / Lugar del teléfono alternativo 1',
          'Relación con el participante',
          'Telefóno alternativo 2',
          'Nombre de persona / Lugar del teléfono alternativo 2',
          'Relación con el participante',
          'Fecha de nacimiento',
          'Sexo',
          'Contacto de Emergencia (nombre)',
          'Relación con el participante',
          'Dirección actual',
          'Teléfono fijo',
          'Celular'
        ]
      end

      def spanish_relationship_options
        @spanish_relationship_options ||= [
          'Menu:',
          'Padre / Madre',
          'Esposo(a) / Pareja',
          'Hijo (a)',
          'Otro miembro de la familia',
          'Amigo',
          'Otro (especificar)'
        ]
      end

      def spanish_gender_options
        @spanish_gender_options ||= [
          'Hombre',
          'Mujer'
        ]
      end
    end
  end
end