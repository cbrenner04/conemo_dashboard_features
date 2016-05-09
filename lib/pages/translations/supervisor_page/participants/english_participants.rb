module Translations
  module SupervisorPageTranslations
    module ParticipantsTranslations
      # english translations for Participants section of Supervisor Page
      module EnglishParticipants
        def english_pending_headers
          @english_pending_headers ||= [
            'Edit Information',
            'Name',
            'Study Identifier',
            'Date added to dashboard',
            'Activate'
          ]
        end

        def english_active_headers
          @english_active_headers ||= [
            'Edit Information',
            'Nurse',
            'Name',
            'Study Identifier',
            'Date added to dashboard',
            'Treatment termination'
          ]
        end

        def english_completed_headers
          @english_completed_headers ||= [
            'Nurse',
            'Name',
            'Study Identifier',
            'Date added to dashboard'
          ]
        end

        def english_dropped_headers
          @english_dropped_headers ||= [
            'Nurse',
            'Name',
            'Study Identifier',
            'Date added to dashboard'
          ]
        end
      end
    end
  end
end
