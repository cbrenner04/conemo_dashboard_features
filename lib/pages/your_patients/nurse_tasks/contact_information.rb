class YourPatients
  class NurseTasks
    # page object for profile page of active participants
    class ContactInformation
      include Capybara::DSL

      def go_to_profile_of(name)
        click_on name
      end

      def visible_with_id?(id)
        date_1 = Date.today - ((30 * 365) + id.to_i)
        has_css?('#contact-info',
                 text: "Study Identifier: #{id} Family health unit name: " \
                       "Family Health Center Family record number: 33#{id} " \
                       "Phone: 13333333#{id} Emergency Contact Name: " \
                       'Emergency Contact Phone: Email: Date of birth: ' \
                       "#{date_1.strftime('%B %d, %Y')}" \
                       ' Address: Enrollment date: ' \
                       "#{Date.today.strftime('%B %d, %Y')} Gender: female " \
                       'Key chronic disorder:')
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

      def select_all_smartphone_radios
        find('#smartphone_is_smartphone_owner_true').click
        find('#smartphone_is_app_compatible_true').click
        find('#smartphone_is_owned_by_participant_true').click
      end

      def has_phone_form_present?
        has_css?('h1', text: 'Input Smartphone Information')
      end

      def has_first_contact_information?
        find('.status-bar').has_css?('.visited.popover', count: 1)
        has_text? 'First Contact Information Date of contact: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
      end

      def has_first_appointment_information?
        find('.status-bar').has_css?('.visited.popover', count: 2)
        has_text? 'First Appointment Information Appointment date/' \
                  "time: #{DateTime.now.strftime('%B %d, %Y')} "

        has_text? 'Location of appointment: 100 N Ln, Chicago, IL ' \
                  '60601 Session length (minutes): 120'
      end

      def has_second_contact_information?
        find('.status-bar').has_css?('.visited.popover', count: 3)
        has_text? 'Second Contact Information Date of phone call: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
        has_text? 'Length of phone call (minutes): 60'
      end

      def has_third_contact_information?
        find('.status-bar').has_css?('.visited.popover', count: 4)
        has_text? 'Third Contact Information Contact At: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
        expect(page).to have_content 'Length of phone call (minutes): 60'
      end

      def has_final_appointment_information?
        find('.status-bar').has_css?('.visited.popover', count: 5)
        has_text? 'Final Appointment Date and time: ' \
                  "#{DateTime.now.strftime('%B %d, %Y')}"
        has_text? 'Location: 100 West Ln, Chicago, IL 60601 Was the' \
                  ' phone returned?:'
      end

      def edit_session(session)
        find('.timeline-panel', text: session).find('.fa-edit').click
      end
    end
  end
end
