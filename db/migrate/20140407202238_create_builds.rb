class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.references :repository, index: true
      t.string :aasm_state

      t.timestamps
    end
  end
end
