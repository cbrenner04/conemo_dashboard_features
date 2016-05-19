# filename: ./spec/features/super_user/administration_spec.rb

require './lib/pages/administration'

def administration
  @administration ||= Administration.new(locale: 'english')
end

def spanish_administration
  @spanish_administration ||= Administration.new(locale: 'spanish')
end

def portuguese_administration
  @portuguese_administration ||= Administration.new(locale: 'portuguese')
end

feature 'Super User, Login', metadata: :not_first do
  scenario 'Super User can access lessons across locales' do
    superuser.sign_in
    visit administration.lessons_page

    expect(administration).to be_on_lessons_page

    visit spanish_administration.lessons_page

    expect(spanish_administration).to be_on_lessons_page

    visit portuguese_administration.lessons_page

    expect(portuguese_administration).to be_on_lessons_page
  end
end
