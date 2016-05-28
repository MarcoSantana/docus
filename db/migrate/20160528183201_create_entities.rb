class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :name_short
      t.integer :type
      t.integer :level

      t.timestamps null: false
    end
  end
end
