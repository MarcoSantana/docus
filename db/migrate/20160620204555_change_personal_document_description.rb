class ChangePersonalDocumentDescription < ActiveRecord::Migration
  def up
    remove_column :documents, :description, :string
    add_column :documents, :description, :integer
  end

  def down
    remove_column :documents, :description, :integer
    add_column :documents, :description, :string
  end
end
