class RemoveLevelFromUniversity < ActiveRecord::Migration
  def up
    remove_column :entities, :level
  end

  def down
    add_column :entities, :level, :integer
  end
end
