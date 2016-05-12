module Translations
  module SupervisorPageTranslations
    module NursesTranslations
      # module for Nurses on Supervisor page
      module EnglishNurses
        def english_questions_and_answers
          @english_questions_and_answers ||= [
            'Session length', 'Meeting kind', 'Group',
            'Individual ', 'Contact kind', 'Phone', 'In person',
            'Discussed topic(s)', 'First appointments',
            'Difficulty to contact patient', 'Non-resolved help requests',
            'Non connectivity calls', 'Non-adherence',
            'Patient’s difficulties with CONEMO',
            'Overdue tasks / Nurse adherence', 'Canceled tasks',
            'Serious adverse events (if nurse brings it up)', 'Dropouts',
            'Uncertainties related to tasks', 'Questions about intervention',
            'Other programmed contact points', 'Resolved help requests',
            'Difficult situations for the nurse related to the ' \
            'intervention/study', 'Administrative issues',
            'Additional contacts', 'Others'
          ]
        end

        def english_headers
          @english_headers ||= [
            'Session at',
            'Session length',
            'Meeting kind',
            'Contact kind',
            'Discussed topic(s)'
          ]
        end
      end
    end
  end
end
