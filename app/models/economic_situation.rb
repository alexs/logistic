class EconomicSituation < ActiveRecord::Base
  has_many :patients
  has_many :socioeconomics
end
