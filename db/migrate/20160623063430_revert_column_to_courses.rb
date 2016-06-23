class RevertColumnToCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :duration_type, :integer
    add_column :courses, :duration_type, :string
  end
end
