module Translations
  module ClinicalSummaryTranslations
    # English translations for clinical summary page
    module LocalizedSummary
      def headers
        @headers ||= {
          spanish: [
            'Fecha de lanzamiento',
            'Sesión',
            'Notas Write note'
          ],
          portuguese: [
            'Sessão enviada em',
            'Sessão',
            'Anotações Write note'
          ],
          english: [
            'Release day',
            'Lesson',
            'Notes Write note'
          ]
        }
      end

      def legend
        @legend ||= {
          spanish: [
            'Sesión todavía no entregada', 'Sesión actual',
            'Sesión finalizada tarde', 'Sesión accedida, pero no finalizada',
            'Sesión no accedida', 'Sesión finalizada a tiempo'
          ],
          portuguese: [
            'Ainda não enviada', 'Atual', 'Concluída com atraso',
            'Acessada mas não concluída', 'Não acessada', 'Concluída em tempo'
          ],
          english: [
            'Unreleased', 'Current', 'Completed late',
            'Accessed but not completed', 'Not accessed', 'Completed on time'
          ]
        }
      end

      def notes_form_headings
        @notes_form_headings ||= {
          spanish: "Escribir una nota de First Last-#{@id}",
          portuguese: "Escrever nota para First Last-#{@id}",
          english: "Create Note for First Last-#{@id}"
        }
      end

      def notes_form_labels
        @notes_form_labels ||= {
          spanish: ['Fecha / hora de nota', 'Notas'],
          portuguese: ['Data do contato', 'Anotações'],
          english: ['time of note', 'notes']
        }
      end

      def english_release_dates
        (1..15).map do |i|
          standard_date((today - @start_date_offset) + (i - 1))
        end
      end

      # def english_contact_dates
      #   [0, 14, 35, 42].map { |i| standard_date(today - i) }
      # end

      def portuguese_release_dates
        [1, 3, 6, 8, 10]
          .map { |i| standard_date((today - @start_date_offset) + (i - 1)) }
      end

      # def portuguese_contact_dates
      #   [0, 14, 35, 42].map { |i| standard_date(today - i) }
      # end

      def spanish_release_dates_1
        [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 24, 27, 29, 31, 34, 36, 38, 41]
          .map { |i| standard_date((today - @start_date_offset) + (i - 1)) }
      end

      def spanish_release_dates_2
        [1, 3, 6, 8, 10, 13, 15, 17, 20, 22, 27, 29, 31, 34, 36, 38, 41]
          .map { |i| standard_date((today - @start_date_offset) + (i - 1)) }
      end

      # def spanish_contact_dates
      #   [0, 14, 35, 42].map { |i| standard_date(today - i) }
      # end
    end
  end
end
