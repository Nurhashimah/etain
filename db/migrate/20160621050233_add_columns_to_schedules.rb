class AddColumnsToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :end_on, :datetime
    rename_column :schedules, :scheduled_on, :start_on
    rename_column :schedules, :lecturer_by, :lecturer_id
  end
end
