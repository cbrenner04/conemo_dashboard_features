require './lib/pages/active_participants'

class ActiveParticipants
  # page object for second contact
  class SecondContact
    include Capybara::DSL

    def active_pt
      @active_pt ||= ActiveParticipants.new
    end

    def record_date_sched_next_fill_in_pt_qs
      find('h1', text: 'Second contact')
      active_pt.record_date_contact
      # active_pt.schedule_next_contact
      fill_in 'second_contact[q1]', with: 'q1 response'
      (2..7).each do |i|
        # radio = ['true', 'false'].sample
        # find("#second_contact_q#{i}_#{radio}").click
        fill_in "second_contact[q#{i}_notes]", with: "q#{i} notes"
      end
    end

    def select_ability
      selector = page.all('.select2-container')
      selector[10].click
      ability = ['3 - Seems to be able to use the application',
                 '2 - Seems to have some difficulties',
                 '1 - Seems to have great difficulty'].sample
      active_pt.select_item(ability)
    end

    def select_motivation
      selector = page.all('.select2-container')
      selector[11].click
      motivation = ['3 – Very interested', '2 – Somewhat interested',
                    '1 – Not interested'].sample
      active_pt.select_item(motivation)
    end

    def select_chances
      selector = page.all('.select2-container')
      selector[12].click
      chance = ['3 – Very probable', '2 – 50/50 (more or less probable)',
                '1 – Not probable'].sample
      active_pt.select_item(chance)
    end

    def enter_length_of_call(min)
      fill_in 'second_contact[session_length]', with: min
    end

    def enter_notes
      fill_in 'second_contact[notes]', with: 'Notes are so much fun'
    end

    def created_for_participant?(id)
      active_pt.pt_row(id).has_css?('.fa-check-circle', count: 3)
      second_contact = DateTime.now + 21
      active_pt.check_date_time(id, second_contact)
    end
  end
end
