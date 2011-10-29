class FirstTime < ActiveRecord::Base
  belongs_to :user
  belongs_to :dependency
  belongs_to :patient
  belongs_to :somatometry
end
