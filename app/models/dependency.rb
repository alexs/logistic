class Dependency < ActiveRecord::Base
  belongs_to :category
  belongs_to :dependency

  has_many :users
  has_many :dependencies


  def full_name
   "#{self.category.name} #{self.name}"
  end
end
