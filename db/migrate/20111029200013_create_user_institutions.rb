class CreateUserInstitutions < ActiveRecord::Migration
  def self.up
    create_table :user_institutions do |t|
      t.integer :user_id
      t.integer :institution_id
      t.date :date
      t.date :visit_date
      t.time :hour_visit
      t.boolean :team
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :user_institutions
  end
end
