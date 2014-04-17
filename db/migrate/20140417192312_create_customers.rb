class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :id_no
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :corporate
      t.integer :company_id
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
