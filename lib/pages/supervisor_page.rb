# page object for Nurse Supervisor landing page
class SupervisorPage
  include Capybara::DSL

  def has_nurses?
    [400, 401, 402, 403, 404].all? do |i|
      has_css?('h4', text: "Nurse-#{i}, English")
    end
  end

  def has_home_page_visible?
    has_css?('h3', text: 'Participants')
  end
end
