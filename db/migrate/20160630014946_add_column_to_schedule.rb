class AddColumnToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :departments, :string
  end
end
