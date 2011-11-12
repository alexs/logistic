class AddMaxActivityParticipant < ActiveRecord::Migration
  def self.up
    add_column :activities, :quantity, :integer
  end

  def self.down
  end
end
