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
    lesson: 1
  )
end
