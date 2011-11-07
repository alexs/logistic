class CreateUserActivities < ActiveRecord::Migration
  def self.up
    create_table :user_activities do |t|
      t.integer :user_id
      t.integer :activity_id
      t.text :desc
      t.date :date
      t.time :start_hour
      t.time :end_hour
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :user_activities
  end
end
