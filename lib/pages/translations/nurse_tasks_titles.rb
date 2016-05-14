require './lib/pages/translations'

module Translations
  # translations for Nurse Tasks
  module NurseTaskTitles
    include Translations

    def confirmation_call_title
      localize(
        spanish: 'Llamada confirmando cita',
        portuguese: 'Chamada de confirmação',
        english: 'Confirmation call'
      )
    end

    def initial_appointment_title
      localize(
        spanish: 'Cita de inicio',
        portuguese: 'Encontro inicial',
        english: 'Initial in person appointment'
      )
    end

    def follow_up_week_one_title
      localize(
        spanish: 'Llamada de seguimiento sem. 1',
        portuguese: 'Chamada de seguimento sem. 1',
        english: 'Follow up call week 1'
      )
    end

    def follow_up_week_three_title
      localize(
        spanish: 'Llamada de seguimiento sem. 3',
        portuguese: 'Chamada de seguimento sem. 3',
        english: 'Follow up call week 3'
      )
    end

    def call_to_schedule_final_title
      localize(
        spanish: 'Llamada para programar cita final',
        portuguese: 'Chamada para agendar encontro final',
        english: 'Call to schedule final in person appointment'
      )
    end

    def final_appointment_title
      localize(
        spanish: 'Cita final',
        portuguese: 'Encontro final',
        english: 'Final in person appointment'
      )
    end

    def additional_contact_title
      localize(
        spanish: 'Contacto adicional',
        portuguese: 'Contato adicional',
        english: 'Additional contact'
      )
    end

    def help_request_title
      localize(
        spanish: 'Solicitud de ayuda',
        portuguese: 'Pedido de ajuda',
        english: 'Help request'
      )
    end

    def non_adherence_call_title
      localize(
        spanish: 'Llamada por no-adherencia',
        portuguese: 'Chamada por não aderência',
        english: 'Non-adherence call'
      )
    end

    def lack_of_connectivity_call_title
      localize(
        spanish: 'Llamada por no-conectividad',
        portuguese: 'Chamada por não-conectividade',
        english: 'Call due to no connectivity'
      )
    end
  end
end
