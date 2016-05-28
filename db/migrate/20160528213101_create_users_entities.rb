class CreateUsersEntities < ActiveRecord::Migration
  def change
    create_table :entities_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :entitiy, index: true
    end
  end
end
