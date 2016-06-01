class AddLevelToEntitiesUsers < ActiveRecord::Migration
  def change
    add_column :entities_users, :level, :integer
  end
end
