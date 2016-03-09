# filename: ./spec/support/nurse/your_patients_helper.rb

require './lib/pages/your_patients'

def your_patients
  @your_patients ||= YourPatients.new(locale: 'english')
end

def spanish_patients
  @spanish_patients ||= YourPatients.new(locale: 'spanish')
end

def portuguese_patients
  @portuguese_patients ||= YourPatients.new(locale: 'portuguese')
end

def patient_427
  @patient_427 ||= YourPatients.new(pt_id: 427)
end

def patient_300
  @patient_300 ||= YourPatients.new(pt_id: 300)
end
