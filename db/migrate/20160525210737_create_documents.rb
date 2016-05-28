class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :type
      t.string :description
      t.date :emission_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
