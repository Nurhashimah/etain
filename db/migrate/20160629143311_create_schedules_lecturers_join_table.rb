class CreateSchedulesLecturersJoinTable < ActiveRecord::Migration
  def change
    create_table :lecturers_schedules, id: false do |t|
       t.integer :lecturer_id
       t.integer :schedule_id
    end
  end
end
