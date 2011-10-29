class Square < ActiveRecord::Base
  has_many :patients
  belongs_to :county
end
