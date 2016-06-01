class RenameTableEntities < ActiveRecord::Migration
  def up
    rename_column :entities_users, :entity_id, :university_id
    rename_table :entities_users, :universities_users

  end

  def down
    rename_column :universities_users, :university_id, :entity_id
    rename_table :universities_users, :entities_users

  end
end
