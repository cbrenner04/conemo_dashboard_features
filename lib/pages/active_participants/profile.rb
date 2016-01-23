class ActiveParticipants
  # page object for profile page of active participants
  class Profile
    include Capybara::DSL
    include RSpec::Matchers

    def go_to_profile_of(name)
      click_on name
    end

    def visible_with_id?(id)
      date_1 = Date.today - ((30 * 365) + id.to_i)
      find('#contact-info',
           text: "Study Identifier: #{id} Family health unit name: Family " \
                 "Health Center Family record number: 33#{id} Phone: " \
                 "13333333#{id} Emergency Contact Name: Emergency Contact " \
                 'Phone: Email: Date of birth: ' \
                 "#{date_1.strftime('%B %d, %Y')}" \
                 ' Address: Enrollment date: ' \
                 "#{Date.today.strftime('%B %d, %Y')} Gender: female Key " \
                 'chronic disorder:')
    end

    def select_edit_contact_information
      find('#contact-info').find('.fa-edit').click
    end

    def select_edit_smartphone_information
      find('#smartphone-info').find('.fa-edit').click
    end

    def enter_smartphone_number(number)
      fill_in 'smartphone[number]', with: number
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
      expect(page)
        .to have_content 'First Contact Information Date of contact: ' \
                         "#{DateTime.now.strftime('%B %d, %Y %H:%M')}"
    end

    def has_first_appointment_information?
      find('.status-bar').has_css?('.visited.popover', count: 2)
      month = Date.today.strftime('%B')
      panel = page.all('.timeline-panel')[1].text
      s = if month == 'January' || month == 'October'
            panel[70..75]
          elsif month == 'February' || month == 'November' ||
                month == 'December'
            panel[71..76]
          elsif month == 'March' || month == 'April'
            panel[68..73]
          elsif month == 'May'
            panel[66..71]
          elsif month == 'June' || month == 'July'
            panel[67..72]
          elsif month == 'August'
            panel[69..74]
          elsif month == 'September'
            panel[72..77]
          end
      exp_hour = Time.now.strftime('%H')
      exp_min = Time.now.strftime('%M')
      act_hour = s.gsub(/:\w+/, '')
      act_min = s.gsub(/\w+:/, '')

      puts act_hour
      puts act_min

      subt_hour = exp_hour.to_i - act_hour.to_i
      subt_min = exp_min.to_i - act_min.to_i

      if subt_hour.between?(0, 1) && subt_min.between?(0, 1)
        expect(page)
          .to have_content 'First Appointment Information Appointment date/' \
                           "time: #{DateTime.now.strftime('%B %d, %Y')} " \
                           "#{act_hour.delete(' ')}:#{act_min.delete(' ')}" \
                           ' Location of appointment: 100 N Ln, Chicago, IL ' \
                           '60601 Session length (minutes): 120'
      else
        expect(subt_hour)
          .to be < 2, "Expected #{exp_hour.delete(' ')}:#{exp_min.delete(' ')}" \
                      " and actual #{act_hour.delete(' ')}:" \
                      "#{act_min.delete(' ')} time are not within 1 hour"
        expect(subt_min)
          .to be < 6, "Expected #{exp_hour.delete(' ')}:#{exp_min.delete(' ')}" \
                      " and actual #{act_hour.delete(' ')}:" \
                      "#{act_min.delete(' ')} time are not within 1 minute"
      end
    end

    def has_second_contact_information?
      find('.status-bar').has_css?('.visited.popover', count: 3)
      expect(page)
        .to have_content 'Second Contact Information Date of phone call: ' \
                         "#{DateTime.now.strftime('%B %d, %Y %H:%M')}" \
                         ' Length of phone call (minutes): 60'
    end

    def has_third_contact_information?
      find('.status-bar').has_css?('.visited.popover', count: 4)
      expect(page)
        .to have_content 'Third Contact Information Contact At: ' \
                         "#{DateTime.now.strftime('%B %d, %Y %H:%M')}" \
                         ' Length of phone call (minutes): 60'
    end

    def has_final_appointment_information?
      find('.status-bar').has_css?('.visited.popover', count: 5)
      expect(page)
        .to have_content 'Final Appointment Date and time: ' \
                         "#{DateTime.now.strftime('%B %d, %Y %H:%M')}" \
                         ' Location: 100 West Ln, Chicago, IL 60601 Was the' \
                         ' phone returned?:'
    end

    def edit_session(session)
      find('.timeline-panel', text: session).find('.fa-edit').click
    end
  end
end
