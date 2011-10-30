class AddQuadrantInstitution < ActiveRecord::Migration
  def self.up
    add_column :institutions, :quadrant_id, :integer
  end

  def self.down
  end
end
