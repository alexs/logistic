# -*- coding: utf-8 -*-
module ClassificationsHelper
  def question_classification(f,field,value)
   case value
   when 1
     @answer = "Alto-medio"
   when 2
     @answer = "Bajo"
   when 3
     @answer = "Muy bajo"
   when 4
     @answer = "Adecuada"
   when 5
     @answer = "Inadecuada"
   when 6
     @answer = "Rechazo"
   when 7
     @answer = "1 a 3"
   when 8
     @answer = "4 a 5"
   when 9
     @answer = "seis o más"
   when 10
     @answer = "Normal"
   when 11
     @answer = "Nulipara"
   when 12
     @answer = "Difícil"
   when 13
     @answer = "Traumático"
   when 14
     @answer = "No"
   when 15
     @answer = "Dos a tres"
   when 16
     @answer = "Tres o más"
   when 17
     @answer = "Una a dos"
   when 18
     @answer = "Uno"
   when 19
     @answer = "Dos o más"
   when 20
     @answer = "Sí"
   when 21
     @answer = "Abdominal"
   when 22
     @answer = "Ginecológica"
   when 23
     @answer = "Padres"
   when 24
     @answer = "Paciente"
   when 25
     @answer = "11 o más"
   when 26
     @answer = "10.9 a 8"
   when 27
     @answer = "8 o menos"
   when 28
     @answer = "Positivo"
   when 29
     @answer = "Negativo, no sabe, isoinmunizada"
   when 30
     @answer = "Negativo isoinmunizada"
   when 31
     @answer = "Activa"
   when 32
     @answer = "Controlada"
   when 33
     @answer = "12 Hrs. o menos."
   when 34
     @answer = "Más de 12 Hrs."



   end
    options = f.radio_button(field,value) + @answer
    return options
  end

  def eval_age(age = age.to_i)
    if (age > 19 && age < 31)
      @result = "<tr><td>Edad</td><td class='normal'>#{age} años.</td><td class='odd'></td><td class='even'></td></tr>"
    elsif (age > 14 && age < 20) || (age > 30 && age < 36)
      @result = "<tr><td>Edad</td><td class='normal'></td><td class='odd'>#{age} años</td><td class='even'></td></tr>"
    elsif (age > 0 && age < 15) || age > 35
      @result = "<tr><td>Edad</td><td class='normal'></td><td class='odd'></td><td class='even'>#{age} años</td></tr>"
    else
      @result = "<tr><td>Edad</td><td class='normal'></td><td class='odd'></td><td class='even'>Sin registro o fuera de rangos</td></tr>"
    end
  end

  def eval_weight(weight)
    if !weight.nil?
      if (weight > 50 && weight < 65)
        @result = "<tr><td>Peso</td><td class='normal'>#{weight} Kg.</td><td class='odd'></td><td class='even'></td></tr>"
      elsif (weight > 64 && weight < 76) || (weight > 40 && weight < 51)
        @result = "<tr><td>Peso</td><td class='normal'></td><td class='odd'>#{weight} Kg.</td><td class='even'></td></tr>"
      elsif (weight > 75 || weight < 40)
        @result = "<tr><td>Peso</td><td class='normal'></td><td class='odd'></td><td class='even'>#{weight} Kg.</td></tr>"
      else
        @result = ""
      end
    else
      @result = "<tr><td>Peso</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

  def eval_height(height)
    if !height.nil?
      if height >= 150
        @result = "<tr><td>Estatura</td><td class='normal'>#{height} cm</td><td class='odd'></td><td class='even'></td></tr>"
      elsif (height > 144 && height < 150)
        @result = "<tr><td>Estatura</td><td class='normal'></td><td class='odd'>#{height} cm.</td><td class='even'></td></tr>"
      elsif height < 145
        @result = "<tr><td>Estatura</td><td class='normal'></td><td class='odd'></td><td class='even'>#{height} cm.</td></tr>"
      else
        @result = "<tr><td>Estatura</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado o esta fuera de rango</td></tr>"
      end
    else
      @result = "<tr><td>Estatura</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado o esta fuera de rango</td></tr>"
    end
   end

  def eval_socioeconomic(socioeconomic)
    case socioeconomic
    when 1
      @result = "<tr><td>Nivel socioeconómico</td><td class='normal'>Alto-Medio</td><td class='odd'></td><td class='even'></td></tr>"
    when 2
      @result = "<tr><td>Nivel socioeconómico</td><td class='normal'></td><td class='odd'>Bajo</td><td class='even'></td></tr>"
    when 3
      @result = "<tr><td>Nivel socioeconómico</td><td class='normal'></td><td class='odd'></td><td class='even'>Muy Bajo</td></tr>"
    else
      @result = "<tr><td>Nivel socioeconómico</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

  def eval_marital(marital)
    if marital != nil && marital == 4
      @result = "<tr><td>Estado civil</td><td class='normal'></td><td class='odd'>Viuda</td><td class='even'></td></tr>"
    elsif marital != nil && marital == 1
      @result = "<tr><td>Estado civil</td><td class='normal'></td><td class='odd'>Sin compañero - soltera</td><td class='even'></td></tr>"
    elsif marital == nil || marital == 99
      @result = "<tr><td>Estado civil</td><td class='normal'></td><td class='odd'></td><td class='even'>No sabe/sin respuesta</td></tr>"
    else
      @result = "<tr><td>Estado civil</td><td class='normal'>#{Maritalstatus.find(marital).name}</td><td class='odd'></td><td class='even'></td></tr>"
    end
  end

  def eval_schoolar(school)
    if school != nil && school == 2
      @result = "<tr><td>Escolaridad</td><td class='normal'></td><td class='odd'>#{Schooling.find(school).name}</td><td class='even'></td></tr>"
    elsif school == nil || school == 1
      @result = "<tr><td>Escolaridad</td><td class='normal'></td><td class='odd'></td><td class='even'>#{Schooling.find(school).name}</td></tr>"
    else
      @result = "<tr><td>Escolaridad</td><td class='normal'>#{Schooling.find(school).name}</td><td class='odd'></td><td class='even'></td></tr>"
    end
  end

  def eval_attitude(attitude)
    case attitude
    when 4
      @result = "<tr><td>Actitud frente al embarazo</td><td class='normal'>Adecuada</td><td class='odd'></td><td class='even'></td></tr>"
    when 5
      @result = "<tr><td>Actitud frente al embarazo</td><td class='normal'></td><td class='odd'>Inadecuada</td><td class='even'></td></tr>"
    when 6
      @result = "<tr><td>Actitud frente al embarazo</td><td class='normal'></td><td class='odd'></td><td class='even'>Rechazo</td></tr>"
    else
      @result = "<tr><td>Actitud frente al embarazo</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

  def eval_paridad(paridad)
    case paridad
    when 7
      @result = "<tr><td>Paridad</td><td class='normal'>1 a 3</td><td class='odd'></td><td class='even'></td></tr>"
    when 8
      @result = "<tr><td>Paridad</td><td class='normal'></td><td class='odd'>4 a 5</td><td class='even'></td></tr>"
    when 9
      @result = "<tr><td>Paridad</td><td class='normal'></td><td class='odd'></td><td class='even'>Seis o más</td></tr>"
    else
      @result = "<tr><td>Paridad</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

  def eval_last_pregnant(parto)
    case parto
    when 10
      @result = "<tr><td>Parto anterior</td><td class='normal'>Normal</td><td class='odd'></td><td class='even'></td></tr>"
    when 11
      @result = "<tr><td>Parto anterior</td><td class='normal'></td><td class='odd'>Nulipara</td><td class='even'></td></tr>"
    when 12
      @result = "<tr><td>Parto anterior</td><td class='normal'></td><td class='odd'>Difícil</td><td class='even'></td></tr>"
    when 13
      @result = "<tr><td>Parto anterior</td><td class='normal'></td><td class='odd'></td><td class='even'>Traumático</td></tr>"
    else
      @result = "<tr><td>Parto anterior</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

  def eval_aborts(abortos)
    case abortos
    when 14
      @result = "<tr><td>Abortos consecutivos</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 15
      @result = "<tr><td>Abortos consecutivos</td><td class='normal'></td><td class='odd'>Dos a tres</td><td class='even'></td></tr>"
    when 16
      @result = "<tr><td>Abortos consecutivos</td><td class='normal'></td><td class='odd'></td><td class='even'>Tres o más</td></tr>"
    else
      @result = "<tr><td>Abortos consecutivos</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

  def eval_cesarean(cesareas)
    case cesareas
    when 14
      @result = "<tr><td>Cesáreas previas</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 17
      @result = "<tr><td>Cesáreas previas</td><td class='normal'></td><td class='odd'>Una a dos</td><td class='even'></td></tr>"
    when 16
      @result = "<tr><td>Cesáreas previas</td><td class='normal'></td><td class='odd'></td><td class='even'>Tres o más</td></tr>"
    else
      @result = "<tr><td>Cesáreas previas</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

  def eval_childbirth_lower_37_week(child)
    case child
    when 14
      @result = "<tr><td>Partos menores a 37 SDG</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 18
      @result = "<tr><td>Partos menores a 37 SDG</td><td class='normal'></td><td class='odd'>Uno</td><td class='even'></td></tr>"
    when 19
      @result = "<tr><td>Partos menores a 37 SDG</td><td class='normal'></td><td class='odd'></td><td class='even'>Dos o más</td></tr>"
    else
      @result = "<tr><td>Partos menores a 37 SDG</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

  def eval_preclampsia(child)
    case child
    when 14
      @result = "<tr><td>Preclampsia/eclampsia</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 20
      @result = "<tr><td>Preclampsia/eclampsia</td><td class='normal'></td><td class='odd'>Sí</td><td class='even'></td></tr>"
    else
      @result = "<tr><td>Preclampsia/eclampsia</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

  def eval_children_low_25_grams(child)
    case child
    when 14
      @result = "<tr><td>Hijos 2500grs. o menos</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 18
      @result = "<tr><td>Hijos 2500grs. o menos</td><td class='normal'></td><td class='odd'>Uno</td><td class='even'></td></tr>"
    when 19
      @result = "<tr><td>Hijos 2500grs. o menos</td><td class='normal'></td><td class='odd'></td><td class='even'>Dos o más</td></tr>"
    else
      @result = "<tr><td>Hijos 2500grs. o menos</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

   def eval_children_more_40_grams(child)
    case child
    when 14
      @result = "<tr><td>Hijos 4000grs. o más</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 18
      @result = "<tr><td>Hijos 4000grs. o más</td><td class='normal'></td><td class='odd'>Uno</td><td class='even'></td></tr>"
    when 19
      @result = "<tr><td>Hijos 4000grs. o más</td><td class='normal'></td><td class='odd'></td><td class='even'>Dos o más</td></tr>"
    else
      @result = "<tr><td>Hijos 4000grs. o más</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_perinatals_deads(deads)
    case deads
    when 14
      @result = "<tr><td>Muertes perinatales</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 18
      @result = "<tr><td>Muertes perinatales</td><td class='normal'></td><td class='odd'>Uno</td><td class='even'></td></tr>"
    when 19
      @result = "<tr><td>Muertes perinatales</td><td class='normal'></td><td class='odd'></td><td class='even'>Dos o más</td></tr>"
    else
      @result = "<tr><td>Muertes perinatales</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

     def eval_children_with_congenitals_defects(child)
    case child
    when 14
      @result = "<tr><td>Hijo malformado</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 18
      @result = "<tr><td>Hijo malformado</td><td class='normal'></td><td class='odd'>Uno</td><td class='even'></td></tr>"
    when 19
      @result = "<tr><td>Hijo malformado</td><td class='normal'></td><td class='odd'></td><td class='even'>Dos o más</td></tr>"
    else
      @result = "<tr><td>Hijo malformado</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

   def eval_last_surgery(cirugia)
    case cirugia
    when 14
      @result = "<tr><td>Cirugía previa</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 21
      @result = "<tr><td>Cirugía previa</td><td class='normal'></td><td class='odd'>Abdominal</td><td class='even'></td></tr>"
    when 22
      @result = "<tr><td>Cirugía previa</td><td class='normal'></td><td class='odd'></td><td class='even'>Ginecológico</td></tr>"
    else
      @result = "<tr><td>cirugía previa</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_history_diabetes(diabetes)
    case diabetes
    when 14
      @result = "<tr><td>Antecedentes diabéticos</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 23
      @result = "<tr><td>Antecedentes diabéticos</td><td class='normal'></td><td class='odd'>Padres</td><td class='even'></td></tr>"
    when 24
      @result = "<tr><td>Antecedentes diabéticos</td><td class='normal'></td><td class='odd'></td><td class='even'>Pacientes</td></tr>"
    else
      @result = "<tr><td>Antecedentes diabéticos</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

   def eval_history_hypertension(hiper)
   case hiper
    when 14
      @result = "<tr><td>Antecedentes hipertensivos</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 23
      @result = "<tr><td>Antecedentes hipertensivos</td><td class='normal'></td><td class='odd'>Padres</td><td class='even'></td></tr>"
    when 24
      @result = "<tr><td>Antecedentes hipertensivos</td><td class='normal'></td><td class='odd'></td><td class='even'>Pacientes</td></tr>"
    else
      @result = "<tr><td>Antecedentes hipertensivos</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

   def eval_hemoglobin(hemoglobin)
    case hemoglobin
    when 25
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'>11 o más</td><td class='odd'></td><td class='even'></td></tr>"
    when 26
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'></td><td class='odd'>10.9 a 8</td><td class='even'></td></tr>"
    when 27
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'></td><td class='odd'></td><td class='even'>8 o menos</td></tr>"
    else
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_hemoglobin(hemoglobin)
    case hemoglobin
    when 25
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'>11 o más</td><td class='odd'></td><td class='even'></td></tr>"
    when 26
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'></td><td class='odd'>10.9 a 8</td><td class='even'></td></tr>"
    when 27
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'></td><td class='odd'></td><td class='even'>8 o menos</td></tr>"
    else
      @result = "<tr><td>Hemoglobina (gramos)</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_rh_factor(rh)
    case rh
    when 28
      @result = "<tr><td>Factor RH</td><td class='normal'>Positivo</td><td class='odd'></td><td class='even'></td></tr>"
    when 29
      @result = "<tr><td>Factor RH</td><td class='normal'></td><td class='odd'>Negativo No sabe Isoinmunizada</td><td class='even'></td></tr>"
    when 30
      @result = "<tr><td>Factor RH</td><td class='normal'></td><td class='odd'></td><td class='even'>Negativo Isoinmunizada</td></tr>"
    else
      @result = "<tr><td>Factor RH</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_smoking(smoke)
    case smoke
    when 14
      @result = "<tr><td>Tabaquismo</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 20
      @result = "<tr><td>Tabaquismo</td><td class='normal'></td><td class='odd'>Sí</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Tabaquismo</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Tabaquismo</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_alcoholism(alcohol)
    case alcohol
    when 14
      @result = "<tr><td>Alcoholismo</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 20
      @result = "<tr><td>Alcoholismo</td><td class='normal'></td><td class='odd'>Sí</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Alcoholismo</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Alcoholismo</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end

   def eval_addiction(addiction)
    case addiction
    when 14
      @result = "<tr><td>Toxicomanías</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 20
      @result = "<tr><td>Toxicomanías</td><td class='normal'></td><td class='odd'>Sí</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Toxicomanías</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Toxicomanías</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_diabetes(diabetes)
    case diabetes
    when 14
      @result = "<tr><td>Diabetes Mellitus</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
      @result = "<tr><td>Diabetes Mellitus</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Diabetes Mellitus</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Diabetes Mellitus</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_hypertension_cronic(hypertension)
     case hypertension
    when 14
      @result = "<tr><td>Hipertensión Crónica</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Hipertensión Crónica</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>>Hipertensión Crónica</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>>Hipertensión Crónica</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_preeclampsia2(preeclampsia)
    case preeclampsia
    when 14
      @result = "<tr><td>Preeclampsia</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Preeclampsia</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Preeclampsia</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Preeclampsia</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_epilepsia(epilepsia)
    case epilepsia
    when 14
      @result = "<tr><td>Epilepsia</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Epilepsia</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Epilepsia</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Epilepsia</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_cardiopatia(cardiopatia)
    case cardiopatia
    when 14
      @result = "<tr><td>Cardiopatía</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Cadiopatía</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Cadiopatía</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Cadiopatía</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
  end


   def eval_colagenopatia(colageno)
    case colageno
    when 14
      @result = "<tr><td>Colagenopatía</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Colagenopatía</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Colagenopatía</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Colagenopatía</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

  def eval_nefropatia(nefropatia)
    case nefropatia
    when 14
      @result = "<tr><td>Nefropatía</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Nefropatía</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Nefropatía</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Nefropatía</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_endocrinopatias(endocrinopatias)
    case endocrinopatias
    when 14
      @result = "<tr><td>Endocrinopatias</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Endocrinopatias</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Endocrinopatias</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Endocrinopatias</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_consanguinidad(consanguinidad)
    case consanguinidad
    when 14
      @result = "<tr><td>Consanguinidad</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 32
       @result = "<tr><td>Consanguinidad</td><td class='normal'></td><td class='odd'>Constrolada</td><td class='even'></td></tr>"
    when 20
      @result = "<tr><td>Consanguinidad</td><td class='normal'></td><td class='odd'></td><td class='even'>Sì</td></tr>"
    else
      @result = "<tr><td>Consanguinidad</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_amenaza_aborto(amenaza)
    case amenaza
    when 14
      @result = "<tr><td>Amenaza de aborto</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 33
       @result = "<tr><td>Amenaza de aborto</td><td class='normal'></td><td class='odd'>12 hrs. o menos</td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Amenaza de aborto</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Amenaza de aborto</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_amenaza_parto_pretermino(amenaza_pretermino)
    case amenaza_pretermino
    when 14
      @result = "<tr><td>Amenaza Parto Pretermino</td><td class='normal'>No</td><td class='odd'></td><td class='even'></td></tr>"
    when 31
      @result = "<tr><td>Amenaza Parto Pretermino</td><td class='normal'></td><td class='odd'></td><td class='even'>Activa</td></tr>"
    else
      @result = "<tr><td>Amenaza Parto Pretermino</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end

   def eval_ruptura_membranas(ruptura)
    case ruptura
    when 34
      @result = "<tr><td>Ruptura de membrana</td><td class='normal'></td><td class='odd'></td><td class='even'>Más de 12 Hrs.</td></tr>"
    else
      @result = "<tr><td>Ruptura de membrana</td><td class='normal'></td><td class='odd'></td><td class='even'>No se ha capturado</td></tr>"
    end
   end
 end
