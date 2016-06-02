# frozen_string_literal: true
# module for expected headers in csvs
module AdminCSV
  HEADERS = [
    'Id', 'Email', 'Reset password sent at', 'Remember created at',
    'Sign in count', 'Current sign in at', 'Last sign in at',
    'Current sign in ip', 'Last sign in ip', 'Created at', 'Updated at',
    'Role', 'Phone', 'First name', 'Last name', 'Locale', 'Timezone', 'Type',
    'Nurse supervisor', 'Family health unit name', 'Confirmation token',
    'Confirmed at', 'Confirmation sent at', 'Unconfirmed email'
  ].freeze
end
