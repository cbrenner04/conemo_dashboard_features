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

  def spanish_weekdays(date)
    date.strftime('%A')
      .gsub('Monday', 'lunes')
      .gsub('Tuesday', 'martes')
      .gsub('Wednesday', 'miércoles')
      .gsub('Thursday', 'jueves')
      .gsub('Friday', 'viernes')
      .gsub('Saturday', 'sábado')
      .gsub('Sunday', 'domingo')
  end

  def spanish_months(date)
    date.strftime('%B')
      .gsub('January', 'enero')
      .gsub('February', 'febrero')
      .gsub('March', 'marzo')
      .gsub('April', 'abril')
      .gsub('May', 'mayo')
      .gsub('June', 'junio')
      .gsub('July', 'julio')
      .gsub('August', 'agosto')
      .gsub('September', 'septiembre')
      .gsub('October', 'octubre')
      .gsub('November', 'noviembre')
      .gsub('December', 'diciembre')
  end

  def spanish_date(date)
    day = date.strftime('%d')
    year = date.strftime('%Y')
    "#{spanish_weekdays(date)}, #{day} de #{spanish_months(date)} del #{year}"
  end

  def portuguese_months(date)
    date.strftime('%B')
      .gsub('January', 'Janeiro')
      .gsub('February', 'Fevereiro')
      .gsub('March', 'Março')
      .gsub('April', 'Abril')
      .gsub('May', 'Maio')
      .gsub('June', 'Junho')
      .gsub('July', 'Julho')
      .gsub('August', 'Agosto')
      .gsub('September', 'Setembro')
      .gsub('October', 'Outubro')
      .gsub('November', 'Novembro')
      .gsub('December', 'Dezembro')
  end

  def portuguese_date(date)
    day = date.strftime('%d')
    year = date.strftime('%Y')
    "#{day} de #{portuguese_months(date)} de #{year}"
  end
end
