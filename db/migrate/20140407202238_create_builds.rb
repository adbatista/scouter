class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.references :repository, index: true
      t.string :state

      t.timestamps
    end
  end
end
