class CorrectEntityNameEntitiesUsers < ActiveRecord::Migration
  def change
    rename_column :entities_users, :entitiy_id, :entity_id
  end
end
