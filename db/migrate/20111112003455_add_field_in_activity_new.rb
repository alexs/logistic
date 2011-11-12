class AddFieldInActivityNew < ActiveRecord::Migration
  def self.up
    add_column :activities, :status, :integer
  end

  def self.down
  end
end
