# -*- coding: utf-8 -*-
module ClinicalHistoriesHelper
  def get_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 5
      "No"
    elsif valor == 16
      "Suficiente"
    elsif valor == 17
      "Pobre"
    elsif valor == 18
      "Adecuada"
    elsif valor == 19
      "Excesivo"
    elsif valor == 20
      "Dieta no habitual"
    elsif valor == 21
      "Sí"
    elsif valor == 22
      "Antes del embarazo"
    elsif valor == 23
      "Durante el embarazo"
    end
  end

  def get_boolean(value)
    if value == false
      "No"
    elsif value == true
      "Si"
    end
  end

  def checked_value(valor)
    if valor == false
      image_tag("uncheck.jpg")
    else
      image_tag("checked.png")
    end
  end

  def dilated_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 1
      "0-2"
    elsif valor == 2
      "3-4"
    elsif valor == 3
      "5-6"
    elsif valor == 4
      "+7"
    end
  end

   def longitud_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 1
      "largo"
    elsif valor == 2
      "corto"
    elsif valor == 3
      "semiborrado"
    end
   end

  def consistence_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 1
      "resistente"
    elsif valor == 2
      "intermedio"
    elsif valor == 3
      "blando"
    end
  end

  def lucorre_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 1
      "escaso"
    elsif valor == 2
      "moderado"
    elsif valor == 3
      "abundante"
    end
  end

  def sangre_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 1
      "fresco"
    elsif valor == 2
      "antiguio"
    end
  end

  def fondo_value(valor)
    if valor.nil?
      "No seleccionado"
    elsif valor == 1
      "libro"
    elsif valor == 2
      "abombados"
    end
  end
end
