class RevertColumnsToLecturers < ActiveRecord::Migration
  def change
    rename_column :lecturers, :mykadno,     :details
    remove_column    :lecturers, :position,    :string
    remove_column    :lecturers, :address,     :string
    remove_column    :lecturers, :qualifications, :text
    remove_column    :lecturers, :experiences, :text
  end
end
