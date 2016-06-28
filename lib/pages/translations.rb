# frozen_string_literal: true
# module for translations
module Translations
  def localize(thing)
    thing[@locale.to_sym]
  end

  def language
    @language ||= localize(
      spanish: 'Spanish',
      portuguese: 'Portuguese',
      english: 'English'
    )
  end

  def locale_hour(time)
    hour = time.strftime('%H')
    localize(
      spanish: " a las #{time.strftime('%I')}",
      portuguese: ", #{hour}",
      english: " #{hour}"
    )
  end

  def standard_date(date)
    day = date.strftime('%d')
    month = date.strftime('%B')
    year = date.strftime('%Y')
    localize(
      spanish: "#{spanish_weekdays[date.strftime('%A')]}, " \
               "#{day} de #{spanish_months[month]} del #{year}",
      portuguese: "#{day} de #{portuguese_months[month]} de #{year}",
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

  def health_unit_options
    @health_unit_options ||= {
      spanish: (1..10).map { |unit_id| "Centro de salud #{unit_id}" },
      portuguese: [
        'Adão Manoel', 'Celso Daniel', 'Dom João Nery', 'Jardim Campos',
        'Jardim Copa', 'Jardim Rubro II', 'Profeta Jeremias',
        'Santo Estevão', 'Silva Teles', 'Vila Ramos'
      ],
      english: (1..10).map { |unit_id| "unit #{unit_id}" }
    }
  end
end
