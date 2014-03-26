class AddFieldsToClassDetail < ActiveRecord::Migration
  def change
    add_column :class_details, :method_average, :float
    add_column :class_details, :method_count, :integer
  end
end
