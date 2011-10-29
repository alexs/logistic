class CreateMasters < ActiveRecord::Migration
  def self.up
    create_table :masters do |t|
      t.integer :name

      t.timestamps
    end
  end

  def self.down
    drop_table :masters
  end
end
