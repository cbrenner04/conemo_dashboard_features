# frozen_string_literal: true
require './lib/pages/translations'

module Translations
  # translations for navigation
  module NavigationTranslations
    include Translations

    def cancel_button
      localize(spanish: 'Cancelar', portuguese: 'Cancelar', english: 'Cancel')
    end

    def submit_button
      localize(spanish: 'Guardar', portuguese: 'Salvar', english: 'Save')
    end

    def confirm_button
      localize(
        spanish: 'Confirmar',
        portuguese: 'Confirmar',
        english: 'Confirm'
      )
    end

    def reschedule_button
      localize(
        spanish: 'Reprogramar',
        portuguese: 'Remarcar',
        english: 'Reschedule'
      )
    end
  end
end
