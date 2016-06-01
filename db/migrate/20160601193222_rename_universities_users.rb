class RenameUniversitiesUsers < ActiveRecord::Migration
  def change
    rename_table :universities_users, :titles
  end
end
