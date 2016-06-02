# frozen_string_literal: true
# filename: ./spec/support/date_helper

def today
  @today ||= Date.today
end

def yesterday
  @yesterday ||= today - 1
end

def tomorrow
  @tomorrow ||= today + 1
end
