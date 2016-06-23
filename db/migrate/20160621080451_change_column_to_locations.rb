class ChangeColumnToLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :location_id, :region
  end
end
