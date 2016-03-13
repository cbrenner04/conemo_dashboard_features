# module for translations
module Translations

  def locale(a, b, c)
    if @locale == 'spanish'
      a
    elsif @locale == 'portuguese'
      b
    else
      c
    end
  end
end
