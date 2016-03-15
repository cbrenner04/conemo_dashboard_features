require './lib/pages/shared/contact_information_form'
require './lib/pages/shared/translations/contact_information'

class YourPatients
  class NurseTasks
    # page object for profile page of active participants
    class ContactInformation
      include RSpec::Matchers
      include Capybara::DSL
      include ContactInformationForm
      include Translations::ContactInformation

      def initialize(contact_information)
        @id ||= contact_information[:id]
        @email ||= contact_information[:email]
        @session ||= contact_information[:session]
        @session_length ||= contact_information[:session_length]
        @locale ||= contact_information[:locale]
      end

      def open
        click_on 'Clinical Summary'
        click_on 'participant contact information page'
      end

      def on_page?
        has_text? profile_heading
      end

      def visible?
        date_1 = Date.today - ((30 * 365) + @id.to_i)
        has_css?('#contact-info',
                 text: "Study Identifier: #{@id} Family health unit name: " \
                       "Family Health Center Family record number: 33#{@id} " \
                       "Phone: 13333333#{@id} Emergency Contact Name: " \
                       'Emergency Contact Phone: Email: Date of birth: ' \
                       "#{date_1.strftime('%B %d, %Y')}" \
                       ' Address: Enrollment date: ' \
                       "#{Date.today.strftime('%B %d, %Y')} Gender: female " \
                       'Key chronic disorder:')
      end

      def select_edit_contact_information
        find('#contact-info').find('.fa-edit').click
      end

      def has_email_visible?
        has_text? "Email: #{@email}"
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
        has_text? 'Smartphone Information: 12345678901'
      end

      def has_confirmation_call?
        find('.timeline').has_css?('.timeline-panel', count: 1) &&
          has_text?('Confirmation call information Date of contact: ' \
                    "#{DateTime.now.strftime('%B %d, %Y')}")
      end

      def has_initial_appointment?
        find('.timeline').has_css?('.timeline-panel', count: 2) &&
          has_text?('Initial in person appointment information Appointment ' \
                    "date/time: #{DateTime.now.strftime('%B %d, %Y')} ")
      end

      def has_follow_up_week_1?
        find('.timeline').has_css?('.timeline-panel', count: 3) &&
          has_text?('Follow up call week 1 information Date of phone call: ' \
                    "#{DateTime.now.strftime('%B %d, %Y')}") &&
          has_text?('Length of phone call (minutes): 120')
      end

      def has_follow_up_week_3?
        find('.timeline').has_css?('.timeline-panel', count: 4) &&
          has_text?('Follow up call week 3 information Contact At: ' \
                    "#{DateTime.now.strftime('%B %d, %Y')}") &&
          has_text?('Length of phone call (minutes): 120')
      end

      def has_call_to_schedule_final_appt?
        find('.timeline').has_css?('.timeline-panel', count: 5) &&
          has_text?('Call to schedule final appointment Contact at: ' \
                    "#{DateTime.now.strftime('%B %d, %Y')}")
      end

      def has_final_appointment?
        find('.timeline').has_css?('.timeline-panel', count: 6) &&
          has_text?('Final in person appointment Date and time: ' \
                    "#{DateTime.now.strftime('%B %d, %Y')}") &&
          has_text?('Location: 100 West Ln, Chicago, IL 60601 Was the' \
                    ' phone returned?:')
      end

      def has_additional_contact?
        find('.timeline')
          .has_css?('.timeline-panel', text: 'Additional contact')
      end

      def edit_confirmation_call
        edit_session('Confirmation call')
      end

      def edit_initial_appointment
        edit_session('Initial in person appointment')
      end

      def edit_follow_up_week_1
        edit_session('Follow up call week 1')
      end

      def edit_follow_up_week_3
        edit_session('Follow up call week 3')
      end

      def edit_call_to_schedule_final_appt
        edit_session('Call to schedule final appointment')
      end

      def edit_final_appointment
        edit_session('Final in person appointment')
      end

      def has_updated_session_length?
        find('.timeline-panel', text: @session)
          .has_text? "Session length (minutes): #{@session_length}"
      end

      def has_updated_call_length?
        find('.timeline-panel', text: @session)
          .has_text? "Length of phone call (minutes): #{@session_length}"
      end

      def has_updated_phone_return?
        find('.timeline-panel', text: 'Final in person appointment')
          .has_text? 'Was the phone returned?: No'
      end

      def has_updated_contact_at?
        find('.timeline-panel', text: @session)
          .has_text? "Contact at: #{Date.today.strftime('%B %d, %Y')}"
      end

      def has_contact_information_title?
        has_css?('h2', text: locale('Información de contacto',
                                    'Informações de Contato',
                                    'Contact Information'))
      end

      def has_smartphone_information_title?
        has_css?('h2', text: locale('Smartphone', 'Informações de Smartphone',
                                    'Smartphone Information'))
      end

      def has_contact_information_table_headings?
        table = find('#contact-info')
        actual_headings = (0..11).map { |i| table.all('strong')[i].text }
        expect(actual_headings).to eq(expected_headings)
      end

      def has_timeline_titles?
        actual_titles = (0..5).map { |i| all('.timeline-title')[i].text }
        expect(actual_titles).to eq(expected_timeline_titles)
      end

      def has_contact_dates?
        actual_contact_dates = (0..5).map do |i|
          year = Date.today.strftime('%Y')
          string = all('.text-muted')[i].text
          string.slice(0..(string.index("#{year}") + (year.length - 1)))
        end
        expect(actual_contact_dates).to eq(expected_contact_dates)
      end

      def has_timeline_headings?
        timeline = find('.timeline')
        actual_headings = (0..5).map { |i| timeline.all('strong')[i].text }
        expect(actual_headings).to eq(expected_timeline_headings)
      end

      private

      def edit_session(session)
        find('.timeline-panel', text: session).find('.fa-edit').click
      end
    end
  end
end
