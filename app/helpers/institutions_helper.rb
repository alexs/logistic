# -*- coding: utf-8 -*-
module InstitutionsHelper
  def institution_type(val)
    if val == 1
      "Médica"
    elsif val == 2
      "Educativa"
    else
      "Otro"
    end
  end
end
