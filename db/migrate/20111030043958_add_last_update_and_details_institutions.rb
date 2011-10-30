class AddLastUpdateAndDetailsInstitutions < ActiveRecord::Migration
  def self.up
    add_column :institutions, :user_update_id, :integer
    add_column :institutions, :desc, :text
  end

  def self.down
  end
end
