class UserInstitution < ActiveRecord::Base
  belongs_to :institution
  belongs_to :user

  validates_uniqueness_of :institution_id, :scope => [:user_id]
end
