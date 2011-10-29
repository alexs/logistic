# -*- coding: utf-8 -*-
module ViolenciesHelper
  def question_violence(f,field,value)
   case value
   when 1
     @answer = "Si"
   when 2
     @answer = "No"
   when 3
     @answer = "No sé"
   when 4
     @answer = "Solo en una ocasion"
   when 5
     @answer = "En una semana"
   when 6
     @answer = "En un mes"
   when 7
     @answer = "En un año"
   end
    options = f.radio_button(field,value) + @answer
    return options
  end

   def answer(value)
   case value
   when 1
     @answer = "Si"
   when 2
     @answer = "No"
   when 3
     @answer = "No sé"
   when 4
     @answer = "Solo en una ocasion"
   when 5
     @answer = "En una semana"
   when 6
     @answer = "En un mes"
   when 7
     @answer = "En un año"
   end
    return @answer
  end

end
