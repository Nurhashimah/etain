class AddColumnsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :details, :string
  end
end
