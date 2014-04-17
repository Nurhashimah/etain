class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :course_id
      t.datetime :scheduled_on
      t.integer :location_id
      t.integer :lecturer_by
      t.integer :max_people
      t.string :status
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
