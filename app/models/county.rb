class County < ActiveRecord::Base
  has_many :squares
  belongs_to :state
end
