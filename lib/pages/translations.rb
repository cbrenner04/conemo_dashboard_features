# module for translations
module Translations
  def localize(thing)
    thing[@locale.to_sym]
  end

  def locale_hour(time)
    localize(
      spanish: " a las #{time.strftime('%I')}",
      portuguese: ", #{time.strftime('%H')}",
      english: " #{time.strftime('%H')}"
    )
  end

  def locale_date(date)
    localize(
      spanish: "#{spanish_weekdays[date.strftime('%A')]}, " \
               "#{date.strftime('%d')} " \
               "de #{spanish_months[date.strftime('%B')]} " \
               "del #{date.strftime('%Y')}",
      portuguese: "#{date.strftime('%d')} "  \
                  "de #{portuguese_months[date.strftime('%B')]} " \
                  "de #{date.strftime('%Y')}",
      english: date.strftime('%B %d, %Y')
    )
  end

  def locale_month(month)
    localize(
      spanish: spanish_months[month],
      portuguese: portuguese_months[month],
      english: month
    )
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
end
