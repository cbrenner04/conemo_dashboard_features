# frozen_string_literal: true
require './lib/pages/translations/supervisor_page/nurses'

module Supervisor
  # page object for supervision session form for nurse Supervisor
  class SupervisionSessionForm
    include RSpec::Matchers
    include Capybara::DSL
    include Translations::SupervisorPageTranslations::NursesTranslations

    def initialize(session_form)
      @locale ||= session_form.fetch(:locale, 'english')
    end

    def select_meeting_kind
      @meeting_kind = ['Group', 'Individual'].sample
      choose @meeting_kind
    end

    def select_contact_kind
      @contact_kind = ['Phone', 'In person'].sample
      choose @contact_kind
    end

    def choose_topic
      topics = [
        'First appointments',
        'Difficulty to contact patient',
        'Non-resolved help requests',
        'Non connectivity calls',
        'Non-adherence',
        'Patient\'s difficulties with CONEMO',
        'Overdue tasks / Nurse adherence',
        'Cancelled tasks',
        'Serious adverse events (if nurse brings it up)',
        'Dropouts',
        'Uncertainties related to tasks',
        'Questions about intervention',
        'Other programmed contact points',
        'Resolved help requests',
        'Difficult situations for the nurse related to the intervention/study',
        'Administrative issues',
        'Additional contacts',
        'Others'
      ]
      choices = (0..17).to_a.sample(2).sort
      @topic = [topics[choices[0]], topics[choices[1]]]
      @topic.each { |chosen_topic| check chosen_topic }
    end

    def has_supervision_session_form_visible?
      has_css?('h1', text: supervision_form_heading)
    end

    def enter_session_length
      fill_in 'supervision_session[session_length]', with: 20
    end

    def has_new_supervision_session?
      session_table = find('.table', text: 'Session')
      session_table.has_text?(standard_date(today)) &&
        session_table.has_text?("20 #{@meeting_kind} #{@contact_kind} " \
                                "#{@topic[0]}, #{@topic[1]}")
    end

    def has_questions_and_responses?
      labels = all('label')
      expect(labels[0].text).to eq localize(spanish: 'Fecha/hora',
                                            portuguese: 'Data/hora',
                                            english: 'Session at')

      array_of_elements_equal?(
        elements: labels,
        ids: (6..31),
        expectation: expected_questions_and_answers
      )
    end
  end
end
