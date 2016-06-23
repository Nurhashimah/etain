class AddColumnsToLecturers < ActiveRecord::Migration
  def change
    rename_column :lecturers, :details, :mykadno
    add_column :lecturers, :position, :string
    add_column :lecturers, :address, :string
    add_column :lecturers, :qualifications, :text
    add_column :lecturers, :experiences, :text
  end
end
