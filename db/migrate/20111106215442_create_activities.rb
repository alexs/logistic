class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name
      t.text :desc
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
