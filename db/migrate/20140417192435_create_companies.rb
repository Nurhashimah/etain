class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_code
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.string :fax
      t.integer :user_id
      t.integer :college_id
      t.string :data

      t.timestamps
    end
  end
end
