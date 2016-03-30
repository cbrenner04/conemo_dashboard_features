require './lib/pages/shared/contact_information_form'
require './lib/pages/translations/contact_information'
require './lib/pages/translations/clinical_summary'
require './lib/pages/translations/nurse_tasks'
Dir['./lib/pages/nurse_tasks/*.rb'].each { |file| require file }

class NurseTasks
  # page object for profile page of active participants
  class ContactInformation
    include RSpec::Matchers
    include Capybara::DSL
    include ContactInformationForm
    include Translations::ContactInformation
    include Translations::ClinicalSummaryTranslations
    include Translations::NurseTasksTranslations

    def initialize(contact_information)
      @id ||= contact_information[:id]
      @email ||= contact_information[:email]
      @session ||= contact_information[:session]
      @session_length ||= contact_information[:session_length]
      @locale ||= contact_information[:locale]
    end

    def open
      click_on clinical_summary_link
      click_on 'participant contact information page'
    end

    def on_page?
      has_css?('h2', text: profile_heading)
    end

    def visible?
      date_1 = Date.today - ((30 * 365) + @id.to_i)
      has_css?('#contact-info',
               text: 'Contact Information Family ' \
                     'Health Unit Name: Family Health Center Phone: ' \
                     "13333333#{@id} Emergency Contact Name: Emergency " \
                     'Contact Phone: Date Of Birth: ' \
                     "#{date_1.strftime('%B %d, %Y')} Address: 123 Main " \
                     'Street Enrollment Date: ' \
                     "#{Date.today.strftime('%B %d, %Y')} Gender: female")
    end

    def select_edit_contact_information
      find('#contact-info').find('.fa-edit').click
    end

    def select_edit_smartphone_information
      find('#smartphone-info').find('.fa-edit').click
    end

    def enter_smartphone_number
      fill_in 'smartphone[number]', with: '12345678901'
    end

    def enter_phone_id
      fill_in 'smartphone[phone_identifier]', with: "123#{@id}"
    end

    def has_smartphone_information?
      has_text? "#{smartphone_information_title}: 12345678901"
    end

    def has_confirmation_call?
      find('.timeline').has_css?('.timeline-panel', count: 1) &&
        has_text?("#{confirmation_call_title} Date of contact:" \
                  " #{DateTime.now.strftime('%B %d, %Y')}")
    end

    def has_initial_appointment?
      find('.timeline').has_css?('.timeline-panel', count: 2) &&
        has_text?("#{initial_appointment_title} Appointment date/time: " \
                  "#{DateTime.now.strftime('%B %d, %Y')} ")
    end

    def has_follow_up_week_1?
      find('.timeline').has_css?('.timeline-panel', count: 3) &&
        has_text?("#{follow_up_week_one_title} information Contact At: " \
                  "#{DateTime.now.strftime('%B %d, %Y')}") &&
        has_text?('Session Length: 120')
    end

    def has_follow_up_week_3?
      find('.timeline').has_css?('.timeline-panel', count: 4) &&
        has_text?("#{follow_up_week_three_title} information Contact " \
                  " At: #{DateTime.now.strftime('%B %d, %Y')}") &&
        has_text?('Session Length: 120')
    end

    def has_call_to_schedule_final_appt?
      find('.timeline').has_css?('.timeline-panel', count: 5) &&
        has_text?("#{call_to_schedule_final_title} Date/time" \
                  " of phone call: #{DateTime.now.strftime('%B %d, %Y')}")
    end

    def has_final_appointment?
      find('.timeline').has_css?('.timeline-panel', count: 6) &&
        has_text?("#{final_appointment_title} Date and time: " \
                  "#{DateTime.now.strftime('%B %d, %Y')}") &&
        has_text?('Location: 100 West Ln, Chicago, IL 60601 Was the' \
                  ' phone returned?:')
    end

    def has_phone_additional_contact?
      find('.timeline')
        .has_css?('.timeline-panel', text: additional_contact_title_alt) &&
          has_text?('Type: phone call')
    end

    def has_in_person_additional_contact?
      find('.timeline')
        .has_css?('.timeline-panel', text: additional_contact_title_alt) &&
          has_text?('Type: in person')
    end

    def edit_confirmation_call
      edit_session(confirmation_call_title)
    end

    def edit_initial_appointment
      edit_session(initial_appointment_title)
    end

    def edit_follow_up_week_1
      edit_session(follow_up_week_one_title)
    end

    def edit_follow_up_week_3
      edit_session(follow_up_week_three_title)
    end

    def edit_call_to_schedule_final_appt
      edit_session(call_to_schedule_final_title)
    end

    def edit_final_appointment
      edit_session(final_appointment_title)
    end

    def has_updated_session_length?
      find('.timeline-panel', text: @session)
        .has_text? "Session length (minutes): #{@session_length}"
    end

    def has_updated_call_length?
      find('.timeline-panel', text: @session)
        .has_text? "Session Length: #{@session_length}"
    end

    def has_updated_phone_return?
      find('.timeline-panel', text: final_appointment_title)
        .has_text? 'Was the phone returned?: No'
    end

    def has_updated_contact_at?
      find('.timeline-panel', text: @session)
        .has_text? 'Date/time of phone call: ' \
                   "#{Date.today.strftime('%B %d, %Y')}"
    end

    def has_contact_information_title?
      has_css?('h2', text: contact_information_title)
    end

    def has_smartphone_information_title?
      has_css?('h2', text: smartphone_information_title)
    end

    def has_contact_information_table_headings?
      table = find('#contact-info')
      actual_headings = (0..8).map { |i| table.all('strong')[i].text }
      expect(actual_headings).to eq(expected_headings)
    end

    def has_timeline_titles?
      actual_titles = (0..8).map { |i| all('.timeline-title')[i].text }
      expect(actual_titles).to eq(expected_timeline_titles)
    end

    def has_contact_dates?
      actual_contact_dates = (0..8).map do |i|
        year = Date.today.strftime('%Y')
        string = all('.timeline-heading')[i].find('p').text
        string.slice(0..(string.index(year.to_s) + (year.length - 1)))
      end
      expect(actual_contact_dates).to eq(expected_contact_info_contact_dates)
    end

    def has_timeline_headings?
      timeline = find('.timeline')
      actual_headings = (0..8).map { |i| timeline.all('strong')[i].text }
      expect(actual_headings).to eq(expected_timeline_headings)
    end

    private

    def edit_session(session)
      find('.timeline-panel', text: session).find('.fa-edit').click
    end
  end
end
