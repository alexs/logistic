class Category < ActiveRecord::Base
  has_many :dependencies
end
