class ChangeColumnToCourses < ActiveRecord::Migration
  def change
    remove_column   :courses, :duration, :integer
    add_column      :courses, :duration, :decimal
    remove_column   :courses, :duration_type, :string
    add_column      :courses, :duration_type, :integer
  end
end

=begin
heres why I did it like this
duration.integer + duration_type.string
1 + days
35 + hours
so that we can use the fields directly in the code without recalc
Time.now + #{duration}.#{duration_type}
=end
