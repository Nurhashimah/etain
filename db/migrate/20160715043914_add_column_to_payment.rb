class AddColumnToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :schedule_id, :integer
    add_column :payments, :reference_no, :string
  end
end
