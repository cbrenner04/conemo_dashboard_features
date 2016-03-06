require './lib/pages/shared/contact_information_form'

class YourPatients
  class NurseTasks
    # page object for profile page of active participants
    class ContactInformation
      include Capybara::DSL
      include ContactInformationForm

      def initialize(contact_information)
        @id ||= contact_information[:id]
        @email ||= contact_information[:email]
        @session ||= contact_information[:session]
        @session_length ||= contact_information[:session_length]
      end

      def open
        sleep(1)
        path = current_url.gsub('participants/', 'active/participants/')
        visit path.gsub('/tasks', '')
      end

      def on_page?
        has_text? "Profile for First Last-#{@id}"
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

      # def has_phone_form_present?
      #   has_css?('h1', text: 'Input Smartphone Information')
      # end

      def enter_smartphone_number
        fill_in 'smartphone[number]', with: '12345678901'
      end

      def select_all_smartphone_radios
        find('#smartphone_is_smartphone_owner_true').click
        find('#smartphone_is_app_compatible_true').click
        find('#smartphone_is_owned_by_participant_true').click
      end

      def has_smartphone_information?
        has_text? 'Smartphone Information: 12345678901'
      end

      def has_confirmation_call?
        find('.status-bar').has_css?('.visited.popover', count: 1)
        has_text? 'Confirmation call information Date of contact: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      def has_initial_appointment?
        find('.status-bar').has_css?('.visited.popover', count: 2)
        has_text? 'Initial in person appointment information Appointment ' \
                  "date/time: #{DateTime.now.strftime('%B %d, %Y')} "
      end

      def has_follow_up_week_1?
        find('.status-bar').has_css?('.visited.popover', count: 3)
        has_text? 'Follow up call week 1 information Date of phone call: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
        has_text? 'Length of phone call (minutes): 120'
      end

      def has_follow_up_week_3?
        find('.status-bar').has_css?('.visited.popover', count: 4)
        has_text? 'Follow up call week 3 information Contact At: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
        has_text? 'Length of phone call (minutes): 120'
      end

      def has_final_appointment?
        find('.status-bar').has_css?('.visited.popover', count: 5)
        has_text? 'Final in person appointment Date and time: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
        has_text? 'Location: 100 West Ln, Chicago, IL 60601 Was the' \
                  ' phone returned?:'
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

      private

      def edit_session(session)
        find('.timeline-panel', text: session).find('.fa-edit').click
      end
    end
  end
end
