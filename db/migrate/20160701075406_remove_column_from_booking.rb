class RemoveColumnFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :payment_id, :integer
  end
end
