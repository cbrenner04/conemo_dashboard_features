# frozen_string_literal: true
require './lib/pages/navigation'
require './lib/pages/translations'

module Supervisor
  # page object for supervision note in the nurse supervisor page
  class SupervisionNote
    include Capybara::DSL
    include Translations

    def initialize(supervision_note)
      @note ||= supervision_note[:note]
      @locale ||= supervision_note.fetch(:locale, 'english')
    end

    def create_supervision_note
      find('.fa-edit').click
      fill_in 'supervisor_note[note]', with: @note
      navigation.submit
    end

    def has_supervision_note?
      find('.table', match: :first)
      first('.table').has_text?("#{@note}\n#{standard_date(today)}") &&
        has_css?('.alert', text: 'Supervisor note was successfully created')
    end

    private

    def navigation
      Navigation.new(locale: @locale)
    end
  end
end
