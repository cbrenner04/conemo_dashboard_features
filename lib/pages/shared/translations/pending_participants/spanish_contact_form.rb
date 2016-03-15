module Translations
  module PendingParticipants
    # Spanish content for contact information form
    module SpanishContactForm
      def spanish_form
        @spanish_form ||= [
          'Nombres', 'Apellidos', 'Código del participante',
          'Fecha de inclusión', 'Centro de salud',
          'Dirección actual', 'Telefóno fijo',
          'Celular (propio)', 'Teléfono alternativo 1',
          'Nombre de persona / Lugar del teléfono alternativo 1',
          'Relación con el participante', 'Relación con el participante',
          'Telefóno alternativo 2',
          'Nombre de persona / Lugar del teléfono alternativo 2',
          'Relación con el participante', 'Relación con el participante',
          'Fecha de nacimiento', 'Sexo',
          'Contacto de Emergencia (nombre)',
          'Relación con el participante', 'Relación con el participante',
          'Dirección actual', 'Teléfono fijo', 'Celular'
        ]
      end

      def spanish_health_unit_options
        @spanish_health_unit_options ||= [
          'Centro de salud 1',
          'Centro de salud 2',
          'Centro de salud 3',
          'Centro de salud 4',
          'Centro de salud 5',
          'Centro de salud 6',
          'Centro de salud 7',
          'Centro de salud 8',
          'Centro de salud 9',
          'Centro de salud 10'
        ]
      end

      def spanish_relationship_options
        @spanish_relationship_options ||= [
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
          'Masculino',
          'Femenino'
        ]
      end
    end
  end
end
