require './lib/pages/your_patients/nurse_tasks'

class YourPatients
  class NurseTasks
    # page object for the First Appointment Form in Active Participants
    class InitialInPersonAppointment
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Initial in person appointment')
          .find('a', text: 'Confirm').click
      end

      def visible?
        has_css?('h1', text: 'Initial in person appointment')
      end

      def enter_location
        fill_in 'first_appointment[appointment_location]',
                with: '100 N Ln, Chicago, IL 60601'
      end

      def select_pt_comfort_with_phone
        selector = all('.select2-container')
        selector[10].click
        comfort = [
          '4 – Patient can turn on the cell phone',
          '3 – After FIRST demonstration patient needs help',
          '2 – After SECOND demonstration patient needs help',
          '1 – Continues to have difficulties after THIRD demonstration'
        ].sample
        nurse_tasks.select_non_date_item(comfort)
      end

      def enter_phone_note
        fill_in 'first_appointment[smart_phone_comfort_note]',
                with: 'Taking phone notes is boring'
      end

      def select_engagement
        selector = page.all('.select2-container')
        selector[11].click
        engagement = ['3 – Very engaged', '2 – More or less engaged',
                      '1 – Not engaged'].sample
        nurse_tasks.select_non_date_item(engagement)
      end

      def select_chances
        selector = page.all('.select2-container')
        selector[12].click
        chance = [
          '3 – high chance',
          '2 – 50/50 chance',
          '1 – low chance'
        ].sample
        nurse_tasks.select_non_date_item(chance)
      end

      def general_notes
        'Who takes notes?'
      end

      def enter_general_notes
        fill_in 'first_appointment[notes]', with: general_notes
      end

      # def created_for_participant?(id)
      #   your_patients.pt_row(id).has_css?('.fa-check-circle', count: 2)
      #   date = DateTime.now + 7
      #   your_patients.check_date(id, date)
      # end

      private

      def nurse_tasks
        @nurse_tasks ||= YourPatients::NurseTasks.new(pt_id: 'fake')
      end
    end
  end
end
