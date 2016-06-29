class CreateCustomerScheduleJoinTable < ActiveRecord::Migration
  def change
    create_table :customers_schedules, id: false  do |t|
       t.integer :customer_id
       t.integer :schedule_id
    end
  end
end
