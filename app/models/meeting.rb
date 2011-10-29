class Meeting < ActiveRecord::Base
  attr_accessor :period, :frequency, :commit_button
  
  belongs_to :patient
  belongs_to :dependency
  belongs_to :user
end
