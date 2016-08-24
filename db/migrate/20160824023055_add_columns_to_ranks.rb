class AddColumnsToRanks < ActiveRecord::Migration
  def change
    add_column :ranks, :user_id, :integer
    add_column :ranks, :college_id, :integer
    add_column :ranks, :data, :text
  end
end
