class Somatometry < ActiveRecord::Base
  belongs_to :patient
  has_one :first_time
end
