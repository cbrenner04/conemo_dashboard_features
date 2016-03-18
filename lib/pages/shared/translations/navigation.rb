require './lib/pages/shared/translations'

module Translations
  # translations for navigation
  module NavigationTranslations
    include Translations

    def cancel_button
      locale('Cancelar', 'Cancelar', 'Cancel')
    end

    def submit_button
      locale('Guardar', 'Salvar', 'Save')
    end

    def confirm_button
      locale('Confirmar', 'Confirmar', 'Confirm')
    end

    def reschedule_button
      locale('Reprogramar', 'Remarcar', 'Reschedule')
    end
  end
end
