class AddColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :rank_id, :integer
  end
end
