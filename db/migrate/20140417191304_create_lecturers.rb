class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.text :details
      t.decimal :rate
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
