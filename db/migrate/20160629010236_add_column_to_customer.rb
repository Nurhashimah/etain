class AddColumnToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :position, :string
  end
end
