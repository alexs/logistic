# -*- coding: utf-8 -*-
module SocioeconomicsHelper
  def get_dormitorio(value)
    case value
    when 0
      "Vivienda en un cuarto"
    when 1
      "1 a 2"
    when 2
      "3"
    when 3
      "4 a más"
    else
      ""
    end
  end

  def get_income(value)
    case value
    when 0
      "Sin salario a - de 1 SM / de 1 a 3 dependientes"
    when 1
      "Sin salario a - de 1 SM / de 4 a 9 dependientes"
    when 2
      "Sin salario a - de 1 SM / más de 10 dependientes"
    when 3
      "1 SM a 1.5 SM / de 1 a 3 dependientes"
    when 4
      "1 SM a 1.5 SM / de 4 a 9 dependientes"
    when 5
      "1 SM a 1.5 SM / más de 10 dependientes"
    when 6
      "Más 1.5 SM a 3.0 SM / de 1 a 3 dependientes"
    when 7
      "Más 1.5 SM a 3.0 SM / de 4 a 9 dependientes"
    when 8
      "Más 1.5 SM a 3.0 SM / más de 10 dependientes"
    when 9
      "Más 3.0 SM a 4.5 SM / de 1 a 3 dependientes"
    when 10
      "Más 3.0 SM a 4.5 SM / de 4 a 9 dependientes"
    when 11
      "Más 3.0 SM a 4.5 SM / más de 10 dependientes"
    when 12
      "Más 4.5 SM / de 1 a 3 dependientes"
    when 13
      "Más 4.5 SM / de 4 a 9 dependientes"
    when 14
      "Más 4.5 SM / más de 10 dependientes"
    else
      ""
    end
  end
end
