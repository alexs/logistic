class Appoiment < ActiveRecord::Base
  
  belongs_to :patient
  has_one :laboratory
  
end
