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

  def locale_date(date)
    locale(spanish_date(date), portuguese_date(date), english_date(date))
  end

  def locale_month(month)
    locale(spanish_months[month], portuguese_months[month], month)
  end

  def locale_hour(time)
    locale(" a las #{time.strftime('%I')}", ", #{time.strftime('%H')}",
           " #{time.strftime('%H')}")
  end

  def english_date(date)
    date.strftime('%B %d, %Y')
  end

  def spanish_weekdays
    {
      'Monday' => 'lunes',
      'Tuesday' => 'martes',
      'Wednesday' => 'miércoles',
      'Thursday' => 'jueves',
      'Friday' => 'viernes',
      'Saturday' => 'sábado',
      'Sunday' => 'domingo'
    }
  end

  def spanish_months
    {
      'January' => 'enero',
      'February' => 'febrero',
      'March' => 'marzo',
      'April' => 'abril',
      'May' => 'mayo',
      'June' => 'junio',
      'July' => 'julio',
      'August' => 'agosto',
      'September' => 'septiembre',
      'October' => 'octubre',
      'November' => 'noviembre',
      'December' => 'diciembre'
    }
  end

  def spanish_date(date)
    "#{spanish_weekdays[date.strftime('%A')]}, #{date.strftime('%d')} " \
    "de #{spanish_months[date.strftime('%B')]} del #{date.strftime('%Y')}"
  end

  def portuguese_months
    {
      'January' => 'Janeiro',
      'February' => 'Fevereiro',
      'March' => 'Março',
      'April' => 'Abril',
      'May' => 'Maio',
      'June' => 'Junho',
      'July' => 'Julho',
      'August' => 'Agosto',
      'September' => 'Setembro',
      'October' => 'Outubro',
      'November' => 'Novembro',
      'December' => 'Dezembro'
    }
  end

  def portuguese_date(date)
    "#{date.strftime('%d')} de #{portuguese_months[date.strftime('%B')]} " \
    "de #{date.strftime('%Y')}"
  end
end
