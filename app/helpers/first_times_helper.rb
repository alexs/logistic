# -*- coding: undecided -*-
module FirstTimesHelper
  def question2(f,field,value)
   case value
   when 1
     @answer = "Formado"
   when 2
     @answer = "Plano"
   when 3
     @answer = "Invertido"
   when 4
     @answer = "Orales"
   when 5
     @answer = "Inyectables"
   when 6
     @answer = "DIU"
   when 7
     @answer = "OTB"
   when 8
     @answer = "2do Nivel"
   when 9
     @answer = "3er nivel"
   when 10
     @answer = "Bueno"
   when 11
     @answer = "Malo"
   when 12
     @answer = "Incierto"
   when 13
     @answer = "Longitudinal"
   when 14
     @answer = "Trasverso"
   when 15
     @answer = "Oblicuo"
   when 16
     @answer = "Derecha"
   when 17
     @answer = "Izquierda"
   when 18
     @answer = "Presentes"
   when 19
     @answer = "Disminuidos"
   when 20
     @answer = "Ausentes"
   end
    options = f.radio_button(field,value) + @answer
    return options
  end

  def answer_subsequent(value)
   case value
   when 1
     @answer = "Formado"
   when 2
     @answer = "Plano"
   when 3
     @answer = "Invertido"
   when 4
     @answer = "Orales"
   when 5
     @answer = "Inyectables"
   when 6
     @answer = "DIU"
   when 7
     @answer = "OTB"
   when 8
     @answer = "2do Nivel"
   when 9
     @answer = "3er nivel"
   when 10
     @answer = "Bueno"
   when 11
     @answer = "Malo"
   when 12
     @answer = "Incierto"
   when 13
     @answer = "Longitudinal"
   when 14
     @answer = "Trasverso"
   when 15
     @answer = "Oblicuo"
   when 16
     @answer = "Derecha"
   when 17
     @answer = "Izquierda"
   when 18
     @answer = "Presentes"
   when 19
     @answer = "Disminuidos"
   when 20
     @answer = "Ausentes"
   end
    return @answer
  end
end
