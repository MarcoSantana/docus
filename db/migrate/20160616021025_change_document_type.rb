class ChangeDocumentType < ActiveRecord::Migration
  def change
    change_column :documents, :type, :string
  end
end
