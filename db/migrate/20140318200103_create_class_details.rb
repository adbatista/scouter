class CreateClassDetails < ActiveRecord::Migration
  def change
    create_table :class_details do |t|
      t.string :class_name
      t.float :score
      t.references :repository, index: true

      t.timestamps
    end
  end
end
