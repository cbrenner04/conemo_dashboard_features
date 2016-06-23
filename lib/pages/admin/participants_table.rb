# frozen_string_literal: true
require './lib/pages/translations'

module Admin
  # page object for participants table in rails Admin
  class ParticipantsTable
    include Capybara::DSL
    include Translations

    def initialize(participants_table)
      @locale ||= participants_table.fetch(:locale, 'english')
    end

    def open
      first('a', text: localize(spanish: 'Participantes',
                                portuguese: 'Participantes',
                                english: 'Participants')).click
      sleep(0.25)
    end

    def order_by_participant_id
      find('th', text: localize(spanish: 'Código del participante',
                                portuguese: 'Identificação do participante (ID)',
                                english: 'Participant ID')).click
      sleep(0.25)
    end

    def has_phone_id?
      has_css?('th', text: 'Phone identifier') &&
        first('tr', text: 'Last-100')
          .has_css?('.phone_identifier_field', text: '1234')
    end
  end
end
