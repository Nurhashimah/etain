class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :booking_id
      t.integer :customer_id
      t.string :method
      t.string :auth_code
      t.decimal :amount
      t.integer :confirmed_by
      t.datetime :confirmed_on
      t.string :status
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
