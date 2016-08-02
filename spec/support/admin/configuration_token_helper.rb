# frozen_string_literal: true
require './lib/pages/administration'
require './lib/pages/admin/participants_table'
require './lib/pages/admin/token_page'

def administration
  @administration ||= Administration.new(
    locale: 'english'
  )
end

def participants_table
  @participants_table ||= Admin::ParticipantsTable.new(locale: 'english')
end

def token_page
  @token_page ||= Admin::TokenPage.new(
    locale: 'english',
    pt_id: 201
  )
end

def spanish_administration
  @spanish_administration ||= Administration.new(
    locale: 'spanish'
  )
end

def spanish_participants_table
  @spanish_participants_table ||= Admin::ParticipantsTable.new(
    locale: 'spanish'
  )
end

def spanish_token_page
  @spanish_token_page ||= Admin::TokenPage.new(
    locale: 'spanish',
    pt_id: 501
  )
end

def pt_514_token_page
  @pt_514_token_page || Admin::TokenPage.new(
    pt_id: 514,
    locale: 'spanish'
  )
end

def portuguese_administration
  @portuguese_administration ||= Administration.new(
    locale: 'portuguese'
  )
end

def portuguese_participants_table
  @portuguese_participants_table ||= Admin::ParticipantsTable.new(
    locale: 'portuguese'
  )
end

def portuguese_token_page
  @portuguese_token_page ||= Admin::TokenPage.new(
    locale: 'portuguese',
    pt_id: 601
  )
end
