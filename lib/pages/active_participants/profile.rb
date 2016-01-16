class ActiveParticipants
  # page object for profile page of active participants
  class Profile
    include Capybara::DSL

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
                 "#{date_1.strftime('%B %-d, %Y')}" \
                 ' Address: Enrollment date: ' \
                 "#{Date.today.strftime('%B %-d, %Y')} Gender: female Key " \
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
  end
end
