class SupervisorPage
  # page object for Nurses section of Supervisor page
  class Nurses
    include Capybara::DSL

    def initialize(nurses)
      @id ||= nurses[:id]
      @num_participants ||= nurses[:num_participants]
      @num_tasks ||= nurses[:num_tasks]
      @num_overdue ||= nurses[:num_overdue]
      @supervision_date ||= nurses[:supervision_date]
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

    def has_supervision_session?
      find('.panel-heading', text: "Nurse-#{@id}, English")
        .has_css?('small',
                  text: 'Last supervision session: ' \
                        "#{@supervision_date.strftime('%B %-d, %Y %H')}")
    end

    def create_supervision_session
      find('.panel', text: "Nurse-#{@id}, English")
        .find('a', text: 'Log supervision session').click
    end

    def has_supervision_session_form_visible?
      has_css?('h1', text: 'Supervision session')
    end

    def create_supervision_contact
      find('.panel', text: "Nurse-#{@id}, English")
        .find('a', text: 'Log supervision contact').click
    end

    def has_supervision_contact_form_visible?
      has_css?('h1', text: 'Supervision contact')
    end

    def enter_session_length
      fill_in 'supervision_session[session_length]', with: 20
    end

    def select_meeting_kind
      choose ['Group', 'Individual'].sample
    end

    def select_contact_kind
      choose ['Phone', 'In person'].sample
    end

    def choose_topic
      topic = [
        'First appointments',
        'Difficulty to contact patient',
        'Non connectivity calls',
        'Non-resolved help requests',
        'Non-adherence',
        'Patient\'s difficulties with CONEMO',
        'Uncertainties related to tasks',
        'Overdue tasks / Nurse adherence',
        'Cancelled tasks',
        'Questions about intervention',
        'Serious adverse events (if nurse brings it up)',
        'Dropouts'
      ].sample(2)
      topic.each { |t| check t }
    end
  end
end
