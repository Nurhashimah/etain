class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :category
      t.string :topic
      t.string :description
      t.decimal :fee
      t.integer :duration
      t.string :duration_type
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
