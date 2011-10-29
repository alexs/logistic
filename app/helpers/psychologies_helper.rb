# -*- coding: utf-8 -*-
module PsychologiesHelper
  def question_psychology(f,field,value)
   case value
   when 1
     @answer = "Mejor que antes"
   when 2
     @answer = "Igual que antes"
   when 3
     @answer = "Peor que antes"
   when 4
     @answer = "Mucho peor que antes"
   when 5
     @answer = "No"
   when 6
     @answer = "Como antes"
   when 7
     @answer = "Más que antes"
   when 8
     @answer = "Mucho más que antes"
   when 9
     @answer = "No más que antes"
   when 10
     @answer = "Como siempre"
   when 11
     @answer = "Más que siempre"
   when 12
     @answer = "Mucho más que siempre"
   when 13
     @answer = "Menos que antes"
   when 14
     @answer = "Mucho menos que antes"
   when 15
     @answer = "No, para nada"

   end
    options = f.radio_button(field,value) + @answer
    return options
  end

  def answer_psychology(value)
   case value
   when 1
     @answer = "Mejor que antes"
   when 2
     @answer = "Igual que antes"
   when 3
     @answer = "Peor que antes"
   when 4
     @answer = "Mucho peor que antes"
   when 5
     @answer = "No"
   when 6
     @answer = "Como antes"
   when 7
     @answer = "Más que antes"
   when 8
     @answer = "Mucho más que antes"
   when 9
     @answer = "No más que antes"
   when 10
     @answer = "Como siempre"
   when 11
     @answer = "Más que siempre"
   when 12
     @answer = "Mucho más que siempre"
   when 13
     @answer = "Menos que antes"
   when 14
     @answer = "Mucho menos que antes"
   when 15
     @answer = "No, para nada"
   else
     @answer = ""

   end
    return @answer
  end
end
