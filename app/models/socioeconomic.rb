class Socioeconomic < ActiveRecord::Base
  belongs_to :socioeconomic_ocupation
  belongs_to :economic_situation
  belongs_to :tipo_vivienda
  belongs_to :patient

  validates_uniqueness_of :patient_id
end
