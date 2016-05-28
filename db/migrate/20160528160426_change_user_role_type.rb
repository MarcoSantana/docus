class ChangeUserRoleType < ActiveRecord::Migration

  def up
    change_column :users, :role, :integer, :default => 3
  end

  def down
    change_column :users, :role, :string
  end
end
