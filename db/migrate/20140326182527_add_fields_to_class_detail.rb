class AddFieldsToClassDetail < ActiveRecord::Migration
  def change
    add_column :class_details, :lines, :integer
    add_column :class_details, :linesOfCode, :integer
    add_column :class_details, :average, :float
    add_column :class_details, :method_count, :integer
    add_column :class_details, :lines_per_method, :float
  end
end
