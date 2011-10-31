class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.date :date
      t.string :subject
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
