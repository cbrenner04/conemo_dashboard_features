# filename: ./spec/support/nurse/clinican_summary_helper.rb

require './lib/pages/navigation'
require './lib/pages/your_patients/clinical_summary'

def navigation
  @navigation ||= Navigation.new
end

def clinical_summary
  @clinical_summary ||= YourPatients::ClinicalSummary.new(id: 'fake')
end

def pt_343_clinical_summary
  @pt_343_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 343,
    first_message: 'I need some help, please',
    second_message: 'Help!'
  )
end

def pt_300_clinical_summary
  @pt_300_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 300,
    current_lesson: 1
  )
end

def pt_401_clinical_summary
  @pt_401_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 401,
    current_lesson: 2,
    other_lesson: 1
  )
end

def pt_312_clinical_summary
  @pt_312_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 312,
    current_lesson: 3,
    other_lesson: 2
  )
end

def pt_410_clinical_summary
  @pt_410_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 410,
    current_lesson: 4,
    other_lesson: 3
  )
end

def pt_323_clinical_summary
  @pt_323_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 323,
    current_lesson: 5,
    other_lesson: 4
  )
end

def pt_420_clinical_summary
  @pt_420_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 420,
    current_lesson: 6,
    other_lesson: 5
  )
end

def pt_430_clinical_summary
  @pt_430_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 430,
    current_lesson: 7,
    other_lesson: 6
  )
end

def pt_440_clinical_summary
  @pt_440_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 440,
    current_lesson: 8,
    other_lesson: 7
  )
end

def pt_450_clinical_summary
  @pt_450_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 450,
    current_lesson: 9,
    other_lesson: 8
  )
end

def pt_460_clinical_summary
  @pt_460_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 460,
    current_lesson: 10,
    other_lesson: 9
  )
end

def pt_411_clinical_summary
  @pt_411_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 411,
    other_lesson: 1
  )
end

def pt_324_clinical_summary
  @pt_324_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 324,
    other_lesson: 2
  )
end

def pt_421_clinical_summary
  @pt_421_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 421,
    other_lesson: 3
  )
end

def pt_431_clinical_summary
  @pt_431_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 431,
    other_lesson: 4
  )
end

def pt_441_clinical_summary
  @pt_441_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 441,
    other_lesson: 5
  )
end

def pt_451_clinical_summary
  @pt_451_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 451,
    other_lesson: 6
  )
end

def pt_461_clinical_summary
  @pt_461_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 461,
    other_lesson: 7
  )
end

def pt_471_clinical_summary
  @pt_471_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 471,
    other_lesson: 8
  )
end

def pt_480_clinical_summary
  @pt_480_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 480,
    other_lesson: 9
  )
end

def pt_490_clinical_summary
  @pt_490_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 490,
    other_lesson: 10
  )
end

def pt_402_clinical_summary
  @pt_402_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 402,
    other_lesson: 1
  )
end

def pt_317_clinical_summary
  @pt_317_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 317,
    other_lesson: 2
  )
end

def pt_412_clinical_summary
  @pt_412_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 412,
    other_lesson: 3
  )
end

def pt_326_clinical_summary
  @pt_326_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 326,
    other_lesson: 4
  )
end

def pt_422_clinical_summary
  @pt_422_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 422,
    other_lesson: 5
  )
end

def pt_432_clinical_summary
  @pt_432_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 432,
    other_lesson: 6
  )
end

def pt_442_clinical_summary
  @pt_442_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 442,
    other_lesson: 7
  )
end

def pt_452_clinical_summary
  @pt_452_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 452,
    other_lesson: 8
  )
end

def pt_462_clinical_summary
  @pt_462_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 462,
    other_lesson: 9
  )
end

def pt_472_clinical_summary
  @pt_472_clinical_summary ||= YourPatients::ClinicalSummary.new(
    id: 472,
    other_lesson: 10
  )
end
