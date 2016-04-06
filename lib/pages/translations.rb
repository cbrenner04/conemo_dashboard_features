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

  def spanish_weekdays
    @spanish_weekdays ||= {
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
    @spanish_months ||= {
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
    @portuguese_months ||= {
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
