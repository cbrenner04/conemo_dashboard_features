# frozen_string_literal: true
require './lib/pages/translations/nurse_tasks'

module Tasks
  # page object for supervisor contacts on nurse tasks page
  class SupervisorContacts
    include Capybara::DSL
    include NurseTasksTranslations

    def initialize(supervisor_contacts)
      @locale ||= supervisor_contacts.fetch(:locale, 'english')
      @time_of_contact ||= supervisor_contacts[:time_of_contact]
    end

    def clear
      find("input[value = \"#{clear_supervisor_contact_button}\"]").click
      accept_alert clear_supervisor_contact_alert
    end

    def has_new_supervisor_contact?
      has_supervisor_contact?(now)
    end

    def has_previous_supervisor_contact?
      has_supervisor_contact?(@time_of_contact)
    end

    private

    def has_supervisor_contact?(time)
      has_text? "#{last_supervisor_contact_heading} " \
                "#{standard_date(time)}#{locale_hour(time)}"
    end
  end
end
