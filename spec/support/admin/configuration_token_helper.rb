require './lib/pages/administration'
require './lib/pages/administration/token_page'

def administration
  @administration ||= Administration.new(
    locale: 'english'
  )
end

def token_page
  @token_page ||= Administration::TokenPage.new(
    locale: 'english',
    pt_id: 201
  )
end

def spanish_administration
  @spanish_administration ||= Administration.new(
    locale: 'spanish'
  )
end

def spanish_token_page
  @spanish_token_page ||= Administration::TokenPage.new(
    locale: 'spanish',
    pt_id: 501
  )
end

def portuguese_administration
  @portuguese_administration ||= Administration.new(
    locale: 'portuguese'
  )
end

def portuguese_token_page
  @portuguese_token_page ||= Administration::TokenPage.new(
    locale: 'portuguese',
    pt_id: 601
  )
end
