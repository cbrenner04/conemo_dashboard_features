# frozen_string_literal: true
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

def patient_427
  @patient_427 ||= YourPatients.new(pt_id: 427)
end

def participant_501
  @participant_501 ||= YourPatients.new(
    pt_id: 501,
    locale: 'spanish'
  )
end

def participant_502
  @participant_502 ||= YourPatients.new(
    pt_id: 502,
    locale: 'spanish'
  )
end

def participant_601
  @participant_601 ||= YourPatients.new(
    pt_id: 601,
    locale: 'portuguese'
  )
end

def participant_602
  @participant_602 ||= YourPatients.new(
    pt_id: 602,
    locale: 'portuguese'
  )
end

def patient_703
  @patient_703 ||= YourPatients.new(pt_id: 703)
end

def patient_706
  @patient_706 ||= YourPatients.new(pt_id: 706)
end

def patient_707
  @patient_707 ||= YourPatients.new(pt_id: 707)
end

def patient_708
  @patient_708 ||= YourPatients.new(pt_id: 708)
end

def patient_709
  @patient_709 ||= YourPatients.new(pt_id: 709)
end

def patient_800
  @patient_800 ||= YourPatients.new(pt_id: 800)
end

def patient_801
  @patient_801 ||= YourPatients.new(pt_id: 801)
end

def patient_802
  @patient_802 ||= YourPatients.new(pt_id: 802)
end

def patient_803
  @patient_803 ||= YourPatients.new(pt_id: 803)
end

def patient_804
  @patient_804 ||= YourPatients.new(pt_id: 804)
end

def patient_1000
  @patient_1000 ||= YourPatients.new(pt_id: 1000)
end
