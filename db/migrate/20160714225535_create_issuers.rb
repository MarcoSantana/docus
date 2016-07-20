class CreateIssuers < ActiveRecord::Migration
  def change
    create_table :issuers do |t|
      t.string :name
      t.string :name_short
      t.boolean :status
      t.timestamps null: false
    end
  end
end
