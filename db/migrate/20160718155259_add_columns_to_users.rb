class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer
    add_column :users, :college_id, :integer
    add_column :users, :name, :string
    add_column :users, :roles, :text
  end
end
