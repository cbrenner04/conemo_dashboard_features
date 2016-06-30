# frozen_string_literal: true
# filename: ./spec/support/date_time_helper

MIN_IN_HR = 60
SEC_IN_MIN = 60

def today
  Date.today
end

def yesterday
  today - 1
end

def tomorrow
  today + 1
end

def one_hour
  MIN_IN_HR * SEC_IN_MIN
end

def dst_time(time)
  now_dst = now.dst?
  time_dst = time.dst?
  if now_dst && time_dst
    time
  elsif !now_dst && time_dst
    time + one_hour
  else
    time - one_hour
  end
end

def now
  Time.now
end

def today_at_11_am
  noon = now + ((12 - now.hour) * one_hour) - (now.min * SEC_IN_MIN) - now.sec
  noon - one_hour
end
