class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :shortname
      t.string :name
      t.integer :category
      t.integer :rate

      t.timestamps
    end
  end
end
