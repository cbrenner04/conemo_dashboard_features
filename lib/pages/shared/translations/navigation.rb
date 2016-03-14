require './lib/pages/shared/translations'

module Translations
  # translations for navigation
  module NavigationTranslations
    include Translations

    def cancel_button
      locale('Cancelar', 'Cancelar', 'Cancel')
    end
  end
end
