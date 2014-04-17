class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :schedule_id
      t.integer :customer_id
      t.boolean :attended
      t.datetime :taken_on

      t.timestamps
    end
  end
end
