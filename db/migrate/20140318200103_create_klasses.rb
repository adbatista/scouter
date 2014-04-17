class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string  :name
      t.float   :score
      t.float   :method_average
      t.integer :method_count
      t.references :build, index: true
      t.timestamps
    end
  end
end
