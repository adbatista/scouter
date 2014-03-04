class CreateMethodDetails < ActiveRecord::Migration
  def change
    create_table :method_details do |t|
      t.string :detail
      t.references :repository, index: true

      t.timestamps
    end
  end
end
