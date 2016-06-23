class ChangeColumnToCourses < ActiveRecord::Migration
  def change
    remove_column   :courses, :duration, :integer
    add_column      :courses, :duration, :decimal
    remove_column   :courses, :duration_type, :string
    add_column      :courses, :duration_type, :integer
  end
end
