class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :location_id
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
