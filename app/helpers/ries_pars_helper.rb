module RiesParsHelper
  def questions(f,field,value)
   case value
   when 1
     @answer = "En total desacuerdo"
   when 2
     @answer = "En desacuerdo"
   when 3
     @answer = "No lo se"
   when 4
     @answer = "De acuerdo"
   when 5
     @answer = "Totalmente de acuerdo"
  end
   options = f.radio_button(field,value) + @answer
   return options
  end


 def answer_ries(value)
   case value
   when 1
     @answer = "En total desacuerdo"
   when 2
     @answer = "En desacuerdo"
   when 3
     @answer = "No lo se"
   when 4
     @answer = "De acuerdo"
   when 5
     @answer = "Totalmente de acuerdo"
  end
   return @answer
 end
end
