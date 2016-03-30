# page object for Nurse Supervisor landing page
class SupervisorPage
  include RSpec::Matchers
  include Capybara::DSL

  def initialize(supervisor_page)
    @pt_id ||= supervisor_page[:pt_id]
  end

  def has_nurses?
    [400, 401, 402, 403, 404].all? do |i|
      has_css?('h4', text: "Nurse-#{i}, English")
    end
  end

  def has_home_page_visible?
    has_css?('h3', text: 'Participants')
  end

  def has_total_completed?
    has_css?('.panel-heading', text: '12 Completed')
  end

  def has_total_dropped_out?
    has_css?('.panel-heading', text: '14 Dropped out')
  end

  def has_updated_completed?
    has_css?('.panel-heading', text: '13 Completed')
  end

  def has_new_completed_participant_information?
    has_css?('tr',
             text: 'Nurse-400, English Last-341, First 341 ' \
                   "#{(Date.today - 39).strftime('%B %d, %Y')} " \
                   "#{(Date.today - 39).strftime('%B %d, %Y')}")
  end

  def has_completed_participant_information?
    completed_table = find('.panel', text: 'Completed').find('.table')
    within completed_table do
      actual_rows = (1..12).map { |i| all('tr')[i].text }
      expected_rows_1 = (1..6).map do |i|
        "Nurse-401, English Last-#{4040 + i}, First #{4040 + i} " \
        "#{(Date.today - (10 + i)).strftime('%B %d, %Y')} " \
        "#{(Date.today - (13 + i)).strftime('%B %d, %Y')}"
      end
      expected_rows_2 = (7..12).map do |i|
        "Nurse-403, English Last-#{4040 + i}, First #{4040 + i} " \
        "#{(Date.today - (10 + i)).strftime('%B %d, %Y')} " \
        "#{(Date.today - (13 + i)).strftime('%B %d, %Y')}"
      end
      expected_rows = expected_rows_1.concat expected_rows_2
      actual_rows.should =~ expected_rows
    end
  end

  def has_dropped_participant_information?
    dropped_table = find('.panel', text: 'Dropped out').find('.table')
    within dropped_table do
      actual_rows = (1..14).map { |i| all('tr')[i].text }
      expected_rows_1 = (1..12).map do |i|
        "Last-#{201 + i}, First #{201 + i} " \
        "#{(Date.today - (4 + i)).strftime('%B %d, %Y')}"
      end
      expected_rows_2 = [
        "Last-200, First 200 #{Date.today.strftime('%B %d, %Y')}",
        "Last-201, First 201 #{Date.today.strftime('%B %d, %Y')}"
      ]
      expected_rows = expected_rows_1.concat expected_rows_2
      actual_rows.should =~ expected_rows
    end
  end

  def has_call_to_schedule_final_canceled?
    canceled? 'Call to schedule final in person appointment'
  end

  def has_confirmation_call_canceled?
    canceled? 'Confirmation call'
  end

  def has_final_appointment_canceled?
    canceled? 'Final in person appointment'
  end

  def has_follow_up_week_1_canceled?
    canceled? 'Follow up call week 1'
  end

  def has_follow_up_week_3_canceled?
    canceled? 'Follow up call week 3'
  end

  def has_initial_appointment_canceled?
    canceled? 'Initial in person appointment'
  end

  private

  def canceled?(title)
    panel = if has_css?('.panel', text: 'Nurse-400, English', count: 2)
              all('.panel', text: 'Nurse-400, English')[1]
            else
              find('.panel', text: 'Nurse-400, English')
            end
    panel.has_css?('.text-warning',
                   text: "Participant #{@pt_id} #{title} cancelled")
  end
end
