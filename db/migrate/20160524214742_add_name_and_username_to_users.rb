class AddNameAndUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string

    add_index :users, :name
    add_index :users, :last_name
  end
end
