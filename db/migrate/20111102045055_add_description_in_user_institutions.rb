class AddDescriptionInUserInstitutions < ActiveRecord::Migration
  def self.up
    add_column :user_institutions, :desc, :text
  end

  def self.down
  end
end
