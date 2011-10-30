class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name
      t.text :address
      t.text :phones
      t.string :contact
      t.integer :institution_type_id
      t.integer :user_id
      t.integer :quantity_team

      t.timestamps
    end
  end

  def self.down
    drop_table :institutions
  end
end
