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

def patient_302
  @patient_302 ||= YourPatients.new(pt_id: 302)
end

def patient_312
  @patient_312 ||= YourPatients.new(pt_id: 312)
end

def patient_322
  @patient_322 ||= YourPatients.new(pt_id: 322)
end

def patient_330
  @patient_330 ||= YourPatients.new(pt_id: 330)
end

def patient_703
  @patient_703 ||= YourPatients.new(pt_id: 703)
end

def patient_344
  @patient_344 ||= YourPatients.new(pt_id: 344)
end

def patient_404
  @patient_404 ||= YourPatients.new(pt_id: 404)
end

def patient_414
  @patient_414 ||= YourPatients.new(pt_id: 414)
end

def patient_421
  @patient_421 ||= YourPatients.new(pt_id: 421)
end
