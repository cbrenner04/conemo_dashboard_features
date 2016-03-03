class YourPatients
  class NurseTasks
    # page object for call to schedule final appointment task
    class CallToScheduleFinalAppointment
      include Capybara::DSL

      def confirm
        find('.list-group-item', text: 'Call to schedule final appointment')
          .find('a', text: 'Confirm').click
      end

      def visible?
        has_css?('h1', text: 'Call to schedule final in person appointment')
      end

      def select_location
        sleep(1)
        selector = all('.select2-container')
        selector[10].click
        location = []
        (1..7).each { |i| location.push("unit #{i}") }
        find('.select2-result-label', text: location.sample).click
      end
    end
  end
end
