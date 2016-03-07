class YourPatients
  # page object for nurse tasks page
  class NurseTasks
    include Capybara::DSL

    def initialize(nurse_task)
      @pt_id ||= nurse_task[:pt_id]
      @session ||= nurse_task[:session]
      @session_length ||= nurse_task[:session_length]
      @time_of_contact ||= nurse_task[:time_of_contact]
    end

    def open
      find('a', text: @pt_id).click
    end

    def mark_help_request_resolved
      mark_resolved('Help request')
    end

    def mark_lack_of_connectivity_resolved
      mark_resolved('Lack of connectivity call')
    end

    def mark_non_adherence_resolved
      mark_resolved('Non adherence call')
    end

    def contact_supervisor_for_help_request
      contact_supervisor('Help request')
    end

    def contact_supervisor_for_lack_of_connectivity
      contact_supervisor('Lack of connectivity call')
    end

    def contact_supervisor_for_non_adherence
      contact_supervisor('Non adherence call')
    end

    def clear_supervisor_contact
      find('input[value = "clear"]').click
      accept_alert 'are you sure you want to clear this?'
    end

    def has_confirmation_call_task_active?
      has_list_item?('Confirmation call')
      has_active_progress_bar_item?('Confirmation call')
    end

    def has_confirmation_call_task_complete?
      has_no_list_item?('Confirmation call')
      has_complete_progress_bar_item?('Confirmation call')
    end

    def has_initial_in_person_appt_task_active?
      has_list_item?('Initial in person appointment')
      has_active_progress_bar_item?('Initial in person appointment')
    end

    def has_initial_in_person_appt_task_complete?
      has_no_list_item?('Initial in person appointment')
      has_complete_progress_bar_item?('Initial in person appointment')
    end

    def enter_session_length
      fill_in "#{@session}[session_length]", with: @session_length
    end

    def has_new_follow_up_week_1_task?
      if has_text? '1 minute ago'
        has_list_item?('Follow up call week one 1 minute ago')
      else
        has_list_item?('Follow up call week one less than a minute ago')
      end
    end

    def has_follow_up_week_1_task_active?
      has_list_item?('Follow up call week one')
      has_active_progress_bar_item?('Follow up call week one')
    end

    def has_follow_up_week_1_task_complete?
      has_no_list_item?('Follow up call week one')
      has_complete_progress_bar_item?('Follow up call week one')
    end

    def has_new_follow_up_week_3_task?
      has_list_item?('Follow up call week three in 14 days')
    end

    def has_follow_up_week_3_task_active?
      has_list_item?('Follow up call week three')
      has_active_progress_bar_item?('Follow up call week three')
    end

    def has_follow_up_week_3_task_complete?
      has_no_list_item?('Follow up call week three')
      has_complete_progress_bar_item?('Follow up call week three')
    end

    def has_new_call_to_schedule_final_appt_task?
      has_list_item?('Call to schedule final appointment in about 1 month')
    end

    def has_call_to_schedule_final_appt_task_active?
      has_list_item?('Call to schedule final appointment')
      has_active_progress_bar_item?('Call to schedule final appointment')
    end

    def has_call_to_schedule_final_appt_task_complete?
      has_no_list_item?('Call to schedule final appointment')
      has_complete_progress_bar_item?('Call to schedule final appointment')
    end

    def has_final_appt_task_active?
      has_list_item?('Final in person appointment')
      has_active_progress_bar_item?('Final in person appointment')
    end

    def has_final_appt_task_complete?
      has_no_list_item?('Final in person appointment')
      has_complete_progress_bar_item?('Final in person appointment')
    end

    def select_non_date_item(item)
      find('.select2-result-label', text: item).click
    end

    def enter_location(selector_num)
      sleep(1)
      selector = all('.select2-container')
      selector[selector_num].click
      location = ['Patient\'s home', 'Health unit', 'Other location'].sample
      select_non_date_item(location)
    end

    def select_ability
      selector = all('.select2-container')
      selector[10].click
      ability = ['3 - Seems to be able to use the application',
                 '2 - Seems to have some difficulties',
                 '1 - Seems to have great difficulty'].sample
      select_non_date_item(ability)
    end

    def select_motivation
      selector = all('.select2-container')
      selector[11].click
      motivation = ['3 – Very interested', '2 – Somewhat interested',
                    '1 – Not interested'].sample
      select_non_date_item(motivation)
    end

    def has_help_request_active?
      has_list_item?('Help request')
    end

    def has_lack_of_connectivity_active?
      has_list_item?('Lack of connectivity call')
    end

    def has_non_adherence_active?
      has_list_item?('Non adherence call')
    end

    def has_new_supervisor_contact?
      has_supervisor_contact?(Time.now)
    end

    def has_previous_supervisor_contact?
      has_supervisor_contact?(@time_of_contact)
    end

    private

    def mark_resolved(type)
      find('.list-group-item', text: type)
        .find('input[value = "Mark as resolved"]').click
    end

    def contact_supervisor(type)
      find('.list-group-item', text: type)
        .find('input[value = "Contact Supervisor"]').click
      accept_alert 'are you sure you want to notify the supervisor that you ' \
                   'need help?'
    end

    def has_supervisor_contact?(time)
      has_text? 'last supervisor contact sent ' \
                "#{Date.today.strftime('%B %d, %Y')} #{time.strftime('%H')}"
    end

    def cancel(type)
      find('.list-group-item', text: type)
        .find('input[value = "Cancel"]').click
    end

    def has_list_item?(text)
      has_css?('.list-group-item', text: text)
    end

    def has_no_list_item?(text)
      has_no_css?('.list-group-item', text: text)
    end

    def has_active_progress_bar_item?(text)
      has_css?('.progress-bar-warning', text: text)
    end

    def has_complete_progress_bar_item?(text)
      has_css?('.progress-bar-success', text: text)
    end
  end
end
