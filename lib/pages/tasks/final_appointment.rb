# frozen_string_literal: true
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/nurse_tasks_page'
require './lib/pages/translations/nurse_tasks/final_appointment'

module Tasks
  # page object for first contact page of active participants
  class FinalAppointment
    include Capybara::DSL
    include NurseTasksForms
    include NurseTasksPage
    include Translations::NurseTaskTitles::FinalAppointment

    def initialize(final_appointment)
      @locale ||= final_appointment.fetch(:locale, 'english')
      @task_title = final_appointment_title
    end

    def enter_location
      enter_task_location(5)
    end

    def toggle_options_list
      custom_click(selector[5])
    end

    def general_notes
      'Final notes'
    end

    def enter_notes
      fill_in 'final_appointment[notes]', with: general_notes
    end

    def choose_phone_returned
      resp = ['true', 'false'].sample
      find("#final_appointment_phone_returned_#{resp}").click
    end

    def choose_phone_returned_negative
      find('#final_appointment_phone_returned_false').click
    end

    def has_form_headings?
      has_task_form_headings?(3)
    end

    def has_location_options?
      has_task_options?(5, 2, location_options)
    end

    def has_success_alert?
      has_css?('.alert', text: localize(
        spanish: 'Paciente completó la intervención satisfactoriamente',
        portuguese: 'Participante completado com sucesso',
        english: 'Participant successfully completed'
      ))
    end
  end
end
