class RenameTableEntitiesToUniversities < ActiveRecord::Migration
  def change
    rename_column :entities, :type, :level
    rename_table :entities, :universities
  end


end
