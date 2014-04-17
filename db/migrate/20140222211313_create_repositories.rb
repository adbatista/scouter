class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.timestamps
    end
    add_index :repositories, :url, unique: true
  end
end
