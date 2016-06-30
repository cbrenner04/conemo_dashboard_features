# frozen_string_literal: true
require 'business_time'
require './lib/pages/navigation'
require './lib/pages/translations/supervisor_page/nurses'

module Supervisor
  # page object for Nurses section of Supervisor page
  class Nurses
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::NursesTranslations

    def initialize(nurses)
      @id ||= nurses[:id]
      @num_participants ||= nurses[:num_participants]
      @num_tasks ||= nurses[:num_tasks]
      @num_overdue ||= nurses[:num_overdue]
      @locale ||= nurses.fetch(:locale, 'english')
    end

    def has_nurses_title?
      has_css?('h3', text: nurse_title)
    end

    def has_subheadings?
      has_css?('ul', text: subheadings)
    end

    def has_participants_and_tasks?
      within('.panel-heading', text: "Nurse-#{@id}, English") do
        ["#{@num_participants} Participants",
         "#{@num_tasks} Tasks",
         "#{@num_overdue} Overdue",
         'English Locale Health Unit'].all? do |item|
          has_css?('li', text: item)
        end
      end
    end

    def has_contact_notification?
      nurse_panel.has_css?('.fa-exclamation-circle')
    end

    def select
      4.times { navigation.scroll_down }
      nurse_panel_heading.find('a', text: "Nurse-#{@id}, #{language}").click
    end

    def has_your_patients_header?
      has_css?('h2', text: "Nurse-#{@id}, English: Participants")
    end

    private

    def navigation
      Navigation.new(locale: @locale)
    end

    def nurse_panel
      all('.panel', text: "Nurse-#{@id}, #{language}").last
    end

    def nurse_panel_heading
      find('.panel-heading', text: "Nurse-#{@id}, #{language}")
    end
  end
end
