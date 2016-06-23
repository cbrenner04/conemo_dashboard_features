# frozen_string_literal: true
module Admin
  # page object for the devices table within Rails Admin
  class DevicesTable
    include Capybara::DSL

    def open
      find('a', text: 'Devices', match: :first)
      first('a', text: 'Devices').click
    end

    def has_five_devices?
      has_devices?([318, 319, 1000, 414, 415])
    end

    def has_four_devices?
      has_devices?([318, 319, 414, 415])
    end

    def open_inactive_devices_table
      first('a', text: 'Past device assignments').click
    end

    def has_one_inactive_device?
      has_device_count?(1)
    end

    private

    def has_devices?(participants)
      has_device_count?(participants.count) &&
        participants.all? do |participant|
          has_css?('.participant_field', text: participant)
        end
    end

    def has_device_count?(count)
      has_css?('tr', text: 'XT1032', count: count)
    end
  end
end
