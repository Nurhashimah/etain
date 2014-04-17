class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :code
      t.integer :schedule_id
      t.integer :customer_id
      t.integer :payment_id
      t.integer :warranty_id
      t.string :status
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
