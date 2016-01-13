# filename: ./spec/support/feature_helper.rb

def login
  @login ||= Login.new
end

def navigation
  @navigation ||= Navigation.new
end

def contact_information
  @contact_information ||= ContactInformation.new
end
